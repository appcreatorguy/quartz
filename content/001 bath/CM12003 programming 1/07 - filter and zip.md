#lecture
# 07 - filter and zip
class: [[CM12003]]
topics mentioned: #lists #haskell 
date: 2024-10-21
teacher: [[Willem Heijltj]]
## filtering
recall the `map` function:
```haskell
map :: (a -> b) -> [a] -> [b]
```
[[haskell]] also includes a similar function called `filter`, which filters items from a list based on a filter [[function]].
```haskell
filter :: (a -> Bool) -> [a] -> [a]
filter p []      = []
filter p (x:xs)
	| p x        = x : filter p xs
	| otherwise  =     filter p xs
```
here, the argument `p` is called the *[[predicate]]*, or *test*. the function will keep all elements that make `p` true, and will discard all others.
## zip
in [[2-Lists.pdf]], we wrote a function, called `pairs` that would take two lists and pair consecutive elements from both into pairs. this is actually a built-in in haskell, and it's called `zip`:
```haskell
zip :: [a] -> [b] -> [(a,b)]
zip _ []          = []
zip [] _          = []
zip (x:xs) (y:ys) = (x,y) : zip xs ys
```

```shellsession
ghci> zip [1,2,3] [4,5,6]
[(1,4),(2,5),(3,6)]
```
as shown, the function is smart, and if either list is finished, the function ends, so we can even pass in infinite lists, thanks to haskell being *lazy*.
### zip with a [[function]]
sometimes, we want to zip two lists into one, while applying a function to the two elements of the lists, like adding them together. this is a common enough use case that there's a built-in for this as well, called `zipWith`:
```haskell
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith _ []     _      = []
zipWith _ _      []     = []
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys
```
## [[function composition]] 
![[function composition]]

of course this dot **is also a function**!
```hs
(.) :: (b -> c) -> (a -> b) -> a -> c
(g . f) x = g (f x)
```