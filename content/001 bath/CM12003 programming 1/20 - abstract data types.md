#lecture
# 20 - abstract data types
class: [[CM12003]]
topics mentioned: #haskell #type
date: 2024-12-11
teacher: [[Marina De Vos]]
## creating your own data types 
as seen in [[06 - data types|lecture 6]], you can define [[type]]s using the `data` keyword:
```haskell
data Point = Point Double Double 
	deriving (Show, Eq)
```
a type definition is composed of a *type constructor* (`data Point`), and a *data constructor*. the type definition defines the name of the type, and the data constructor is used to construct an instance of a type. a type can have multiple data constructors, and they can be a different name than the type.
## product types 
```haskell
data Circle = Circle Point Double 
	deriving (Show, Eq)
```
these are types that combine multiple elements that are in the data structure at the same time, such as `Point` previously, and `Circle` here.
## polymorphic types 
these are types that can work with multiple different data types, to make them more abstract.
```haskell
data PPoint a = Point a a
```
## records
records are useful when components of a type need to be named, to allow for clearer code:
```haskell
data Point = Point { x :: Double, y :: Double }
	deriving (Show, Eq)

ghci> a = Point 3 4
ghci> a
Point x = 3.0, y = 4.0
ghci> x
3.0
```
## sum types
these allow different ways of constructing a type, where only one is used at any given time:
```haskell
data Bool = False | True
```
### algebraic types 
these are a combination of sum types and product types 
```haskell
data PointXD = Point2D Double Double |
			   Point3D Double Double Double 
```
### abstract data types
abstract data types are types with associated operations, whose implementation is hidden. they are often implemented through the [[haskell modules|module]] system, to allow for clean reuse and separation of concerns.
```haskell
module Stack (Stack, empty, isEmpty, push, top, pop) where

empty :: Stack a
isEmpty :: Stack a -> Bool
push :: a -> Stack a -> Stack a
top :: Stack a -> a
pop :: Stack a -> (a,Stack a)

newtype Stack a = StackImpl [a] -- opaque!
empty = StackImpl []
isEmpty (StackImpl s) = null s
push x (StackImpl s) = StackImpl (x:s)
top (StackImpl s) = head s
pop (StackImpl (s:ss)) = (s,StackImpl ss)
```
here, we define a module that exposes functions for a [[stack]]. however, the consumer does not actually see anything about the underlying implementation of the stack, and only see the type constructor (*not the data constructor!*), and associated functions. this is useful, as if the implementation for the stack changes, the consumer-facing 'API' does not have to.
### `newtype`
the keyword `newtype` allows us to create a new **abstract** data type that is distinct from another existing type, but has the same underlying representation. it allows for one constructor with one field, and introduces a "wrapper" type around another type, which allows for greater type safety, and allows for custom typeclass instances for the new type, in addition to abstraction.
the new type is treated as completely distinct at **compile-time**, but is then optimised away by **run-time**.
#### `newtype` vs `type`
while we have `type` as a method for defining type aliases, these are **interchangeable with the original type**. types defined with `newtype` on the other hand are treated as distinct types.
## defining type classes
type classes define a set of behaviours (methods) that instances of the type class must implement. instances provide concrete implementation of their behaviours for their specific type.
### method overloading
method overloading allows for functions that behave differently depending on the type of their arguments. in [[haskell]], this is achieved through type classes too.
for example, `show` and `==` are overloaded for specific types through the `Show` and `Eq` type classes respectively.
## [[polymorphism]]
### parametric polymorphism 
we have seen parametric polymorphism many times before, as it allows functions to operate on values regardless of their specific types.
```haskell
id :: a -> a
id x = x
```
### ad-hoc polymorphism 
this refers to the ability of functions or operators that can operate on different types in a type specific way, depending on their context. this works for multiple types, but requires different implementations for each group of types. this is, again, achieved through type classes, such as `Num`, `Ord`, `Eq`, etc.
```haskell
elem :: (Eq a) => a -> [a] -> Bool -- constraints are ad-hoc!
```