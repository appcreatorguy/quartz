#lecture
# 14 - cauchy sequences and null sequences
class: [[CM12004]]
topics mentioned: #sequences
date: 2024-10-30
teacher:

## recap
> from [[13 - finite state machine and rational numbers|lecture 13]]:
+ $\mathbb{Q}=\{\frac{x}{y}\mid x,y\in\mathbb{Z},y\ne0\}$
+ the set $\mathbb{Q}$ is the set of all rational numbers.
+ the set $\mathbb{Q}$ is the set of all distinct [[equivalence class]]es of the relation $\sim$ on A.
+ 
## sequence of natural numbers
a [[sequence]] of *rational numbers* is a [[map]] ([[function]])
$$a:\mathbb{N}\to \mathbb{Q}\text{ such that }n\mapsto a(n)$$
given an index $n\in \mathbb{N}$ as the argument, the function defines the value of the $n$-th rational number as its image $a(n)$ (also denoted $a_n$). thus the whole [[sequence]] is $a_1,a_2,\ldots,a_n$, or ${a_n}^{\infty}_{n=1}$
### arithmetic operations on sequences
the sum and product of two sequences is defined as follows:
$$\{a_n\}+\{b_n\}=\{a_n+b_n\}$$
$$\{a_n\}\cdot\{b_n\}=\{a_nb_n\}$$
for example, the sum of the two sequences $\{n\},\ \{\frac{1}{n}\}$ is $\{n+\frac{1}{n}\}$.
the product of $\{n\},\ \{\frac{1}{n}\}$ is $\{1\}$.

subtraction is defined as 
$$\{a_n\}-\{b_n\}=\{a_n\}+\{-b_n\} .$$
division is defined as
$$\{a_n\}\div\{b_n\}=\{a_n\}\cdot\{\frac{1}{b_n}\}$$
if there is no 0 in the sequence $\{b_n\}$.
## cauchy sequences
a sequence $\{a_n\}$ of rational numbers is a *[[cauchy sequence]]*, or **converging [[sequence]]** if for every rational $\varepsilon>0$ there exists a natural number $N$ such that for any two natural numbers $m,n\ge N$, we have $|a_n-a_m|<\varepsilon$.

**essentially**, for a sequence to be converging, there must be a point at which any following values are arbitrarily close to each other.
this implies that the numbers of a cauchy sequence get arbitrarily close to each other as the sequence progresses; the sequence is *converging*.
>[!EXAMPLE] example
> *the sequence $\{a_n\}$ where $a_n=\frac{1}{n}$ is a [[cauchy sequence]].*
> **proof.** we must check that the defitiotion for a cauchy sequence holds for $\{a_n\}$.
> 1. fix any rational number $\varepsilon >0$.
> 2. choose any positive integer $N$ greater than $\frac{1}{\varepsilon}$
> 3. then for any $n,m\ge N>\frac{1}{\varepsilon}$, it follows that $|a_n-a_m|=|\frac{1}{n}-\frac{1}{m}|<\varepsilon$, which means that $\{a_n\}$ is a cauchy sequence. $\square$
## null sequences
a *[[null sequence]]* is a [[sequence]] $\{a_n\}$ of rational numbers with the following property. for any rational number $\varepsilon >0$ there exists a natural number $N$ such that if a natural number $n\ge N$, then $|a_n|<\varepsilon$.

**essentially**, the numbers of a null sequence converge to 0.
> [!EXAMPLE] example
> *the sequence $\{a_n\}$ where $a_n=\frac{1}{n}$ is a [[null sequence]].*
> **proof.** we must check that the definition of a null sequence holds for $\{a_n\}$.
> 1. fix any rational number $\varepsilon >0$.
> 2. choose any positive integer $N$ greater than $\frac{1}{\varepsilon}$.
> 3. then for any $n\ge N\ge \frac{1}{\varepsilon}$, we have $|a_n|=\frac{1}{n}<\varepsilon$.

### null sequences are cauchy sequences
**theorem.** any [[null sequence]] $\{a_n\}$ is a [[cauchy sequence]].
**proof.** we check that the definition of a [[cauchy sequence]] holds for $\{a_n\}$.
1. fix any rational number $\varepsilon >0$.
2. by the definition of a [[null sequence]], for the number $\varepsilon\div 2$ one can choose a natural number $N$ such that if $n,m\ge N$, then $|a_n|<\frac{\varepsilon}{2}$ and $|a_m|<\frac{1}{\varepsilon}$.
3. it follows that $|a_n-a_m|\le|a_n|-|a_m|<\frac{\varepsilon}{2}+\frac{\varepsilon}{2}=\varepsilon$, and the definition of a [[cauchy sequence]] is satisfied.
## equivalence relations for cauchy sequences
let $C$ be the set of all [[cauchy sequence]]s. introduce the following relation $\sim$ on $C$. For $\{a_n\},\{b_n\}\in C$, let $\{a_n\}\sim\{b_n\}$ if the difference $\{a_n\}-\{b_n\}=\{a_n-b_n\}$ is a null sequence.
for example $\{\frac{1}{n}\}\sim\{\frac{1}{n^2}\}$.
this relation $\sim$ is also a [[equivalence relation]], as it is easily proven that it is *reflexive*, *symmetric*, and *transitive*.