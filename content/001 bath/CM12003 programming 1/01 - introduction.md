#lecture 
# introduction
class: [[CM12003]]
topics mentioned: #haskell #intro 
date: 2024-09-30
teacher: [[Willem Heijltj]]
## functional programming

^4a1179

a function in mathematics takes a number of inputs and produces an output
 this is similar to computer science, where functions take inputs, run computation and then produce an output.
however, in [[functional programming]] *functions are data*; they can be passed as input and given as output to other functions
## haskell
[[haskell]] is one of the most popular functional programming languages
the most basic program in haskell looks like this:
```haskell
factorial:: Integer -> Integer
factorial n
	| n <= 1    = 1
	| otherwise = n * factorial (n - 1)
```
line 1 defines a [[function]] *factorial* which takes in an integer, and returns an integer
lines 2-4 then define the factorial function itself, with 2 conditions: 
+ if n <= 1, it returns 1
+ otherwise, it will return the factorial of the number previous multiplied by the number itself
## interpreters vs compilers
+ [[interpreter]]: executes functions in an interactive environment, line-by-line
+ [[compiler]]: translates a program into another, lower-level programming language, and then often creates an executable file
[[haskell]] has both a interpreter ([[GHC|GHCi]]) and a compiler ([[GHC]]).
## [[haskell boolean expressions]]
## guards
```haskell
absolute n
    | n < 0     = -n
    | otherwise = n
```
[[guards]] let functions have multiple *cases*, depending on certain boolean conditions
**the first guard to succeed is the one that determines the functions output**
*otherwise* is analogous to else, it always returns `True`.
## recursion
a function that employs [[recursion]] is one that calls itself. haskell functions can easily be made recursive:
```haskell
factorial n
    | n <= 1    = 1
    | otherwise = n * factorial (n-1)
```
## types
[[haskell]] is a typed language. everything has a [[type]].
```haskell
x :: Integer
x = 17

addsix :: Integer -> Integer
addsix x = x + 6
```
line 1,3 are type declarations. type declarations can declare the type of variables or functions, as to the compiler functions and data are alike.
### function types
[[function]] [[type]]s have the form `a -> b` 
	where `a` is the *input* type and `b` is the *output* type
## [[haskell base types]]
## polymorphism
haskell employs [[polymorphism]], where the same expression can have different types. for example:
```haskell
3 :: Integer
3 :: Int
3 :: Float

addsix :: Integer -> Integer
addsix :: Int -> Int
addsix :: Float -> Float
```
however haskell will **not convert between types implicitly**, and will return a type error.