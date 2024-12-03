#lecture
# 03 - constraint satisfaction
class: [[CM12001A]]
topics mentioned: #search #constraints
date: 2024-11-25
teacher: [[Ben Ralph]]

## formalising constraint satisfaction problems
$X = \{X_1,X_2,\ldots,X_n\}$ is a set of variables
$D = \{D_1,D_2,\ldots,D_n\}$ is a set of domains specifying the values that each variable can take.
$C$ is a set of constraints that specifies the values that the variables are allowed to have collectively.
+ a **state** is an assignment of values to the variables
+ a state can be called **complete** if it assigns all the variables values.
+ a state is **consistent** if it does not violate the constraints 
+ a **solution** is a *complete* **and** *consistent* state.
## solving constraint satisfaction problems 
to solve constraints, we combine a [[depth-first search]] with *[[constraint propagation]]*. we only consider children of nodes which are consistent with our constraints, thus reducing complexity.
## heuristics for CSPs
there are two main heuristics used when solving CSPs:
+ *minimum remaining value (MRV)*: when choosing which frontier to expand, we choose the one which has the fewest legal values available to us.
+ *least constraining value (LCV)*: when selecting a value for a variable, we should select the value that constrains the fewest other values.