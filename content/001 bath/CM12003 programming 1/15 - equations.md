#lecture

# 15 - equations

class: [[CM12003]]
topics mentioned: #haskell #equations
date: 2024-11-24
teacher: [[Willem Heijltj]]

## reasoning about code

mathematical [[function]]s, and [[functional programming]] by extension, are **good for reasoning about**, we only need to consider inputs and output, not [[side effects]], and we are helped by [[type]]s. there are two main aspects that this makes itself clear in [[haskell]]:

- _program equations_
- _property-based testing_

## program equations

we will write $===$ to say that "these programs have the same meaning". for example:

```haskell
length . map f === length
```

we want that if `f === g`, we can replace `f` with `g` without any hassle. this is important when _refactoring_, or changing code to make it generally better.
[[GHC]] also does this, called _compiler transformations_.

> [!INFO]
> this is only possible because of _referential transparency_, there are no [[side effects]] in functional programming, a function only depends on its inputs.

### reverse reverse
program equivalence has its limits, for example, consider:
```haskell
reverse . reverse === id
```
this is where the law of *termination* becomes important. for finite lists, this law holds, but for infinite lists, `reverse . reverse` will fail to terminate.
this means that we cannot safely replace `id` with `reverse . reverse`, or vice versa.
### fusion
while `map f . map g` and `map (f.g)` may be functionally equivalent, they are not both equivalent **in terms of efficiency**. `map (f.g)` does not use an intermediary list, and so is faster. this is called *fused* code, and [[GHC]] will apply it as an [[optimization]] wherever possible.
## property-based testing 
a program equation is a **property** of a program. we can use these to test if our program is correct. for example, a tree sort and a merge sort should both function the same:
```haskell
flatten . build === msort
```
[[haskell]] includes a library to make checks like these easy.
### QuickCheck
`Test.QuickCheck` is a [[haskell]] module for [[property-based testing]]. it works **by generation random inputs**, and then checking if the property holds for those inputs.
for example, we first define the property as a function returning a `Bool`:
```haskell
import Test.QuickCheck

prop_flatten_build :: [Int] -> Bool
prop_flatten_build xs = flatten . build xs == msort xs
```
calling `quickCheck` will run 100 test with random inputs:
```haskell
ghci> quickCheck prop_flatten_build
--- OK, passed 100 tests.
```
### shrinking
QuickCheck test values start small and get larger. if a test fails, the function will *shrink* the failing test case to present as minimal of a example to the user as possible. this is very helpful for debugging, as it allows us to focus on the **simplest possible input that causes the problem**.
