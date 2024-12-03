#search 
in a *[[breadth-first search]]*, we explore the **shallowest state in the frontier**.
```mermaid
stateDiagram-v2
    a --> b
    a --> c
    b --> d
    b --> e
    c --> f
    c --> g
```
for example, for this tree, if `a` has been searched, the next shallowest nodes are `b`/`c`. one of these will then be searched, then the other, and then finally, `d,e,f,g` are searched.