#lecture
# 03 - laws of logic
class: [[CM12004]]
topics mentioned: #logic #boolean 
date: 2024-10-04
teacher: [[Mac Yang]]
## tautologies
a [[boolean formula]] is a *[[tautology]]* if for any input value(s) its result is always *true*.
> [!EXAMPLE]
> the following are all tautologies:
> + $X \lor \lnot X$
> + $\lnot\lnot X \implies X$
> + $\lnot (X\land \lnot X)$
> + $((\lnot X \implies Y) \land (\lnot X \implies \lnot Y)) \implies X$
> this is because for any values of $X,Y$, the formulae always return true.

^fb64c8

you can generate infinite other tautologies here by replacing variables in the formulae with other boolean formulae, as they can have any value without changing the output of the tautology.
> [!IMPORTANT]
> tautologies are formulae which are always *true*, not always false.
> $$X\land \lnot X$$
> this is always false, which is **not a tautology**.

## logical equivalence
the formula $$(F \to G) \lor (G \to F)$$ is special. it only holds true if both $F$ and $G$ have the same value, true or false.
we use $\equiv$ as an abbreviation for this formula. this is called *[[logical equivalence]]*.
>[!EXAMPLE]
>from [[03 - laws of logic#^fb64c8|the tautology examples]] we know that $\lnot \lnot X \to X$ and $X \to \lnot \lnot X$ are both tautologies.
>therefore, they can be combined into a single tautology:$$\lnot\lnot X \implies X$$

## laws of logic
![[logic laws|logic laws]]

## summary
+ **tautologies**: formulae that are always true.
+ **equivalence**: $F \equiv G$ is true if both are the same
+ **laws of logic**