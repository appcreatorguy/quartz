#lecture
# 16 - software engineering
class: [[CM12003]]
topics mentioned: #haskell
date: 2024-11-27
teacher: [[Marina De Vos]]

## large scale applications
for large scale applications, such as the ones used by large businesses, require:
+ multiple stakeholders
+ many teams
+ features
+ lots of components
+ clear communication
## modules
[[haskell modules|module]] are used to group [[haskell]] functionality together, and allow other files to import their functionality. to use a module, we must define a *namespace*, which is used to tell other modules where to import code from.
```haskell
module TestModule (variable1, function1)
where
variable 1 = ...

function1 :: a -> a
function1 = ...
```

> [!EXAMPLE] example
> here, we have defined a `Tree` module, that exposes a [[tree]] structure and some associated functions:
> ```haskell
> module Tree ( Tree(Leaf,Branch), fringe ) where 
> 
> data Tree a = Leaf a | Branch (Tree a) (Tree a)
>	deriving Show
> 
> fringe :: Tree a -> [a]
> fringe (Leaf x) = [x]
> fringe (Branch left right) = fringe left ++ fringe right
> 
> x = (Branch (Branch (Leaf 1) (Leaf 2))
> 	(Branch (Leaf 3) (Leaf 4)))
> ```
### importing modules 
modules can be imported just the same as external libraries, by using the `import` keyword.
```haskell
import Tree (Tree(Leaf, Branch), Fringe)
```
## `runhaskell`: running standalone [[haskell]] programs
to simply run a complete haskell program without having to load it into the runtime [[interpreter]], [[GHC]] provides a command called `runhaskell`. this expects a `main :: IO a` function that it will run when a file is passed.
```bash
manasmengle@brahma:~$ runhaskell qualTest.hs
```
## [[unit test]]ing in [[haskell]] 
in haskell, the module for unit testing is called *HSpec*. it exposes functions that allow unit tests to be defined in test modules under a test directory.
```haskell
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
	describe "First Tests" $ do
		it "returns the first element of a list" $ do
			head [23 ..] ‘shouldBe‘ (23 :: Int)

		it "returns the first element of an *arbitrary* list" $
			property $ \~x xs -> head (x:xs) == (x :: Int)
```

these tests can then be run automatically simply by running the test module:
```shell
$ runhaskell Spec.hs

First Tests
	returns the first element of a list [✓]
	returns the first element of an *arbitrary* list [✓]
		+++ OK, passed 100 tests.

	throws an exception if used with an empty list [✓]
	returns the first element of a list [x]
	test my plus [✓]
```
