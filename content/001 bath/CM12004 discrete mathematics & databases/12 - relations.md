#lecture
# 12 - relations
class: [[CM12004]]
topics mentioned: #sets #relations #maps 
date: 2024-10-25
teacher: [[Mac Yang]]
## recap
> From [[11 - more on maps|lecture 11]]:
+ if $f:A\to B$ is a map then the map $f^{-1}:B\to A$ is called the inverse to $f$.
+ a map $f$ only has an inverse if $f$ is bijective.
+ the composition of two sets $f:A\to B,\ g:B\to C$ is $g\circ f:A\to C$ such that $g\circ f(x)=g(f(x))$.
+ the composition of two injective maps is injective.
+ the composition of two surjective maps is surjective 
+ the composition of two bijective is bijective
+ a map $f:A\to B$ is a subset of $A\times B=\{(x,y)\mid(x\in A)\land(y\in B)\}$ where for any $x\in A$ there exists only one $y\in B$ such that $(x,y)\in f$.
	+ essentially a map is defined as a subset of the [[cartesian product]] of the two sets that contains all (argument, image) pairs.
	+ $f=\{(x,y)\mid(x\in A)\land(y\in B)\land(x\mapsto y)\}$
## relations 
[[relation]]s are a very fundamental topic both in discrete mathematics, and also as the foundation of [[relational database]]s.
to define them, let $A,B$ be sets. a [[relation]] $R$ between $A,B$ is a subset of $A\times B$ where $x\in A$ is related to $y\in B$ if the pair $(x,y) \in R$.

the symbol $*$ can be used to define a **general relation**, for example we can write $x*y$ instead of $(x,y)\in R. when we specify the relation, we can replace the $*$ with a symbol such as $=,>,<,$etc.

if the two sets of a relation are equivalent ($A=B$), we can say $R\subset A\times A$, and the relation is **on $A$**.
> [!example] examples
> any map $f:A\to B$ is a relation between A and B, as it can be defined as a subset of the [[cartesian product]] (see [[11 - more on maps#map s as a subset of the cartesian product|lecture 11]]).
> 
> let $A$ be a set of students, $B$ be a set of modules. a relation $R\subset A\times B$ is the set of all pairs $(x,y)$ such that the student $x$ is registered for the unit $y$.
> > [!TIP]
> > this is not a map! this relation isn't necessarily one to one, as one student can have many modules.
## equivalence relations 
a relation $*$ on $A$ is a [[equivalence relation]] if:
1. $*$ is *reflexive*; for any $x\in A, x*x$
2. $*$ is *symmetric*; if $x*y$, then $y*x$.
3. $*$ is *transitive*; if $x*y$ and $y*z$ ,then $x*z$.
> [!example] example
> the relation $x=y$ is a [[equivalence relation]] on $\mathbb{Z}$.
> another simple relation is *parity* (odd or even). $2*2$, $2*4$, $4*2$, $1*3$, $1*3,3*5\implies 1*5$
> however, $x<y$ is not an [[equivalence relation]], as $<$ is only **transitive**, not reflexive or symmetric.
## equivalence class
let $*$ be an [[equivalence relation]] on a [[set]] $A$, where $x\in A$. the subset $[x]=\{y\in A\mid x*y\}$ is called the [[equivalence class]] of $x$.
this means that given any element $x$ in $A$, the equivalence class $[x]$ is the [[subset]] of all the elements in $A$ that x is related to.
for the *parity* [[relation]] on $\mathbb{Z}$, the set $[i]$ would be all even numbers if $i$ was even, or all odd numbers if $i$ was odd.
## partition of finite sets.
a partition of a finite set $A$ is a collection of **non-empty subsets** $$A_1,A_2,A_3,\ldots,A_n$$ of A such that
1. $A=A_1\cup A_2\cup \ldots \cup A_n$
2. $A_i\cap A_j=\emptyset$ for $i\ne j$
for example, let $A=\{a,b,c\}$. one partition of this finite set is $\{a\},\{b\},\{c\}$.
but $\{a,b\},\{b,c\}$ is not a partition because $\{a,b\}\cap\{b,c\}=\{b\}\ne\emptyset$
> [!TLDR] tl;dr
> a partition of a finite set is some subsets where no element is shared between subsets and all elements of the parent set are used.
## partition into [[equivalence class]]es
> **theorem.** let $*$ be an [[equivalence relation]] on $A$. then the **distinct** [[equivalence class]]es form a partition of $A$.

for example, for the *parity* relation on $\mathbb{Z}$, there are two *distinct* equivalence classes $$\{\ldots,-4,-2,0,2,4,\ldots\},\{\ldots,-3,-1,1,3,\ldots\}$$
which form a partition of $\mathbb{Z}$.
**proof.** to prove this theorem, we need to show that the definition of a partition is satisfied for the [[equivalence class]]es.
1. **equivalence classes should be non-empty** 
	let $x\in A$, then $x\in[x]$ by reflexiveness, as $x*x$, thus $[x]\ne\emptyset$.
2. **the union of all equivalence classes should be equivalent to $A$**
	take any $x$ in the union of all equivalent classes. $\therefore$ it is in one of the equivalent classes, and so it is in $A$, $\therefore$ as any element is in $A$, the union is a subset of $A$.

	take any $x$ in $A$, then $x\in[x]$ by reflexiveness, which means any element in $A$ is in an [[equivalence class]]. therefore $x$ belongs to the union of all equivalence classes. $A$ is therefore also a subset of the union of all equivalent classes.

	as $A$ is a subset of the union, and the union is a subset of $A$, we therefore can say the union is **equivalent** to $A$.
3. **two distinct [[equivalence class]]es should be disjoint**
	*we need to show that if **x is not equivalent to y**, then $[x]\cap[y]=\emptyset$. we shall do this by contradiction*
	suppose the intersection $[x]\cap[y]\ne\emptyset$. this means that there is an element $z$ in $A$ where z is in $[x]$ and $[y]$. then $x*z$ and also $y*z\implies z*y$. but this means that $x*y$, which contradicts the fact that $x$ and $y$ are two separate relations.