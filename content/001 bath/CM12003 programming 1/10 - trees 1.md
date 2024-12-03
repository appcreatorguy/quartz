#lecture
# 10 - trees 1
class: [[CM12003]]
topics mentioned: #trees #lists #haskell 
date: 2024-10-30
teacher: [[Marina De Vos]]
## inductive datatypes
recall that `data` declarations can be *inductive* (recursive).
as we have inductive data, there is a natural way to write recursive [[function]]s over these recursive [[type]]s.
```haskell
maplist :: (a -> b) -> List a -> List b
maplist _ Nil         = Nil
maplist f (Cons x xs) = Cons (f x) (maplist f xs)
```
## trees
a [[binary tree]] is a data structure that looks something like this:
![[g76.svg|500]]
each [[node]] holds a data value, and has **up to 2** *children*, which can themselves have more children. to deal with [[haskell]]'s set-based notation, we can also have an empty tree, which is needed to construct additional nodes.
```haskell
data Tree = Empty | Node Int Tree Tree
	deriving Show
```
here we've created a tree of `Int`s. we have two constructors:
+ `Empty`, which represents the **empty tree**
+ `Node`, which has three arguments:
	+ the `Int` that will be stored at this [[node]]
	+ the two child `Tree`s, which are this node's children
> [!EXAMPLE] a basic tree
> this tree:
> ![[g178.svg]]
> can be represented by the following haskell code:
> ```haskell
> Node 1 (Node 0 Empty Empty) (Node 5 Empty Empty)
> ```
### [[recursion]] over trees
we can apply our general pattern for recursion to our `Tree`.
we need:
+ a **base case**; the result for a tree of type `Empty`
+ a **recursive case**; the result for a nonempty tree of type `Node x left right`, where we apply our function recursively to both `left` and `right`.
>[!EXAMPLE] example
>```haskell
>data Tree = Empty | Node Int Tree Tree
>
>size :: Tree -> Int
>size Empty                  = 0
>size (Node x left right) = 1 + size left + size right
>
>total :: Tree -> Int
>total Empty                  = 0
>total (Node x left right) = x + total left + total right
>```

### formal definitions of [[tree]]s
there are two schools of thought for defining trees:
+ **Computer Science**, where a tree is a *inductive data structure*, with a **root node**, with **data** and **children** (which may be **subtrees**).
+ **Mathematics**, where a tree is a *graph*, that is **acyclic**, **connected**, and **rooted**.
### degree of a [[node]]
the degree of a [[node]] is the number of *immediate* children that it has.
the degree of an entire [[tree]] is the *maximal* degree of its nodes.
for example, we have seen [[binary tree]]s, or 2-degree trees, however there are also **unary** trees (lists), and in general, *n* **-ary** trees with *n* number of children per node.
>[!TIP]
>a common example of a real-world tree is a **file system**, with a root directory and children, that can themselves hold other directories, as well as data.
## tree ambiguity
trees, by their definition, invite *ambiguity*. for instance:
a **leaf** is a node with no children. however, does this mean that `Empty` is a leaf? or is `Node 1 Empty Empty` a leaf?
the same works in inverse. if our definition for a tree was instead:
```haskell
data Tree = Leaf | Node Int Tree Tree
```
what is a `Empty` here? is it a node with no data and no children? or is it simply a `Leaf` node?
## example: arithmetic expressions
a arithmetic expression can be expressed as a tree:
$$3+(5-(4\times2))$$
![[g469.svg|500]]
to write this as a [[haskell]] [[type]], we'll need four constructors: one for the leaf nodes which have integers, and one for each of our three arithmetic operators.
```haskell
data Expr = Num Int
		  | Add Expr Expr
		  | Sub Expr Expr
		  | Mul Expr Expr
	deriving Show
```
thus, our expression from before can now be given by:
```haskell
Add (Num 3) (Sub (Num 5) (Mul (Num 4) (Num 2)))
```

> [!CHECK] infix operators
> we can also make our constructors **infix** to make them easier to read. we do this by using only symbols, and prepending a colon to our operators.
> ```haskell
> data Expr = Num Int
>           | Expr :+ Expr
>           | Expr :- Expr
>           | Expr :* Expr
>       deriving Show
> ```
> our expression can now be given by:
> ```haskell
> Num 3 :+ (Num 5 :- (Num 4 :* Num 2))
> ```

^0ecc47

## class instances
what if we want to show our expressions neatly in the output, like this?
```haskell
ghci> Num 3 :+ (Num 5 :- (Num 4 :* Num 2))
3 + (5 - (4 * 2))
```
to do this, we'll need to make our own `Show` instance for the `Expr` [[type]].

the keyword `instance` will make a new class instance.
```haskell
instance Show Expr where
show (Num  n) = show n
show (x :+ y) = "(" ++ show x ++ " + " ++ show y ++ ")"
show (x :- y) = "(" ++ show x ++ " - " ++ show y ++ ")"
show (x :- y) = "(" ++ show x ++ " * " ++ show y ++ ")"
```
here, we've given instances of the `show` function for each pattern our type can have. when we want to display other types, we can simply call `show` on them to have them handle display themselves.
the `where` block *must* have specific minimal class function(s), depending on the class instance being defined:
+ `Eq a`: `(==) :: a -> a -> Bool`
+ `Ord a`: `(<=) :: a -> a -> Bool`
+ `Show a`: `show :: a -> String`
+ `Num a`:
	+ `(+),(-),(*) :: a -> a -> a`
	+ `abs,signum :: a -> a`
	+ `fromInteger :: Integer -> a`