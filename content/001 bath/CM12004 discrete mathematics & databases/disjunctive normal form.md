+ let $X_1,X_2,\ldots,X_n$ be variables. Y is a *[[literal]]* if $Y_i$ is either $X_i$ or $\lnot X_i$ for any $i$.
+ *[[conjunctive term]]* is a conjunction of the kind $Y_{i_1} \land Y_{i_2} \land \ldots \land Y_{i_m}$, where $i_j$ is one of the numbers $1,2,\ldots,n$ for $1\le j\le m$ and each $Y_{i_j}$ is a literal.
+ a [[boolean formula]] $F$ is in *[[disjunctive normal form]]* (DNF) if $F$ is of the form $F_1 \lor F_2 \lor \ldots \lor F_k$, where $F_i$ is a conjunctive term for any $i$.

> **theorem**: for each boolean formula $G$ with variables $X_1, X_2, \ldots , X_n$ there exists a boolean formula $F$ in DNF, with variables from $X_1, X_2, \ldots , X_n$, s.t $G\equiv F$.