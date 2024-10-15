#lecture 
# 04 - map
class: [[CM12003]]
topics mentioned: #type #haskell
date: 2024-10-09
teacher:[[Marina De Vos]]

## type classes
when looking at the type for addition (+), we see:
```haskell
(+) :: Num a => a -> a -> a
```
we see that it takes two inputs of type a and returns a value of type a.
however, the type here is *specialised*. all the values must be **the same type** but the compiler will allow addition to work with **any number type**. this is done through a [[type constraint]], here shown by `Num a =>`.
here `Num` is a special type, that holds a collection of other types. we call this a *[[haskell type class|type class]]*.
> [!EXAMPLE] more type classes 
> here are some type classes, as well as the functions that utilise them:
> + `Eq`: values that can be tested for equality (`==`)
> + `Ord`: values that are ordered. includes `Eq` (`<`)
> + `Num`: values that are numbers (`+`,`*`,`-`)
> + `Show`: values that can be printed as strings (`show`)

## map
the `map` function takes two arguments, a [[function]] and a [[haskell lists|list]], and applies the function to each argument of the list.
```haskell
map :: (a -> b) -> [a] -> [b]
map f []     = []
map f (x:xs) = f x : map f xs
```
## partial application
arguments to a [[function]] are applied one at a time.
```haskell
max     :: Int -> Int -> Int
max 3   :: Int -> Int
max 3 5 :: Int
```
passing a function less than the total number of arguments simply returns a function that requires the remaining arguments.
## sections
*sections* are partially applied *infix operators* (+,-,<,etc.). they are written in parentheses:
```haskell
(<)   :: Int -> Int -> Bool
(3<)  :: Int -> Bool
(<5)  :: Int -> Bool
3 < 5 :: Bool
```
we can treat them as functions and pass them as inputs to other functions.