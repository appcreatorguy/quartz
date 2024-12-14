#lecture
# 19 - monads
class: [[CM12003]]
topics mentioned: #monads #haskell
date: 2024-12-11
teacher: [[Willem Heijltj]]

## functions
the idea of [[functional programming]] is to view programs as mathematical functions, as they are easier to reason about.
the key operations we perform on [[function]]s are *identity* and *composition*.
the identity function is `id :: a -> a` such that `id.f ≡ f ≡ f.id`, and the composition function pattern is `f.g :: a -> b -> c` where `f :: a -> b` and `g :: b -> c` such that `f.(g.h) ≡ (f.g).h`.
## IO functions 
we've also seen that while mathematical functions don't have *computational effects*, programs do. the solution in [[haskell]] is to view functions with *effects* as **IO functions**, functions that have the return type `IO`.
```haskell
f :: a -> IO b
g :: b -> IO c
```

these functions however, don't have identity or composition. in the previous example, `f` and `g` cannot be immediately composed due to their types being mismatched, and neither can a IO identity function (`id :: a -> IO a`).
## the pattern
IO functions are not the only ones with this composition issue. so can `Maybe` functions:
```haskell
f :: a -> Maybe b
g :: b -> Maybe c
```
and functions that throw exceptions with `Either`:
```haskell
f :: a -> Either String b
g :: b -> Either String c
```
## monads
the structure needed to solve this type mismatch is called a *[[monad]]*. it consists of:
+ a type function `m`, that is a parameterised type like `data m a = ...` and that is also a *[[functor]]*, meaning it has a function:
```haskell
fmap :: (a -> b) -> m a -> m b
```
+ a `return` function, that acts as the monad's *identity* function
```haskell
return :: a -> m a
```
+ a `join` function, that acts as the monad's *composition function*
```haskell
join :: m (m a) -> m a
```
these are all the key functions of the typeclass `Monad`.
## lists are a monad!
for lists we have the following defined: `fmap, return, join`
```haskell
fmap :: Monad m => (a -> b) -> m a -> m b
map :: (a -> b) -> [a] -> [b]

return :: Monad m => a -> m a
singleton :: a -> [a]

join :: Monad m => m (m a) -> m a
concat :: [[a]] -> [a]
```
thus, we've got everything needed to prove that the list type is simply a monad.
## `Maybe` as a monad
for `Maybe` we also have the following defined: `fmap, return, join`
```haskell
fmap :: Monad m => (a -> b) -> m a -> m b
maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap f Nothing = Nothing
maybeMap f (Just x) = Just (f x)

return :: Monad m => a -> m a
Just :: a -> Maybe a

join :: Monad m => m (m a) -> m a
maybeJoin :: Maybe (Maybe a) -> Maybe a
maybeJoin Nothing = Nothing 
maybeJoin (Just x) = x
```
so `Maybe` is also a monad.
## the bind definition of a [[monad]] 
another way to define [[monad]]s is with `return` and monadic application, or *bind* (`>>=`)
```haskell
>>= :: m a -> (a -> m b) -> m b
```
it applies the monadic function `f :: a -> m b` to a monadic value `x :: m a` to return a monadic value `x >>= f :: m b`
>[!TIP] left monadic application 
>there also exists a left monadic application operator (`=<<`), which does the same thing, just in the other direction:
>```haskell
> =<< :: (a -> m b) -> m a -> m b
>```

### equivalence
we can prove that this is a valid proof by equating the bind operator to the definitions we know to be true. for example, we can make `(>>=)` using `join` and `fmap`:
```haskell
x >>= f == join (fmap f x) -- true!
```
we can also make `fmap` and `join` using `(>>=)` and `return`
```haskell
fmap f == (>== (return . f))
join == (>>= id)
```
### bind for `[]`
bind exists for lists in the form of `concatMap`, which is, as the name suggests, a combination of `concat` and `map`:
```haskell
concatMap :: [a] -> (a -> [b]) -> [b]
```
## the `IO` [[monad]]
the `IO` monad is like all other monads, except that `return` and `(>>=)` are *built-in*, and cannot easily be defined by ourselves.
### `do` notation
a `do`-block is built up line-by-line from the final line, where:
```haskell
do x <- expr === expr >>= (\x -> block)
	block
```
lines that discard their value use `(>>)`, where `(>>) :: IO a -> IO b -> IO b`:
```haskell
do expr  === expr >> block === expr >>= (\_ -> block)
	block
```
## category laws
for regular functions, the key property of them is that identity and composition are *well-behaved*, that is, they follow the [category laws](https://en.wikipedia.org/wiki/Category_theory?useskin=vector#Categories) such that they can be defined as a category.
these laws are the **identity law**:
```haskell
id . f === f === f . id -- left and right identity 
```
and the **associativity law**:
```haskell
h . (g . f) === (h . g) . f
```
the definition of monads also require these laws for us to be able to reason about them as easily as we can functions.
```haskell
m >>= return === m -- left identity
return x >>= f === f x -- right identity 
m >>= (\y -> g y >>= f) === (m >>= g) >>= f -- associativity
```
