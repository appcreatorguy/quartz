#lecture
# 08 - list comprehensions
class: [[CM12003]]
topics mentioned: #lists #haskell 
date: 2024-10-23
teacher: [[Marina De Vos]]
## [[list comprehension]]
in [[haskell]], a [[list comprehension]] can be done with the following syntax 
```haskell
let x = [3*n + 1 | n <- [0..10]]
```
the syntax follows a two part structure:
+ there is one function that is an expression to filter on each element of the [[list comprehension]] 
+ there is one or more generator functions to generate [[haskell lists|list]](s) whose elements are passed to the filter function in turn.
there can be many generators, and each one refines the previous one, which means that each one will run for each element of the previous list. 
> [!HELP]
> [[list comprehension]] is a *syntactic sugar* for a combination of maps and filters. for example:
> ```haskell
> [ 3*n + 1 | n <- [0..10] , even n ]
> ```
> could be written as
> ```haskell
> map f (filter even [0..10])
> 	where f n = 3*n + 1
> ```
> or even with sections and composition:
> ```haskell
> (map ((+1).(3*)) . filter even) [0..10]
> ```
### [[guards]]
you can also add boolean [[guards]], for example:
```haskell
let n = [(x,y) | n <- [1..5] , y <- [1..5], even n]
```
as each consecutive function refine the previous, the `even n` guard will only select even values of n from 1-5 to be used, and so this will give the output:
```haskell
ghci> n
[(2,1),(2,2),(2,3),(2,4),(2,5),(4,1),(4,2),...
```
### definitions
other than generators and [[guards]], comprehensions can also include *definitions*:
```haskell
[... | ... , let x = expr , ...]
```
for example:
```haskell
let n = [x | i <- [1..10], let x = i*i, x <= 50]

ghci> n
[1,4,9,16,25,36,49]
```

## [[lambda]]s
in [[haskell]] you can also write **anonymous functions**, or *[[lambda]]s*.
a [[lambda]] is written using this syntax:
```haskell
\ x -> x + 1
```
> [!info]
> the `\` here is supposed to look like a lambda ($\lambda$) :3

they can also take multiple inputs:
```haskell
\ x ... xn -> expr
```
for example:
```haskell
zipWith (\ x y -> x ++ " " ++ y) [0..2] [3..5] -- [0,3],[1,4],[2,5]
```
this often comes in useful when you're defining more complex functions to be run over a list in a `zip` or `filter` command, but you don't necessarily want to name the function. for example:
```haskell
filter (\x -> mod x 3 /= 0) [3,5..20] -- [5,7,11,13,17,19]
```
