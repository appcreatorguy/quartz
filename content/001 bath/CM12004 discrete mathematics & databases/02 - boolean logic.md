#lecture 
# 02 - boolean logic
class: [[CM12004]]
topics mentioned: #boolean #logic 
date: 2024-10-02
teacher: [[Mac Yang]]
## propositions
![[proposition|proposition]]
## logic connectives
### conjunction
a **conjunction** of two propositions is true *if and only if* each proposition is true.
a conjunction is a logical **or**.

| x   | y   | x ∧ y |
| --- | --- | ----- |
| 0   | 0   | 0     |
| 0   | 1   | 0     |
| 1   | 0   | 0     |
| 1   | 1   | 1     |

### disjunction
a **disjunction** of two propositions is true if either proposition is true.
a disjunction is a logical **or**.

| x   | y   | x ∨ y |
| --- | --- | ----- |
| 0   | 0   | 0     |
| 0   | 1   | 1     |
| 1   | 0   | 1     |
| 1   | 1   | 1     |
### implication
given two propositions, the implication of x to y is denoted by x -> y
a **implication** of two propositions is false if and only if the assumption is true while the consequence is false.

| x   | y   | x -> y |
| --- | --- | ------ |
| 1   | 1   | 1      |
| 1   | 0   | 0      |
| 0   | 1   | 1      |
| 0   | 0   | 1      |
in this case, x is called the *assumption* and y is the *consequence.*
if the assumption is false, then the result is always true.
### negation
given a proposition x, the **negation** of x is denoted by ¬x
a negation of a proposition is true if and only if the proposition is false.
a negation is a logical **not**

| x   | ¬x  |
| --- | --- |
| 1   | 0   |
| 0   | 1   |
### order of logic connectives
![[order of logic connectives#order of logic connectives]]
## boolean formulae
a [[boolean formula]] is a formula that is constructed from *any number of propositions* (variables) $X_1, \ldots , X_n$ and the basic *connectives and parentheses* $\{\land ,\lnot , \implies , \neg , (,)\}$ 

> [!WARNING] valid formulae 
> the following is a boolean formula:
> $$(X \implies \neg Y) \lor (\neg Z \land Y)$$
> but this is not:
> $$(X \implies))$$
> this is because the implication here requires two propositions
### solving boolean formulae
given a boolean formula $F$ the way we can compute its final true/false value is:
1. assign concrete values to every proposition (either t/f)
2. use the defining tables for each connective to compute their true value
3. follow the order of connectives through to compute a single final value for $F$


