#lecture
# 17 - divisibility of integers
class: [[CM12004]]
topics mentioned: #divisibility #congruence 
date: 2024-11-17
teacher: [[Mac Yang]]
## divisor
let $\mathbb{Z}$ denote the set of all integers, for $a,b\in\mathbb{Z},a\ne 0$, if $\exists q\in\mathbb{Z}\mid b=aq$, we say that $b$ is divisible by $a$. in this case $a$ is the *[[divisor]]* of $b$, and $q$ is the quotient.
$b$ is divisible by $a$ is denoted by $a\mid b$. for example, $2\mid 4$. however, $5\not\mid 4$.
## remainder
for $a,b\in\mathbb{Z}, a>0$, if $\exists q, r\in\mathbb{Z}, 0\le r\le a\mid\ b=aq+r$, we say that $b$ is divisible by $a$ with the *[[remainder]]* $r$.
## prime numbers
![[prime number]]
## relatively prime integers
![[relatively prime]]
## modular congruence
for $a,b,m\in\mathbb{Z},m>0$, we say that $a$ is *[[congruent]]* to $b\pmod{m}$, if $a-b$ is divisible by $m$ ($(a-b)\mid m$) (alternatively, if $a$ and $b$ are divisible by $m$ with the same remainder).
+ $m$ is called the modulus, which is a positive integer
+ $a$ is congruent to $b$ modulo $m$, which is denoted by $a\equiv b\pmod{m}$.
> [!EXAMPLE] example
> + $7\equiv 1\pmod{3}$
> 	+ $7-1=6$ which is divisible by $3$ ($7$ and $1$ are divisible by $3$ with the same remainder $1$)
> + $50\equiv 175\pmod{25}$
> 	+ $50-175=-125$, which is divisible by $25$ ($50$ and $175$ are both divisible by $25$)
> + $4\equiv 2\pmod{2}$
## modular congruence as a [[equivalence relation]]
**proposition 1.** for $a,m\in\mathbb{Z},m>0$, let integer $r$ be the remainder of the division of $a$ by $m$. then $a\equiv r\pmod{m}$.
**proof.** since $r$ is the remainder of the division of $a$ by $m$, we have
$$a=qm+r,\text{ where }q\in\mathbb{Z}$$
then $a-r=qm$ is divisible by $m$, which means $a\equiv r\pmod{m}$ by definition.
**proposition 2.** fix $m\in\mathbb{Z},m>0$. the relation "congruent modulo m" is a [[equivalence relation]] on $\mathbb{Z}$. it satisfies the following three properties of reflexivity, symmetry and transitivity.
**proof.**
1. $a-a=0|m$.
2. if $a-b|m$, then $b-a=-(a-b)|m$.
3. if $a-b$ and $b-c$ are divisible by $m$, then $a-c=(a-b)+(b-c)|m$.
## [[residue class]]es
recall [[equivalence class]]es: 
> let $*$ be an [[equivalence relation]] on a set $A,x\in A$. the subset $[x]=\{y\in A\mid x*y\}$ is called the [[equivalence class]] of the element $x$. the equivalence class $[x]$ contains all the elements in $A$ that $x$ is related, or equivalent to. all the elements in $[x]$ are equivalent to each other. if $x*y,\implies[x]\equiv[y]$.

from this, we can define a [[residue class]].
**definition.** fix $m\in\mathbb{Z},m>0$. the [[residue class]]es modulo $m$ are defined as the distinct equivalence classes of the "congruent modulo $m$" [[equivalence relation]].

**theorem.** Fix $m\in\mathbb{Z},m>0$. the number of [[residue class]]es modulo $m$ is **exactly $m$**.
**proof.**
1. by prop. 1, for every integer $a$ there is an integer $r\ (0\le r <m)$ congruent to $a\pmod{m}$ ($r$ is the remainder of the division of $a$ by $m$), this means that $a\in[r]$. as there are $m$ possible remainders $0,1,\ldots,m-1$, we have $m$ equivalence classes $[0],[1],\ldots,[m-1]$.
2. every two distinct integers between $0$ and $m-1$ are not congruent modulo $m$. $\therefore$ the $m$ equivalence classes are all distinct. the number of residue classes is therefore **exactly** $m$. $\square$