#lecture 
# 04 - more logic
class: [[CM12004]]
topics mentioned: #logic #boolean #proof
date: 2024-10-07
teacher: [[Mac Yang]]
## recap
from [[03 - laws of logic]]:
+ [[tautology]]: a [[boolean formula]]  that is always true regardless of inputs
+ [[logical equivalence]]: two formulae that have the same truth value
+ [[logic laws]]
## exercise
> express $(\lnot Y \to Z) \to X$ in an equivalent form using only connectives $\lnot$ and $\lor$.

solution:
$$\begin{aligned}
(\lnot Y \to Z) &\to X & \\
\lnot (Y \lor Z) &\lor X \\
\end{aligned}$$
## reductio ad absurdum
reductio ad absurdum means "reduction to the absurd" and is used to prove by contradiction.
similar to continuous mathematics, we take the negation of some [[proposition]], assume this to be true for the purpose of deriving some contradictory statements, which we can then use to disprove the assumption, leading to the original proposition being proved true. this is also sometimes called *proof by contradiction*.
## direct and inverse theorems
most mathematical theorems are described as implications (e.g $x\to y$). such implications are called *direct theorem*.
direct theorems imply the existence of the *inverse theorem* (e.g $y\to x$).
however even if the direct theorem is true, the inverse theorem **may or may not be true**.
## opposite theorems 
an *opposite theorem* is the negation of a direct theorem. for example, suppose $x\to y$ is the direct, then $\lnot x \to \lnot y$ is the *opposite theorem*.
$\therefore$ the [[proposition]] $\lnot y \to \lnot x$ is the *opposite to inverse theorem*.
because of the tautology:$$X \to Y \equiv \lnot Y \to \lnot X$$ an opposite to inverse theorem is true *if and only if* the **direct theorem is true**.
> [!WARNING] opposite theorem vs inverse theorem 
> the opposite theorem and the inverse theorem are **not the same thing**!
> + opposite = negation 
> + inverse = reversal

## examples of theorems 
### example 1
+ direct $x\to y$: if an integer is a multiple of 4, then it is even (true)
+ inverse $y\to x$: if an integer is even, then it is a multiple of 4 (false)
+ opposite $\lnot x \to \lnot y$: if an integer is **not** a multiple of 4, then it is odd.
+ opposite to inverse $\lnot y \to \lnot x$: if an integer is odd, then it is **not** a multiple of 4.
### example 2
+ direct $x\to y: \text{if } a = b, \text{then } a^3 = b^3$ *(true)*
+ inverse $y \to x: \text{if } a^3 = b^3, \text{then } a = b$ *(true)*
+ opposite $(\lnot x \to \lnot y): \text{if } a \ne b, \text{then } a^3 \ne b^3$ *(true)*
+ opposite to inverse $(\lnot y \to \lnot x): \text{if } a^3 \ne b^3, \text{then } a \ne b$ *(true)*
## sufficient/necessary conditions
if a theorem has the structure $x\to y$, then
+ x is the *sufficient condition* of the theorem, and x **is sufficient** for y.
+ y is the *necessary condition* of the theorem, and y **is necessary** for x.
if a theorem has the form "x is necessary **and sufficient** for y", it means $x \to y,\ y \to x$ are both true at the same time.
## [[disjunctive normal form]] 
![[disjunctive normal form|disjunctive normal form]]
## [[conjunctive normal form]] 
![[conjunctive normal form]]