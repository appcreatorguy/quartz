#lecture
# 09 - proof by induction
class: [[CM12004]]
topics mentioned: #proof #induction #sets
date: 2024-10-18
teacher: [[Mac Yang]]
## induction
induction is a method for proving theorems about the **natural numbers** ($\mathbb{Z}=1,2,3,4,\ldots$)
an example of such a theorem is:$$1+2+ \ldots + n=\frac{n(n+1)}{2},\forall n\in \mathbb{Z}$$ to verify, we could test with each natural number:
+ $n=1$, left hand side is $1$, right hand side is $1(1+1)/2=1$
+ $n=2$, left hand side is $3$, right hand side is $2(2+1)/2=3$
+ $n=3,\ldots$ 
+ and so on.
however, we can also use [[proof by induction]].
## [[proof by induction]]
![[proof by induction|proof by induction]]
## examples
### example 1
> **theorem.** $1+2+\ldots+n=\frac{n(n+1)}{2}\forall\mathbb{Z}$

**base.** $$\text{Let }n=1,$$
$$1=\frac{1(1+1)}{2}=1\ \therefore \text{True for }n=1$$
**inductive hypothesis.** assume that for $n, 1+2+\ldots+n=\frac{n(n+1)}{2}$
**inductive step.**$$\text{Let}\ n=n+1,$$
$$1+2+\ldots+n+(n+1)$$
$$\implies =\frac{n(n+1)}{2}+(n+1)$$
the previous terms in the addition can be replaced.
$$\implies =\frac{n(n+1)+2(n+1)}{2}$$
$$\implies = \frac{(n+1)(n+2)}{2}$$
$$\equiv \frac{n(n+1)}{2}$$where $n=n+1$. $\therefore$ True for $n=n+1$.
**conclusion.** as the statement is true for $n=1$ and true for $n=n$ $\implies$ true for $n=n+1$, $\therefore \text{true}\ \forall n\in\mathbb{Z}\ \square$.
### example 2
> **theorem.** $n+2\le n^2,\ \forall n\in\mathbb{Z}\mid\{n\ge2\}$

**base.**$$\text{Let}\ n=2,$$
$$n+2=4,n^2=4$$
$$4\equiv4\ \therefore \text{True for }n=2.$$
**inductive hypothesis.** assume that $k+2\le k^2,\ \forall k\in\mathbb{Z}\mid\{k\ge 2\}$.
**inductive step.**$$\text{Let}\ n=k+1,$$
$$k+1+2\le(k+1)^2$$
$$(k+1)^2\ge k+1+2$$
$$k^2-(k+2)+2k\ge 0$$
$$k+2\le k^2\implies k^2-(k+2)\le 0$$
$$2k>0,\ \therefore\text{True for }n=k+1.$$
**conclusion.** as true for $n=2$ and true for $n=k\ \implies$ true for $n=k+1,\ \therefore \text{true}\ \forall n\in\mathbb{Z}\mid\{n\ge2\}\ \square$.
### example 3 ([[cardinality]] of a power set)
> **theorem.** $|2^A|=2^{|A|}\mid A\ \text{is an arbitrary finite set}.$

**base.**$$\text{Let}\ A_n=\{a_1,\ldots,a_n\}, \text{then}$$
$$\text{Let}\ n=0,A=\varnothing,2^\varnothing=\{\varnothing\}, \text{then }|2^\varnothing|=|\{\varnothing\}=1=2^0=2^{|\varnothing|}\ \therefore \text{True for }n=0.$$
**inductive hypothesis.** let $|2^{A_n}=2^{|A_n|}=2^n,\ \forall n\in\mathbb{Z}$.
**inductive step.**$$\text{Let}\ n=n+1, A_{n+1}=\{a_1,\ldots,a_n,a_{n+1}\}$$
$2^{A_{n+1}}$ is a set consisting of two types of subsets:
1) The subsets excluding $a_{n+1}$, which are subsets $X\subset A_n\ (2^n\ \text{of them})$
2) The subsets including $a_{n+1}$, which are $\{a_{n+1}\}\cup X, \text{where }X\subset A_n (2^n\ \text{of them})$
$$\text{Thus}\ |2^{A_{n+1}}|=2^n+2^n=2\cdot2=2^{n+1}=2^{|A_{n+1}|}$$
**conclusion.** as true for $n=0$ and true for $n=n\ \implies$ true for $n=n+1,\ \therefore \text{true }\forall n\in\mathbb{Z}\ \square$.
