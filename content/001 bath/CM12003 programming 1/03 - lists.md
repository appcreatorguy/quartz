#lecture 
# 03 - lists
class: [[CM12003]]
topics mentioned: #haskell #lists 
date: 2024-10-07
teacher: [[Willem Heijltj]]

[[haskell lists|lists]] are extremely useful in [[functional programming]].
they take many roles:
+ hold multiple outputs of a [[function]]
+ data to be processed by a function
+ steps to take in a computation
## defining lists
in [[02 - functions#Lists|Lecture 2]] we learnt that we can define lists as `[1,2,3]`. however, this is a shorthand. the formal definition for a list is using two *constructors* `[]` and `:`
```haskell
[]        -- "nil" : the empty list
x:xs      -- "cons": add the item x to the list xs
```

> [!EXAMPLE]
> ```haskell
> 1           : [2,3]        -- [1,2,3]
> 'a'         : "bcd"        -- "abcd"
> 1 : 2 : 3   : []           -- [1,2,3]
> ```


## pattern matching
we also use these constructors to define [[function|functions]] that do work on [[haskell lists|lists]].
```haskell
isEmpty :: [a] -> Bool
isEmpty []     = True
isEmpty (x:xs) = False
```
this is called *pattern-matching*. there is a pattern, or function definition for each type of list constructor, one for the empty list, and one for a list with items, that is split into the head, and the tail list.

> [!EXAMPLE]
> under the hood, when you pass a full list to a pattern-matching function, the list is split into head and tail.
> ```haskell
>    isEmpty [1,2,3]
> == isEmpty ( 1 : [2,3] )
> == isEmpty ( x : xs )     -- where x = 1, xs = [2,3]
> ```

> [!TIP]
> pairs are also pattern-matching!
> pairs have the constructor `(,)` and are matched to the pattern `(x,y)`.
> ```haskell
> vectorAdd :: Vector2 -> Vector2 -> Vector2
> vectorAdd (x1,y1) (x2,y2) = ...
> ```

## [[haskell lists|list]] [[recursion]]
in [[haskell]] list [[function|functions]] can be recursive; they can call themselves.
```haskell
sum :: [Int] -> [Int]
sum []        = 0
sum (x:xs)    = x + sum xs
```
here, we are passing `xs` to the sum function again, where another head is pulled off to become x again, repeatedly until the base case, where there is no head to split off, so we return 0 and backtrack.

> [!FAQ] adding to the end of a list
> to add an element to the end of a list, there is no built-in, and so the element must be bubbled to the end of the list, either recursively or through the concatenator (`++`)
> ```haskell
> append :: a -> [a] -> [a]
> append x []        = [x]
> append x (y:ys)    = y : append x ys
> ```
## [[haskell lazy evaluation|lazy evaluation]]
in haskell, expressions are only evaluated until they are needed, not when they are defined, or bound to variables. this is why haskell is called a *lazy* language.
this means we can define lists of *"infinite"* length, and as long as we index a finite length, haskell is happy to evaluate it.
```haskell
countUp :: Int -> [Int]
countUp n = n : countUp (n+1)

sumx :: Int -> Int -> [Int] -> Int
sumx _ s [] = s
sumx n s (x:xs)
    | n <= 0    = s
    | otherwise = sumx (n - 1) (s + x) xs

ghci> sum 20 0 (countUp 5)    -- 290
```