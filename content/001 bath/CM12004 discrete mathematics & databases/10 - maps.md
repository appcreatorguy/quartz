#lecture
# 10 - maps
class: [[CM12004]]
topics mentioned: #maps #sets 
date: 2024-10-21
teacher: [[Mac Yang]]
## [[map]]s
a map is a general function that defines how elements from one set associate with another. a map is a relation (for every $x\in A$ determines one **and only one** element $y\in B$)
![[g129.svg]]
the notation used is $f: A\to B$, where $f$ is the map from set $A$ to set $B$.
a map is an generalisation of a [[function]].
### example
+ let $f:\mathbb{Z}\to\mathbb{Z}$, such that to $x\in\mathbb{Z}$ the map $f$ relates $x^2\in\mathbb{Z}$.
	+ this is an example of a [[function]], and could be written as $x\mapsto x^2$ or $f(x)=x^2$ 
## domains and ranges
if $f: A\to B$, then $A$ is the *domain* of $f$ and $B$ is the *range* (or *co-domain*) of $f$.
given $f:A\to B$, if $x\mapsto y$, then $y$ is called the *image* of $x$, and $x$ is called the *argument* of $f$. we can say that $f$ **carries $x$ to $y$**.
## conditions of a [[map]]
a map is only valid if **for every item** in $A$ there exists **one and only one image** in $B$.
a map has to match every item in the first set to only one image in the second.
![[g20.svg]]
## [[map]] and [[function]]s
if the **range** of a map is a set of numbers ($\mathbb{Z,R,Z^+}$), then the map can be called a [[function]].
## surjective maps
a map $f:A\to B$ is called *surjective* if:$$\forall y\in B\exists x\in A,f(x)=y$$
![[g996.svg]]
in simple terms, in a surjective map, every element from the range has a argument. a image may be shared by one or more arguments.
a surjective map is one where all elements from set $B$ are used.
### example
$f(x)=2x$ is surjective $\forall\mathbb{R}$, as every real number $y$ has a pre-image $0.5y$.
## injective maps
a map $f:A\to B$ is *injective* if:$$\forall x_1\in A\ \forall x_2\in A,(x_1\ne x_2)\to(f(x_1)\ne f(x_2))$$
![[g1231.svg]]
in simple terms, in an injective map two different arguments have two different images.
a injective map is a **one-to-one** function, where every image **only has one argument**.
## bijective maps
a map $f:A\to B$ is *bijective* if it is **both surjective and injective**.
this is where every element from set $B$ is used, and only has one argument from set $A$.
![[g1402.svg]]