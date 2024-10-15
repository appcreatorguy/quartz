#haskell #lists 
in [[haskell]], lists are a collection of items *of the same type*.
```haskell
let a = [1, 2, 3, 4, 5, 6]
```
> [!faq]
> internally, haskell lists are **linked lists**.
> therefore they aren't suited to being indexed frequently.
> for this, a [[haskell vectors|vector]] should be used instead.