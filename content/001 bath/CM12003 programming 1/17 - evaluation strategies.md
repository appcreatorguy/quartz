#lecture
# 17 - evaluation strategies
class: [[CM12003]]
topics mentioned: #haskell #evaluation
date: 2024-12-02
teacher: [[Willem Heijltj]]

## evaluation strategies 
suppose we have a abstract function call for some language:
```
f(a,b)
```
where `a` and `b` are some expressions. there are 4 main ways that this call can be evaluated:
+ *[[call-by-value]]*, first `a` then `b`, then `f` with a **copy** of the results.
+ *[[call-by-reference]]*, first `a` and `b`, then `f` with a **pointer** to the results.
+ *[[call-by-name]]*, `f` with a **copy** of `a` and `b`, **un-evaluated**.
+ *[[call-by-need]]*, `f` with a **pointer** to `a` and `b`, **un-evaluated**.
### example
consider the following example:
```
f(++a, b=a;++b)
```
where `f(x,y) = x+x`.
this function will evaluate differently based on the 4 methods of calling it:
#### [[call-by-value]]
![[path100.svg]]
#### [[call-by-reference]]
![[path144.svg]]
#### [[call-by-name]] 
![[path191.svg]]
#### [[call-by-need]] 
![[path225.svg]]
### key differences
+ [[call-by-name]] will duplicate un-evaluated code, which is slower than other methods.
+ *strict* strategies, such as [[call-by-value]] and [[call-by-reference]], may loop or throw exceptions, whereas *lazy* strategies such as [[call-by-name]] and [[call-by-need]] might not.
+ the four strategies all have differing return values, due to the use of [[side effects]], such as incrementing or assigning values.
## graph reduction
[[haskell]] uses **[[call-by-need]]**, which it can do by restricting [[side effects]] to [[monad]]s and the `IO` type to restore clarity.
by design, haskell uses **multiple [[pointer]]s to a shared expression**, which is only evaluated the first time it is needed, and duplicated after that.
to do this, [[GHC]] turns the syntax tree of an expression into a [[graph]]. the branches of the graph can then be evaluated, or *reduced*, whenever needed. this process is known as graph reduction, and it allows haskell to implement call-by-need evaluation efficiently.
### the `where` clause
internally, the `where` clause is used to express pointers. for example:
```haskell
square (square 4)
x * x    where x = square 4
x * x    where x = 16
16 * x   where x = 16
16 * 16  where x = 16
256      where x = 16
```
the value of x is evaluated once **when it is needed**, and then the value is copied elsewhere.
after evaluation, the sub-expressions still exist in memory, and so [[GHC]] employs a garbage collector to free up the memory that these occupy.
## `core`
special [[haskell]] syntax features, such as [[guards]], [[haskell lists|list literals]],  `where` clauses, `if-then-else` and `do` notation are all translated internally into other primitive operators. these operators make up an intermediary language called `core`, which [[GHC]] uses when compiling.
`core` has nine constructs that can make up an expression:
+ let-bindings (`Let`)
+ case-expressions (`Case`)
+ variables (`Var`)
+ literals (`Lit`)
+ function application (`App`)
+ lambdas (`Lam`)
+ casts (`Cast`)
+ coercions (`Coercion`)