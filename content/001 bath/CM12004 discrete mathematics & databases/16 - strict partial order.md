#lecture
# 16 - strict partial order
class: [[CM12004]]
topics mentioned: #sets #relations 
date: 2024-11-11
teacher: [[Mac Yang]]
## recap
> *from [[15 - partial order and total order|lecture 15]]:*
+ a [[relation]] between two sets $A,\ B$ is a [[subset]] of $A\times B=\{(x,y)\mid (x\in A)\land(y\in B)\}$.
+ a relation $*$ on a set $A$ is called a [[partial order relation]] if it is **reflexive**, ***anti*symmetric**, and **transitive**.
+ a relation $*$ on a set $A$ is called a [[total order relation]] if for any $x,y\in A$, either $(x,y)\in R$ or $(y,x)\in R$.
	+ **any** two elements in a total order are related, in either order.
## asymmetric relation
a [[relation]] $R$ on $A$ is a [[asymmetric relation]] if $\forall x,y \in A$, **either** $(x,y)\notin R$ or $(y,x)\notin R$.
for example, the relation $<$ on $\mathbb{Z}$ is asymmetric. however, the relation $\le$ is *not*, as $x\le y$, **and** $y\le x$ if $x=2,y=2$.
## strict partial order
a relation $R$ on $A$ is a [[strict partial order relation]] if it is **asymmetric** and **transitive**.
for example, the relation $<$ on $\mathbb{Z}$ is strict partial order:
+ *asymmetric*: $\forall x,y\in \mathbb{Z}$, either $x\nless y$ or $y\nless x$
+ *transitive*: $\forall x,y,z\in \mathbb{Z}$, if $x<y$ and $y<z$, $x<z$.
## define strict partial order from partial order
> **theorem.** let $A$ be a set. if $\le$ (shorthand for general [[partial order relation]]) is a partial order on $A$, then a relation $<$ (shorthand for general [[strict partial order relation]]) on $A$ defined by $x< y\text{ if }(x\le y)\land (x\ne y)$ is a strict partial order.

**proof.** we need to prove that $<$ is asymmetric and transitive.
1. **asymmetric:**
	- assume that $<$ isn't asymmetric, then $\exists x,y\in A$, such that $(x<y)\land (y<x)$.
	- then by the definition of $<$, $(x\le y)\land (y\le x)$.
	- but since the relation $\le$ is partial order, it is antisymmetric. thus, $x=y$. but this contradicts the original assumption that $x<y$, as by definition $x\ne y$.
2. **transitive:**
	+ let $(x<y)\land (y<z)\ \ \forall x,y,z\in A$. then, by the definition of $<$, $(x\le y)\land (y\le z)$. since $\le$ is transitive, we have $x\le z$. now we need to prove that $x\ne z$.
	+ let us assume the opposite. $x=z$. now we can rewrite the formula $(x\le y)\land (y\le z)$ as $(z\le y)\land (y\le z)$.
	+ but now, since $\le$ is antisymmetric, we have $y=z$, which contradicts to $y<z$. thus, we conclude that $x\ne z$, and $\therefore x<z$.