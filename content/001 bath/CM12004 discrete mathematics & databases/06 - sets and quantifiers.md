
# 06 - sets and quantifiers
class: [[CM12004]]
topics mentioned: #sets 
date: 2024-10-11
teacher: [[Mac Yang]]
## sets
> a *[[set]]* is a collection of items. these items are called the ***elements*** of the set.
### finite [[set]]
a set containing a *finite* number of elements, is called a **finite set**.
a finite set is denoted by listing its elements in braces:$$S = \{a,b,c\}$$
### infinite [[set]] 
a set containing an *infinite* number of elements is called **infinite**.
it is denoted by describing how its elements are derived:$$\textbf{Z}=\{x\mid x \text{ is an integer number}\}$$
> [!tip]
> we can also describe large finite sets in this way. for example:
> $$
> S = \{x\mid x \text{ is a student in this class}\}
> $$

when elements in a set follow a clear pattern, we use ellipses ($\ldots$) as a shorthand for the elements of the set.$$\{2,4,6,8,\ldots ,98\}$$$$\{1,3,5,7,\ldots\}$$
### elements in a [[set]] 
to express that an element is in a given set, we write $$a\in S$$this means that the element $a$ belongs to set $S$.
we can also use $\notin$ to denote that an element is *not* in a set.
the set that contains no elements is denoted by the symbol $\varnothing$.$$\varnothing=\{\}$$
## the [[universal quantifier]]
![[universal quantifier]]
## the [[existential quantifier]]
![[existential quantifier]]
## [[predicate]]
a [[predicate]] is a *"variable" [[proposition]]*. $$x\le0$$it depends on a number of variables, which have values in a certain set. by specifying the set the variables are from, we turn the [[predicate]] into a [[proposition]].$$\exists x\in\{-1,0,1\}(x\le0)$$
## negation of quantifiers 
we can negate quantifiers by using **De Morgan's laws**.
> [!example]
> + **for all** $x$ in the set $M$, $P(x)$ is true
> *negation:* **there exists** $x$ in a set $M$, $P(x)$ is not true.
> + **there exists** $x$ in a set $M$, $P(x)$ is true
> *negation:* **for all** $x$ in a set $M$, $P(x)$ is not true

**general rule**:$$\lnot\forall x\in M P(x) \equiv \exists x\in M (\lnot P(x))$$$$\lnot\exists x \in M P(x)\equiv \forall x \in M (\lnot P(x))$$
> to negate a quantifier, negate the predicate and change the quantifier.