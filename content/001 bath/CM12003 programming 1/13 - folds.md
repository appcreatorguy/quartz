#lecture
# 13 - folds
class: [[CM12003]]
topics mentioned: #haskell #folds
date: 2024-11-18
teacher: [[Willem Heijltj]]

## folding
the folding pattern looks like this:
```haskell
function []     = nil_case
function (x:xs) = cons_case x (function xs)
```
+ `nil_case` is the base return value
+ `cons_case` is a function that combines `x` and the recursive call on the tail to give an inductive return value.
for example, for a sum function:
```haskell
sum []     = 0
sum (x:xs) = x + sum xs
```
the `nil_case` is 0, and the `cons_case` function is `+`.
### `foldr`
[[haskell]] gives us a [[function]] that abstracts over this pattern, called `foldr`.
```haskell
foldr :: (a -> b -> b) -> b -> [a] -> b
```
> [!EXAMPLE] example
> we can use `foldr` to define functions such as `sum` and `product` on a list.
> ```haskell
> sum      = foldr (+) 0
> product = foldr (*) 1
> length   = foldr  f  0
> 	where f _ n = n+1 		
> ```
