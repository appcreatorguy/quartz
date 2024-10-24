#lecture
# 11 - more on maps
class: [[CM12004]]
topics mentioned: #maps #sets 
date: 2024-10-23
teacher: [[Mac Yang]]

## recap
> from [[10 - maps|lecture 10]]
+ a **[[map]]** $f:A\to B$ is a rule that for every $x\in A$ determines **one and only one** element $y\in B$
+ $A$ is called the **domain**, $B$ is the **range** of $f$.
+ given $x\mapsto y$, x is the **image**, y is the **argument** of $f$.
+ for a map to be valid:
	+ every $x\in A$ is "used"
	+ one $x\in A$ only corresponds to one image $y\in B$ (one-to-one/one-to-many)
+ if the range $B$ is a set of numbers, then $f$ is a **[[function]]**
+ a map is **surjective** if every element from $B$ has at least one value in $A$.
+ a map is **injective** if two different $A$s have two different images.
+ a map is **bijective** if it's both surjective **and** injective.
## inverse maps
let $f:A\to B$ be a map. the map $f^{-1}:B\to A$ is the *[[inverse map]]* to f, if $f(x)=y$ is equivalent to $f^{-1}(y)=x$. for example, the inverse map of $f(x)=x^3$ is $f^{-1}=\sqrt[3]{y}$
however, **not every map has an [[inverse map]]**. for example, the map $f(x)=x^2$ has no solution for $y<0$, and $x=\pm\sqrt{y}$ for $y>0$. therefore, the inverse function cannot exist, as one argument can map to two images, and not every argument is "used".
![[g208.svg]]
### what maps can be inversed?
> **theorem.** a map $f:A\to B$ has an inverse *if and only if* $f$ is **bijective**.

to prove this theorem, we need to prove:
+ if a map $f:A\to B$ has an inverse map, then f is bijective.
+ if a map $f:A\to B$ is bijective, then $f$ has an inverse map.
the detailed proof is [[Full-LN.pdf#page=17|here]].
## composition of maps
maps can be *[[map composition|compositions]]*, or the combination of two others. let $f:A\to B,g:B\to C$. the composition of $f$ and $g$ is then $g\circ f:A\to C$ such that $g\circ f(x)=g(f(x))$.
![[g121.svg|350]]
for example, if $f(x)=x+1,g(y)=y^2$, then $g\circ f(x)=g(x+1)=(x+1)^2$.
## properties of [[map composition]]s
> [!EXAMPLE] proof
> > ***theorem.** the composition of two injective/surjective maps is injective/surjective.*
> 
> **proof.** let both maps $f:A\to B,\ g:B\to C$ be injective.
> let $x_1,x_2\in A$ and $x_1\ne x_2$. then $f(x_1)\ne f(x_2)$ since $f$ is injective.
> as $f(x_1)\ne f(x_2)$, then $g(f(x_1))\ne g(f(x_2))$ since $g$ is injective.
> $\therefore$ for $x_1\ne x_2$ we have $g\circ f(x_1)\ne g\circ f(x_2),\ \implies g\circ f$ is injective. $\square$
> 
> the proof for surjective maps follows a similar pattern.
> the theorem also implies a corollary:
> > ***corollary.** the composition of two bijective maps is bijective.*
> 
## [[inverse map]]s and the identity [[map]]
let $f:A\to B$ be a **bijective** map. let $I_A:A\to A$ be the identity map on $A$ and $I_B:B\to B$ be the identity map on $B$.
> [!EXAMPLE] proof 
> > ***theorem.** composition $f^{-1}\circ f$ coincides with the identity map $I_A$; composition $f\circ f^{-1}$ coincides with the identity map $I_B$.
> 
> **proof.** let $x\in A,\ f(x)=y\in B$. by the definition of $f^{-1}$, we have $f^{-1}(y)=x$.
> then $f^{-1}\circ f(x)=f^{-1}(f(x))=f^{-1}(y)=x$, which means that $f\circ f^{-1}$ coincides with $I_A$.
> similarly, $f\circ f^{-1}(y)=f(f^{-1}(y))=f(x)=y$, which means $f\circ f^{-1}$ coincides with $I_B$.

> [!EXAMPLE] proof 
> > ***theorem.** each of the compositions $I_B\circ f$ and $f\circ I_A$ coincides with $f$.
> 
> **proof.** let $x\in A,f(x)=y\in B$. Then $I_B\circ f(x)=I_B(f(x))=I_B(y)=y$, which means $I_B\circ f$ coincides with $f$.
> similarly $f\circ I_A(x)=f(I_A(x))=f(x)=y$, which means that $f\circ I_A$ coincides with $f$.

these two theorems imply that $\circ$ can be considered as an operation on bijective maps from set $A$ to itself, similarly to how numbers can be multiplied.
![[g173.svg|250]]
where $a$ is a [[function]].
however, one difference between $\circ$ and $\cdot$ is that $\circ$ is not a **commutative operation**. (in general, $g\circ f\ne f\circ g$, but $a\cdot b=b\cdot a$)
>[!EXAMPLE]
> let $f(x)=x+1,\ g(y)=y^2$, then $g\circ f(x)=g(f(x)=(x+1)^2$. however $f\circ g(y)=f(g(y))=f(y^2)=y^2+1\ne g(f(y))\ne(y+1)^2$.
## [[map]]s as a [[subset]] of the [[cartesian product]]
> recall: the [[cartesian product]] of two sets $A,\ B$ is $A\times B=\{(x,y)\mid(x\in A)\land(y\in B)\}$.

thus, a map $f:A\to B$ is a subset of $A\times B$ with the following property: for any $x\in A$ there exists **one and only one** $y\in B$ such that $(x,y)\in f$.
in simple terms, a map is defined as a set which contains all **valid** (argument, image) pairs as a **subset of all possible** (argument, image) input/output pairs.

the map $f:A\to B$ is defined as $\{(1,a),(2,c),(3,c)\}$, which is a subset of all $A\times B$.
![[g116.svg|250]]
for a function like $y=f(x)=x^2$, this definition describes the graph of the function, i.e, it is a set of pairs of points.
![[g69-7.svg|200]]
