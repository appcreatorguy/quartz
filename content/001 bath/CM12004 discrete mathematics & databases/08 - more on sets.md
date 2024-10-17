#lecture
# 08 - more on sets
class: [[CM12004]]
topics mentioned: #sets 
date: 2024-10-17
teacher: [[Mac Yang]]
## recap
> from [[07 - set operations and properties|lecture 7]]:
+ **equal sets**: two [[set]]s that consist of the exact same elements
+ **[[subset]]**: every element from one set is also in another
+ [[set operations]]
	+ **union**: contains elements from *either set*, or both
	+ **intersection**: contains elements from *both sets only*
	+ **difference**: contains elements in one set *but not the other*
	+ **complement**: all the elements in the universe that are not in the set
+ [[set operation laws]]: commutative, associative, distributive, complement, de Morgan's
## cartesian product of [[set]]s
for two sets $A$ and $B$ the set $A\times B=\{(x,y)\mid(x\in A)\land(y\in B)\}$ is called the *[[cartesian product]]* of the two sets. it is denoted by the multiplication symbol ($\times$).
the cartesian product of two sets returns **a set of pairs** that is the result of combining the two sets.
it's easier to think of the [[cartesian product]] by using a table diagram:

![[Cartesian_Product_qtl1.svg]] ^c7e3ba
> [!EXAMPLE]
> **simple example:**
> if $A=\{x_1,x_2\}$ and $B=\{y_1,y_2\}$ then $A\times B=\{(x_1,y_1),(x_1,y_2),(x_2,y_1),(x_2,y_2)\}$.
> **complex example**:
> if $A=\{x\mid x\in\mathbb{Z},0\le x\le 1\},\ B=\{y\mid y\in \mathbb{Z}, 1\le y\le 2\}$, then $A\times B$ can be represented as a square on a graph, with vertices $(0,1),(0,2),(1,1),(1,2)$.
> ![[Pasted image 20241017125016.png|200]]

> [!NOTE] exercise - exam 2022
> >*Let* $A=\{a,b,c,d\}$. *Describe the set* $(A\setminus\{a,b\})\times(A\setminus\{b,c\})$ *by listing all its elements.*
>
> $$A\setminus\{a,b\}=\{c,d\}$$
> $$A\setminus\{b,c\}=\{a,d\}$$
> $$\therefore \text{the cartesian product is }\{(c,a),(c,d),(d,a),(d,d)\}$$

## sets of [[set]]s
*sets can serve as **elements** of other sets*.
for example, $A=\{\{a\},\{a,b\},\{b\}\}$
> [!NOTE] exercise - exam 2022
> > *Let* $A=\{a,b,c,d\}$. *Simplify the expression*$(A\cup \{a,d,\varnothing\})\setminus(A\cap\varnothing)$.
> 
> as we know that $A$ already contains $a,d$:
> $$A\cup \{a,d,\varnothing\}=A\cup \{\varnothing\}$$
> the union of any set and the empty set is always the empty set:
> $$A\cap\varnothing =\varnothing$$
> the difference of a set with the empty set is always the set itself:
> $$(A\cap\{\varnothing\})=A\cup\{\varnothing\}$$

## power set
let $A$ be a set. then let $B$ be a set such that $B$ is a [[subset]] of $A$. the set of $B$s is called the *[[power set]]* and is denoted by $2^A$, or $P(A)$. the formal definition of this set would be $2^A=\{X\mid X\subset A\}$, as **$X$ here is any set which is also a subset of $A$.**
> [!EXAMPLE]
> from basics, the [[power set]] of $\varnothing$ ($2^{\varnothing}$) is just $\{\varnothing\}$.
> further more, let $A=\{a\}$. then $2^A=\{\varnothing,\{a\}\}$.
> now let $B=\{a,b\}$. now $2^B=\{\varnothing,\{a\},\{b\},\{a,b\}\}$.

essentially, the power set of a set contains a set for every combination of elements in the set *and the empty set*.
## cardinality of a [[set]]
let $A$ be a finite set with $x$ length. then $n$ is called the *[[cardinality]]* of the set and is denoted as $n=|A|=x$. the [[cardinality]] of a set is equivalent to **the number of elements in the set**.
for example:
+ $|\varnothing|=0$
+ $|\{\varnothing\}|=1$
+ $|\{a,b,c\}|=3$
+ $|2^{ \{a\}}|=|\{\varnothing,\{a\}\}=2$
### [[cardinality]] of a union
> **Theorem.** suppose $A$ and $B$ are two arbitrary finite sets, the [[cardinality]] of their union satisfies:$$|A\cup B|=|A|+|B|-|A\cap B|$$

**Proof.** try to count elements from $A$ and $B$. each element from $A\cup B$ will be counted at least once.
however, elements from $A\cap B$ will be counted twice, once from $A$ and once from $B$.
$\therefore$ we have to remove these duplicated counts by subtracting $|A\cap B|$ once. $\mathcal{Q.E.D}$
### [[cardinality]] of a [[cartesian product]]
> **Theorem.** suppose $A$ and $B$ are two arbitrary finite sets, the [[cardinality]] of their [[cartesian product]] satisfies:$$|A\times B|=|A||B|$$

**Proof.** $A\times B$ is the set of all pairs $(x,y)$ where $x\in A,\ y\in B$.
suppose $|A|=m\ (m\ge 0)$, $|B|=n\ (n\ge 0)$, thus for each of $m$ elements, there exist exactly $n$ pairs in the form $(x,y)$.
$\implies$ the total number of pairs in $A\times B$ is then $m\cdot n=|A||B|$.

another way to look at it is to think back to [[08 - more on sets#^c7e3ba|the table diagram]]. it then follows that the total number of elements is the number of rows multiplied by the number of columns.
## [[cardinality]] of a [[power set]] 
> **Theorem.** suppose $A$ is an arbitrary finite set, the [[cardinality]] of its power set $2^A$ satisfies $|2^A|=2^{|A|}$

**Proof.** The proof of this can be solved through combinatorics.
For a set $A=\{a,b\}$, if there is a subset $B$ of $A$, for each element in $A$ it can either be in $B$ or not be in $B$ ($a_1\in B$ or $a_1\notin B$), giving two possibilities.
$\therefore$ for $A$ there are $2\times 2=2^2=4$ possible subsets $B$.
$\implies$ for an arbitrary set $A$ with any finite length $n$ there are $2^n=2^{|A|}$ possible subsets. $\therefore\ |2^A|=2^{|A|}.\ \mathcal{Q.E.D}$