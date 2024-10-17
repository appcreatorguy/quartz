#lecture 
# 05 - logic circuits and sets
class: [[CM12004]]
topics mentioned: #logic #boolean
date: 2024-10-09
teacher: [[Mac Yang]]
## more on [[literal|literals]]
> *from [[04 - more logic|lecture 4:]]*
> Let $X_1,X_2,\ldots , X_n$ be variables. $Y_i$ is called a [[literal]] if $Y_i$ is either $X_i$ or $\lnot X_i$ for any $i$.

if there are 2 variables, $X$ and $Y$, then there are 4 possible literals, $X,\lnot X, Y, \lnot Y$
$\therefore$ for every $n$ variables there are $2n$ literals.
## [[conjunctive term]] 
![[conjunctive term|conjunctive term]]
## [[disjunctive normal form]]
> from [[04 - more logic|lecture 4:]]
> A [[boolean formula]] $F$ is in *[[disjunctive normal form]] (DNF)* if $F$ is of the form$$F_1\lor F_2\lor \ldots \lor F_k$$ where $F_i$ is a **[[conjunctive term]]** for any $i$.

simply put, DNF is **a disjunction of one or more conjunctive terms**.
if there are 2 variables $X$ and $Y$, the following are all in DNF:$$X, X\land \lnot Y, (X\land \lnot Y)\lor Y, (X\land \lnot Y) \lor (\lnot X \land Y),(X\land \lnot Y) \lor (\lnot X \land Y) \lor (\lnot X\land \lnot Y),\ldots$$
>[!WARNING] negation in DNF
>the following is *not* in DNF:$$\lnot(X\land Y)\lor (X\land \lnot Y)$$
>this is because the negation operator is operating on a *[[conjunctive term]]* and not a *[[literal]]*. even a negation of a formula in DNF is no longer in DNF, for example $\lnot(X\lor Y)$.
## [[disjunctive normal form]] of a [[boolean formula]] 
> from [[04 - more logic|lecture 4]]
> **theorem:** for each boolean formula $G$ with variables $X_1, X_2, \ldots , X_n$ there exists a boolean formula $F$ in DNF, with variables from $X_1, X_2, \ldots , X_n$, s.t $G\equiv F$.

essentially, any boolean formula can be reduced to a state where it is in DNF.
## exercise
> *replace each of the following formulas with an equivalent one in DNF.*$$(X\lor \lnot Y \lor Z) \land (\lnot X \lor \lnot Z)$$

to solve, we expand brackets:$$(X\land \lnot X) \lor (X \land \lnot Z) \lor (\lnot Y \land \lnot X) \lor (\lnot Y \land \lnot Z) \lor (Z \land \lnot X) \lor (Z \land \lnot Z)$$
simplifying: $$(X\land \lnot Z)\lor(\lnot Y \land \lnot X)\lor(\lnot Y\land \lnot Z)\lor(Z\land \lnot X)$$
## digital circuit
a *digital circuit* is an electronic device that performs a computation.
it takes a number of boolean inputs, and performs a computation to return one or more boolean outputs.
## [[logic gates]]
![[logic gates|logic gates]]