#lecture 
# 02 - functions
class: [[CM12003]]
topics mentioned: #haskell #functions #lists 
date: 2024-10-02
teacher: [[Marina De Vos]]

# functions
as mentioned in [[001 bath/CM12003 programming 1/01 - introduction#^4a1179|01 - introduction]], [[functional programming]] is where programs are described similarly to mathematical functions, with multiple inputs mapping to a single output.

## referential transparency
when given identical inputs, *mathematical* functions will **always** **give the same** output
however, *programming* [[function|functions]] **may give different** outputs.
this is because they can have [[side effects]], such as:
+ reading (and writing) to/from *memory*
+ reading (and writing) to/from *the user*
+ using *randomness*

> [!IMPORTANT]
> + a programming function is *pure* if it has no side-effects.
> + a programming function is *referentially transparent* if its output is fully determined by it's inputs (alike to a *mathematical* function)

referential transparency makes it easy to tell what a program is going to do.
this is because it is safe for the code to be *refactored* or replaced by a different piece of code that gives an equivalent output. this is either done by the programmer, or through compile-time [[optimization]].

[[haskell]] is referentially transparent. the [[GHC]] compiler optimises code aggressively. 


## multiple arguments
arguments can be passed in two ways in haskell:
+ one by one (standard)
	`g x y   = sqrt (x^2 + y^2)`
+ as a **pair** (*curried*)
	`h (x,y) = sqrt (x^2 + y^2)`

> [!WARNING]
> in haskell, there are **no procedures**. everything is a function.
## [[type|types]]
a functions argument types are given using the form:
```haskell
Type_1 -> Type_1 -> ... -> Type_n -> Type_r
```
where `Type_1...Type_r` are the types of the inputs, and `Type_r` is the type of the output

Types are **always in *CamelCase***.

> [!EXAMPLE]
> ```haskell
> max :: Int -> Int -> Int
> ```
### pairs
data can occur in *pairs* in haskell. [[pairs]] are data types in them self. for example, a pair could represent a 2D vector:
```haskell
vec1:: (Float, Float)
vec1 = (2.987, 9.239)
```
### type aliasing
haskell types can be given names, or [[haskell type aliasing|aliases]].
this is done with the keyword *type*.
```haskell
type Distance = Float
type Angle    = Float
type Vector2D = (Distance, Distance)
type Polar    = (Angle, Distance)
```
functions can then accept type aliases.
```haskell
toCartesian :: Polar -> Vector2D
toPolar     :: Vector2D -> Polar
```

### any type
the *any* or *generic* type in haskell is denoted by a variable name.

```haskell
fst:: (a,b) -> a
fst (x,_) = x
```

> here, `_` is used as shorthand to denote an unused parameter

> [!INFO]
> this can actually be **more** useful than concrete typing in some cases. For example if a function was to have the definition `sum :: [Int] -> Int` this would not allow it to work with any other number type, only `Int`. If instead we redefined it as `sum :: (Num a) => [a] -> a`, it could accept any type `Num`.
## polymorphism
[[haskell]] functions are *polymorphic*. they can have more than one type as a parameter.
for example the list concatenator (`+++`) will work on both `String` and `[a]`:
```haskell
"Test"  ++ "String"    -- "TestString"
[1,2,3] ++ [4,5,6]     -- [1,2,3,4,5,6]
```
## function nesting
a function that has one or more of its arguments as being itself another function is a *higher-order function*. this is a **key feature** of [[functional programming]].
> [!EXAMPLE]
>```haskell
>map :: (a -> b) -> [a] -> [b]
>```
>here, `map` takes in a function that itself takes in a input `a` and gives output `b`. `map` would run this function on each item of type `a` in `[a]` and return each output of type `b` in a list `[b]`.

these inner functions are called [[predicate|predicates]], or *tests*.
### everything is a function!
[[haskell]] does not make a distinction between [[function|functions]] and *values*. there are no base data types. everything is a function under-the-hood!
# lists
A [[haskell lists|list]] is a sequence of elements of **the same type**.
```haskell
[x,y,z,...]
```
lists are typed in the form where a list of type `a` is typed as `[a]`.
```haskell
[1,2,3,4,5] :: [Int]
[True,False] :: [Bool]
[’a’,’b’,’c’] :: [Char]
["Brouwer","Heyting","De Bruijn","Dijkstra"] :: [String]
[ [3], [1,8], [], [4,5,6] ] :: [[Int]]
```
## strings
*strings* are also lists under-the-hood!
```haskell
type String = [Char]

-- These two are the same!
"abc" :: String
['a','b','c'] :: [Char]
```

## list functions
+ `length`
+ concatenator (`++`)
+ `take`
+ `reverse`
> take is a special function, that will return the first *x* values from a list when passed an integer and a list.

