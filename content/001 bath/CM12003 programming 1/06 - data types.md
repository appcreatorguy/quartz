#lecture
# 06 - data types
class: [[CM12003]]
topics mentioned: #type #haskell
date: 2024-10-17
teacher: [[Marina De Vos]]
## the `data` keyword
how are [[haskell lists]] defined internally?
```haskell
data [a] = [] | a : [a]
```
this code:
+ defines a new data [[type]] `[a]`
+ states that it has two [[haskell constructor|constructors]] of the form:
	+ `[]`, or
	+ `x:xs`, where `x::a` and `xs::[a]`
### booleans
the booleans are defined as follows:
```haskell
data Bool = False | True
```
this data type defines two literals that the `Bool` type can take on.
## constructors are actually [[function]]s!
a data [[type]] for *fractions* can be defined as follows:
```haskell
data Fraction = Fraction Integer Integer
```
this defines a new data type with name `Fraction` and [[haskell constructor|constructor]] with the form `Fraction n d`, where n and d are both integers. here, the constructor is a function, and must take in tcanwo `Integer`s. in fact, even these literals from before are also functions!
> [!TIP]
> here the type name `Fraction` and data constructor `Fraction` both have the same name! this is not only possible, but encouraged when there is only one data constructor.
## pattern matching data types 
we can write functions that use these data types, for example one to create the simplest form of a `Fraction`:
```haskell
myFraction :: Integer -> Integer -> MyFraction
myFraction n d = MyFraction (div n x) (div d x)
  where x = gcd n d
```
however, we can also use *[[pattern-matching]]* in our functions in [[haskell]]:
```haskell
plus (MyFraction n1 d1) (MyFraction n2 d2) =
	myFraction (n1*n2 + n2*d1) (d1*d2) -- cross multiply and simplify
```
because of our type definition, we can easily use it again here to pattern match the constructor, just like we pattern match the two [[haskell lists|list]] [[haskell constructor|constructor]]s for lists.
## subclassing types
when we define a [[type]] in [[haskell]] we can specify what [[haskell type class|type classes]] it is a part of. we do this using the `deriving` keyword.
```haskell
data MyFraction = MyFraction Integer Integer
	deriving Show               -- one class, or
	deriving (Eq, Show)    -- multiple classes
```
when we use these, haskell gives a "default" class instance, so some basic functions will work immediately, like `Show` and `Eq` for instance to print and equate types.
## polymorphic [[type]]s
we can *parameterise* our types in haskell, for example if we were making a pair clone:
```haskell
data Pair a b = Pair a b
```
by using parameters here instead of concrete types, the data type has become [[polymorphism|polymorphic]]. you could [[pattern-matching|pattern-match]] for the pair with `Pair x y`, where `x::a` and `y::b`.
## [[haskell tuples]]
![[haskell tuples|haskell tuples]]
## `Maybe`: optional returns
[[haskell]] has a built-in type `Maybe a` for a *partial functions*, or [[function]]s that may not always return a value.
```haskell
data Maybe a = Nothing | Just a
```
a function that says it returns `Maybe a` can either return a value `a` through the case `Just x` where `x::a` or it can return `Nothing`
```haskell
divide :: Int -> Int -> Maybe Int
divide n 0 = Nothing -- safer than giving an error
divide n m = Just (div n m)
```
## `Either`: return type unions
another built-in is `Either a b`
```haskell
data Either a b = Left a | Right b
```
a function that says it returns `Either a b` can either return `Left a` or `Right b`.
> [!TIP]
> `Either` is commonly used for functions that *need* to return errors, and it's common practice for the `Left str` to return the error and the `Right x` to return the value.
> think: not right = wrong (left)!
## inductive data types
in [[haskell]], data type declarations can be *inductive* or recursive:
```haskell
data PeaNum = Succ PeaNum | Zero
```
here we're defining the natural numbers through induction, where every number is stored as the increment of the one before it, all the way down to zero:
```haskell
four = Succ (Succ (Succ (Succ Zero)))
```
we can then use [[pattern-matching]] to create functions for this data [[type]]:
```haskell
add :: PeaNum -> PeaNum -> PeaNum
add Zero n     = n
add (Succ m) n = Succ $ add m n -- $ replaces parentheses here

sum :: [PeaNum] -> PeaNum 
sum []     = Zero
sum (x:xs) = add x $ sum xs
```
## example: `Stack` data type
if we wanted to define a [stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)), we could do so like this:
```haskell
data Stack a = EmptyStack | StackNode a (Stack a)

push :: a -> Stack a -> Stack a
push x xs = StackNode x xs

pop :: Stack a -> (Maybe a, Stack a)
pop EmptyStack = (Nothing, EmptyStack)
pop (StackNode x xs) = (Just x, xs)
```