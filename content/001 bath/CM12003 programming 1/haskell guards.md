## guards
```haskell
absolute n
    | n < 0     = -n
    | otherwise = n
```
[[guards]] let functions have multiple *cases*, depending on certain boolean conditions
**the first guard to succeed is the one that determines the functions output**
*otherwise* is analogous to else, it always returns `True`.