## [[function composition]]
in maths, we can *compose* two [[function]]s  as $g\circ f$, where:$$(g\circ f)(x)=g(f(x))$$
in [[haskell]], this is done using a **dot** (`g.f`).
```haskell
(head . reverse) [1..10]     -- 10
map (square . addsix) [1..3] -- [49,64,81]
```
