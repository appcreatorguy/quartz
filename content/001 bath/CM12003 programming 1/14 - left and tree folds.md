#lecture
# 14 - left and tree folds
class: [[CM12003]]
topics mentioned: #haskell #folds 
date: 2024-11-26
teacher: [[Marina De Vos]]
## [[tail recursion]] expanded
our tail-recursive list functions are all of the following form:
```haskell
tailrec a []     = a
tailrec a (x:xs) = tailrec (f a x) xs
```
## `foldl` - the left fold
this pattern can be captured by the higher-order function `foldl`, which folds a list from the left:
```haskell
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f u []     = u
foldl f u (x:xs) = foldl f (f u x) xs
```
### strict left folds
`foldl'` is a *strict* version of the left fold. this means that it is not lazily evaluated, and the function `f` is applied to the accumulator and the current element before the recursive call.
```haskell
-- regular foldl
add = foldl (+) 0
add [1..5] == foldl (+) 0 [1,2,3,4,5]
		   == foldl (+) (0+1) [2,3,4,5]
		   == foldl (+) (0+1+2) [3,4,5]
		   == foldl (+) (0+1+2+3) [4,5]
		   == foldl (+) (0+1+2+3+4) [5]
		   == foldl (+) (0+1+2+3+4+5) []
		   == (0+1+2+3+4+5) 
		   == 15

-- strict foldl'
add = foldl’ (+) 0
add [1,2,3,4,5]  == foldl’ (+) 0 [1,2,3,4,5]
		         == foldl’ (+) 1 [2,3,4,5]
				 == foldl’ (+) 3 [3,4,5]
				 == foldl’ (+) 6 [4,5]
				 == foldl’ (+) 10 [4]
				 == foldl’ (+) 15 []
				 == 15
```
## folding trees
we can fold not only [[haskell lists|lists]], but [[tree]]s too. we know that `foldr` replaces `(:)` and `[]` with functions. the same works on trees:
```haskell
Node 3 (Node 1 Empty (Node 2 Empty Empty)) Empty
 f   3 ( f   1   u   ( f   2   u     u  ))   u
```

 >[!EXAMPLE] example
 >we can use a folding pattern to define functions like `sum` and `flatten` on trees:
> ```haskell
> data Tree a = Empty | Node a (Tree a) (Tree a)
> 
> sum :: Num a => Tree a -> a
> sum Empty = 0
> sum (Node x l r) = x + sum l + sum r
> 
> flatten :: Tree a -> [a]
> flatten Empty = []
> flatten (Node x l r) = flatten l ++ [x] ++ flatten r
> ```

### `treefold`
we can generalise this type of fold to a function, we can call `treefold`:
```haskell
fold :: (a -> b -> b -> b) -> b -> Tree a -> b
fold f u Empty = u
fold f u (Node x l r) = f x (fold f u l) (fold f u l)

sum :: Num => Tree a -> a
sum = fold f 0
	where f x l r = x + l + r

flatten :: Tree a -> [a]
flatten = fold f []
	where f x l r = x ++ [x] ++ r
```
