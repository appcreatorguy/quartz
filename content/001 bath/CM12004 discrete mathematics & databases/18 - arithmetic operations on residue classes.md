#lecture
# 18 - arithmetic operations on residue classes
class: [[CM12004]]
topics mentioned: #divisibility #congruence
date: 2024-11-15
teacher: [[Mac Yang]]
## recap
> *from [[17 - divisibility of integers|lecture 17]]:*
+ for $a,b, m\in \mathbb{Z},m>0$, we say that $a$ is **congruent to** $b$ modulo $m$, if $a-b$ is divisible by $m$.
	+ $m$ is called the modulus, which is a positive integer
	+ $a$ is congruent to $b$ modulo $m$ which is denoted by $a\equiv b \mod m$
	+ for example, $7\equiv 1 \mod 3$ as $7-1=6$ which is divisible by 3.
## modular congruence properties
1. For $a,m\in\mathbb{Z},m>0$, let integer $r$ be the remainder of the $a\div m$. then $a\equiv r\mod m$.
2. fix $m\in\mathbb{Z}, m>0$. the relation "congruent modulo $m$" is an [[equivalence relation]] on $\mathbb{Z}$.
3. for $a,b,c,d,m\in\mathbb{Z},m>0$, if $a\equiv b\mod m$ and $c\equiv d\mod m$, then: ^ad27de
	1. $a+c\equiv b+d\mod m$
	2. $ac\equiv bd\mod m$
	**proof**: if $a\equiv b\mod m$, then $a-b$ is divisible by $m$. if $c\equiv d\mod m$, then $c-d$ is divisible by $m$. then we have $(a+c)-(b+d)=(a-b)+(c-d)$ is divisible by $m$. thus $a+c\equiv b+d\mod m.\ \square$
## residue classes 
fix $m\in\mathbb{Z}, m>0$, the *[[residue class]]es* modulo $m$ are defined as the distinct [[equivalence class]]es of the "congruent modulo m" relation.
the set of all [[residue class]]es modulo m is denoted by $\mathbb{Z}/m\mathbb{Z}$ or just $\mathbb{Z}_m$.

## addition and multiplication on [[residue class]]es
+ let $x,y\in\mathbb{Z}/m\mathbb{Z}$ be two residue classes modulo m, and $a\in x,c\in y$ be two representatives (e.g: the natural representatives).
**addition ($+$)**: define $x+y$ as the residue class containing $a+c$.
**multiplication ($\cdot$)**: define $x\cdot y$ as the residue class containing $a\cdot c$.
+ due to [[18 - arithmetic operations on residue classes#^ad27de|proposition 3]], the operations $+,\cdot$ do not depend on a choice of representatives $a,c$. $\therefore$, $+$ and $\cdot$ are **well-defined** on the set $\mathbb{Z}/m\mathbb{Z}$.
## subtraction and division on [[residue class]]es
**subtraction ($-$)** can be defined as the inverse operation of addition ($+$).
	let $x,y\in\mathbb{Z}/m\mathbb{Z}$ be two residue classes modulo $m$. define $x-y$ as $x+(-y)$, where $-y$ is the additive inverse of y such that $y+(-y)=[0]$.
	+ $[0]$ is the identity element w.r.t addition ($[a]+[0]=[a]$ and $[0]+[a]=[a]$).
**division ($\div$)** can be defined as the inverse operation of multiplication($\cdot$).
	let $x,y\in\mathbb{Z}/m\mathbb{Z}$ be two residue classes modulo $m$,$y\ne[0]$. define $y\div y$ as $x\cdot y^{-1}$, where $y^{-1}$ is the multiplicative inverse of $y$ such that $y\cdot y^{-1}=[1]$.
	+ $[1]$ is the identity element w.r.t multiplication ($[a]\cdot[1]=[a]$ and $[1]\cdot][a]=[a]$).
### multiplicative inverse of residue classes
not every [[residue class]] $x\ne [0] \in \mathbb{Z}/m\mathbb{Z}$ has a multiplicative inverse $x^{-1}$.
**theorem.** a residue class $x\in\mathbb{Z}/m\mathbb{Z}$ has multiplicative inverse *if and only if* integers in $x$ are *[[relatively prime]]* with m.
**proof.** we can prove that if a residue class $x\in\mathbb{Z}/m\mathbb{Z}$ has a multiplicative inverse, then integers in $x$ are relatively prime with $m$. however, we must also prove that if integers in a residue class $x\in\mathbb{Z}/m\mathbb{Z}$ are relatively prime with $m$, then $x$ has a multiplicative inverse.
- for an integer $a\in x$, if $a$ is relatively prime with $m$, $\exists u,v\in \mathbb{Z}\mid au+mv=1$.
- then $1-au=mv$ is divisible by $m$, we have $1\equiv au\mod m$.
- given $x=[a]$, we have $x\cdot[u]=[a]\cdot[u]=[a\cdot u]=[1]$.
- then we can choose $x^{-1}$ as the residue class containing $u$, i.e:$x^{-1}=[u]$.