#lecture
# 13 - finite state machines and rational numbers
class: [[CM12004]]
topics mentioned: #sets #finite_state_machine #fractions 
date: 2024-10-28
teacher: [[Mac Yang]]
## recap
> *from [[12 - relations|lecture 12]]:*
+ a [[relation]] $R$ between $A$ and $B$ is a [[subset]] of $A\times B$ such such that $x\in A$ is related to $y\in B$ by some condition if $(x,y)\in R$
+ if $A=B$, we say that $R\subset A\times A$ is a [[relation]] on $A$.
+ a relation $*$ on $A$ is called an [[equivalence relation]] if $*$ is:
	+ *reflexive* (for any $x\in A, x*x$)
	+ *symmetric* (if $x*y$, then $y*x$)
	+ *transitive* (if $x*y$ and $y*z$, then $x*z$)
+ the [[equivalence class]] $[x]$ of a relation on a set $A$ for an element $x\in A$ is the subset of all the elements in $A$ that $x$ is related to.
## finite state machines
a [[finite state machine]] is a abstract machine that can be in **exactly one of a finite number of state** at any given moment in time.
it's used as a model to design different computing tasks and is defined as a **special [[relation]]** on [[set]]s and [[map]]s.

a [[finite state machine]] is defined by a *quintet* $(S,X,Z,w,t)$, where:
+ $S=\{s_1,s_2,\ldots,s_r\}$ is the finite machine *state set*
+ $X=\{x_1,x_2,\ldots,x_m\}$ is the *input set*
+ $Z=\{z_1,z_2,\ldots,z_n\}$ is the *output set*
+ $w:X\times S\to Z$ is the *output map* which maps input $(s,x)$, where $s\in S$ and $x\in X$ to output $z\in Z$ of the machine
+ $t:Z\times S\to S$ is the *state map*, which maps the next state $s'=(x,s)$, where $s\in S$ is the current state, and $x\in X$ is the current input.
> [!EXAMPLE] example: turnstile
> assume that a turnstile can only accept a single coin as an input to unlock the turnstile.
> we can define the *quintet* $(S,X,Z,w,t)$ as the following:
> + the *state set* $S$ as {LOCKED,UNLOCKED}
> + the *input set* $X$ as {coin,push}
> + the *output set* $Z$ as {None, Accept coin and unlock, rotate arm and lock after}
> 
> |   $s$  | $x$    |$w(x,s)=z$|$t(x,s)=s'$
> | --- | --- |---|---|
> | LOCKED    | coin    |Accept coin and unlock|UNLOCKED|
> |LOCKED|push|None|LOCKED|
> |UNLOCKED|coin|None|UNLOCKED|
> |UNLOCKED|push|Rotate arm and lock after|LOCKED|
## rational numbers ($\mathbb{Q}$)
there are many different sets of numbers:
+ Natural numbers ($\mathbb{N}=\{1,2,3,\ldots\}$)
+ Integers ($\mathbb{Z}=\{\ldots,-3,-2,-1,0,1,2,3,\ldots\}$)
+ Rational numbers $\mathbb{Q}$ like $\frac{1}{3},\frac{3}{2},\ldots$
rational numbers can be defined as the set of fractions with integer denominators and numerators:$$\mathbb{Q}=\{\frac{x}{y}\mid x,y\in \mathbb{Z},y\ne0\}$$ however, rational numbers can also be defined as an [[equivalence class]] on two pairs of integers. we first define a [[relation]] $\sim$ on two pairs of integers:$$(p_{1},q_{1})\sim (p_{2},q_{2})\iff p_{1}q_{2}=p_{2}q_{1}$$
this is an [[equivalence relation]], and it is easy to see that it satisfies all the requirements of reflexivity, symmetry, and transitivity.
for example $\frac{1}{2}\sim\frac{2}{4},\frac{1}{2}\sim\frac{3}{6},\ldots$.
this now lets us define a fraction as a [[equivalence class]]:$$[\frac{1}{2}]=\{\frac{1}{2},\frac{3}{6},\frac{27}{54},\ldots\}$$
for any two fractions in this set $\frac{x_1}{y_1}\sim\frac{x_2}{y_2}$, since $\frac{x_1}{y_1}=\frac{x_2}{y_2}$. the class consists of all fractions of the kind $\frac{a}{2a}\ \forall a\in \mathbb{Z},a\ne0$.
### distinguished representative (simplest form)
let $q\in \mathbb{Q}$. there then exists a unique fraction $\frac{x}{y}\in [q]$, such that for any other fraction $\frac{x'}{y'}\in [q]$ there exists an integer $a\in \mathbb{Z}$ that divides $\frac{x'}{y'}$ to give $\frac{x}{y}$. we therefore call this fraction $\frac{x}{y}$ the [[distinguished representative]] of $q$, or its **simplest form**.
> the [[distinguished representative]] is the unique pair $(x,y)$ in the [[equivalence class]] $[\frac{x}{y}]$ such that $m$ and $n$ are **coprime**, and $n>0$.
## $\mathbb{Z}$ as a [[subset]] of $\mathbb{Q}$
recall that the set $\mathbb{Z}=\{\ldots,-3,-2,-1,0,1,2,3,\ldots\}$ represents all the integers. 
we can also interpret this as a [[subset]] of $\mathbb{Q}$:$$\mathbb{Z}=\{[\frac{n}{1}]\mid n\in \mathbb{Z}\}$$
for example, the integer $2$ is the [[equivalence class]] containing $[\frac{2}{1}]$:$$[\frac{2}{1}]=\{\frac{2}{1},\frac{6}{3},\frac{54}{27},\ldots\}$$
## [[arithmetic operations on fractions]]
![[arithmetic operations on fractions]]