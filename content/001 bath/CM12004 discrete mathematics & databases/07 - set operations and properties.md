#lecture 
# 07 - set operations and properties
class: [[CM12004]]
topics mentioned: #sets #logic 
date: 2024-10-14
teacher: [[Mac Yang]]

## recap
> from [[06 - sets and quantifiers]]
+ a [[set]] is a collection of items, called set elements.
+ to show that an element $a$ belongs to set $S$, we write $a\in S$. conversely, we can also write $a\notin S$.
+ a finite set is written by listing its elements: $S=\{a,b,c\}$
+ an infinite set is written by defining the [[predicate]] of the elements in the set: $\textbf{Z}=\{x\mid x\text{ is an integer number}\}$.
+ the [[universal quantifier]] $\forall$ states that a [[proposition]] is true of **all** elements in a set.
+ the [[existential quantifier]] $\exists$ states that a [[proposition]] is true for **at least one** element in a set.
+ a [[predicate]] is a "variable" [[proposition]]. it depends on elements from a set. when we define this set, we turn the [[predicate]] into a [[proposition]].
+ predicates follow a general version of **[[logic laws#De Morgan's laws|De Morgan's laws]]**:$$\lnot\forall x\in M P(x) \equiv \exists x\in M (\lnot P(x))$$ $$\lnot\exists x \in M P(x)\equiv \forall x \in M (\lnot P(x))$$
+ *to negate a quantifier, negate the predicate and change the quantifier.*
## equal sets
two sets are called *equal sets*, and can be written $A=B$ if they consist of the same elements.
> [!EXAMPLE]
> $A=\{2,4,5\}$ and $B=\{4,5,2\}$ are equal ($A=B$).
> the ordering of the elements in a set **does not affect** whether they are equal.
> also, $A=\{2,3,5\}$ and $B=\{2,3,3,5\}$ are equal ($A=B$).
> the number of times an element appears doesn't affect whether they are equal either.
## subsets
a set $A$ is a *[[subset]]* of set $B$ (denoted $A\subset B$), if **every element in $A$ is also a element in $B$** ($\forall x \in A (x \in B)$).
if A is a [[subset]] of B and B is a [[subset]] of A, then A and B are equal sets.
$$(A\subset B)\land (B\subset A)\implies A=B$$
additionally, we define any set as starting out as the empty set ($\emptyset$), so $\forall A;\emptyset\subset A$.
### transitivity of subsets
> for any three sets $A,B,C$, if $A\subset B$ and $B\subset C$, then it follows that $A\subset C$.
## [[set operations]] 
![[set operations|set operations]]
## [[set operation laws]] 
![[set operation laws|set operation laws]]