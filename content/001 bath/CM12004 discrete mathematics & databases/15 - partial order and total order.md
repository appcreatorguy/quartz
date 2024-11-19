#lecture
# 15 - partial order and total order
class: [[CM12004]]
topics mentioned: #sets #relations 
date: 2024-11-01
teacher: [[Mac Yang]]
## recap
> *from [[14 - cauchy sequences and null sequences|lecture 14]]:*
+ a [[relation]] $R$ between $A,B$ is a [[subset]] of $A\times B$
	+ where if $(x,y)\in R,x\in A$ is related to $y\in B$.
	+ otherwise, $x\in A$ is *not* related to $y\in B$.
+ in the special case of $A=B$, we say $R\subset A\times A$ is a relation on $A$.
+ an arbitrary relation $*$ on a set $A$ is called an [[equivalence relation]] if:
	+ $*$ is **reflexive**, **symmetric**, and **transitive**.
## antisymmetric [[relation]]
let $A$ be a [[set]]. A relation $R$ on $A$ is called a [[antisymmetric relation]] if it satisfies the following property:
$$\text{For all }x,y\in A,(x,y)\in R\text{ and }(y,x)\in R\text{ imply }x=y$$
for example, the relation $\le$ on $\mathbb{Z}$ is antisymmetric, as $\forall x,y\in\mathbb{Z}$, if $(x\le y)\land(y\le x)$, then it follows that $x=y$, as there is no other solution where they are both less than or equal to each other.

essentially, an [[antisymmetric relation]] is a relation on a set where two **different** elements from the set **cannot be related to each other** (both ways).
## partial order
a relation $*$ on a set $A$ is called a *[[partial order relation]]* on $A$ if it is reflexive, **antisymmetric**, and transitive.
it differs from a [[equivalence relation]], because it requires the relation to be *[[antisymmetric relation|antisymmetric]]*, not symmetric.

for example, the relation $\le$ on $\mathbb{Z}$ is also a [[partial order relation]], as:
+ $\forall x\in \mathbb{Z}, x\le x$ (reflexive)
+ $\forall x,y\in\mathbb{Z},\ x\le y\land y\le x\implies x=y$ (antisymmetric)
+ $\forall x,y,z\in\mathbb{Z},\ x\le y\land y\le z\implies x\le z$ (transitive)

however, the relation $<$ is **not**, as it isn't reflexive ($x<x$ is not true.)
## total order
a [[partial order relation]] is called a [[total order relation]], if **for any** two elements $x,y$ from the set, either $(x,y)\in R$, or $(y,x)\in R$ is true.
while [[partial order relation]]s imply that if two elements are related both directions to each other, they are equal, a [[total order relation]] implies that **any two elements can be related in some direction to each other**.
## maximal and minimal elements for a [[partial order relation]]
let $R$ be a [[partial order relation]] on a set $A$. an element $x\in A$ is called **maximal**, if $\forall y\in A\ ((x,y)\in R\to x=y)$ (if x is related to y, then x=y)
	the maximal element $x$ is related to $x$ only, not any other element.

let $R$ be a [[partial order relation]] on a set $A$, an element $x\in A$ is called **minimal**, if $\forall y\in A\ ((y,x)\in R\to x=y)$ (if y is related to x, then y=x)
	for the minimal element, only $x$ is related to the minimal element $x$.
## maximal and minimal elements for a [[total order relation]]
whilst for a [[partial order relation]], there may be multiple maximal and minimal elements, for a [[total order relation]], there is **only one of each**.

**theorem**: *for a total order $R$ on a set $A$, if a minimal element exists, then it is unique.*
**proof**: suppose that there are two maximal elements $a,b$. we want to show that $a=b$.
1. since $R$ is total order, than either $(a,b)\in R$, or $(b,a)\in R$ is true.
2. if $(a,b)\in R$, then because $a$ is maximal, $a=b$.
3. similarly, if $(b,a)\in R$, since $b$ is maximal, $b=a$.
4. as either way we have $a=b$, we know that the maximal element is unique.
> *the proof to a minimal element works much the same way.*