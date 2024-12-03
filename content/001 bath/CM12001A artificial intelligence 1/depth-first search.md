#search
in a *[[depth-first search]]*, we explore the **deepest state in the frontier**.
```mermaid
stateDiagram-v2
    a --> b
    a --> c
    b --> d
    b --> e
    c --> f
    c --> g
    d --> h
    d --> i
    e --> j
    e --> k
    f --> l
    f --> m
    g --> n
    g --> o
```
for example, for this tree, if we start at node `a`, we would search `b`, then `d`, then `h`, then `i`, and so on, exploring as far as possible along each branch before *backtracking*. this contrasts with [[breadth-first search]], where we would explore all nodes at a given depth before moving on to the next level.