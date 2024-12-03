#lecture
# 11 - trees 2
class: [[CM12003]]
topics mentioned: #haskell #trees 
date: 2024-11-14
teacher: [[Willem Heijltj]]
## recap
[[10 - trees 1#^0ecc47|last time]], we saw an inductive data [[type]] for arithmetic operators, using *infix* constructors. 
this is an example of an *abstract syntax tree ([[AST]])*.
## abstract syntax [[tree]]
in general, the syntax of a programming language, such as [[haskell]], in represented in a compiler through the use of [[tree]]s. these are called abstract syntax trees ([[AST]]s).
> [!EXAMPLE] example
> here is the [[AST]] for a factorial function in [[haskell]]:
> ```haskell
> fac = \n -> if n <= 1 then 1 else n * fac (n-1)
> ```
> ![[g136.svg]]
## parameterised trees
just like [[haskell lists|lists]], [[tree]]s can hold any type of data.
```haskell
data Tree a = Empty | Node a (Tree a) (Tree a)
	deriving Show
```
the old tree datatype holding only integers now becomes `Tree Int`, similar to `[Int]` and `Maybe Int`.
## mapping over trees
we can write a function that, similar to `map` does to a list, allows us to apply a function to every node in a tree.
```haskell
treemap :: (a -> b) -> Tree a -> Tree b
treemap _ Empty               = Empty
treemap f (Node x left right) =
	Node (f x) (treemap f left) (treemap f right)
```
## the `Functor` class 
the class `Functor` contains types that **can be mapped over**.
```haskell
fmap :: Functor f => (a -> b) -> f a -> f b
```
our tree type can now be an instance of `Functor`:
```haskell
data Tree a = Empty | Node a (Tree a) (Tree a)
instance Functor Tree where
	fmap f Empty               = Empty
	fmap f (Node x left right) =
		Node (f x) (fmap f left) (fmap f right)
```
`List` and `Maybe` are `Functor`s, and any parameterised type can be made one.