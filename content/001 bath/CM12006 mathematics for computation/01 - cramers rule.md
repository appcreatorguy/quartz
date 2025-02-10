#lecture
# 01 - Cramer's rule
class: [[CM12006]]
topics mentioned: #matrices
date: 2025-02-06
teacher: 
## solving systems of equations
consider the following system of two linear equations:
$$
\begin{align*}
a_1X+b_1Y&=c_1\\
a_2X+b_2Y&=c_2
\end{align*}
$$
we can construct a matrix that corresponds to the coefficients of this system,$$\begin{pmatrix}a_1&b_1\\a_2&c_2\end{pmatrix}$$ we already know that to solve the system of equations using algebra alone, we can eliminate one of the variables by transforming one equation, and subtracting it from the other. this leaves us with the general form to find each variable as:
$$
\begin{align}
X=\frac{c_1b_2-c_2b_1}{a_1b_2-a_2b_1}\\
Y=\frac{a_1c_2-a_2c_1}{a_1b_2-a_2b_1}\\
\end{align}
$$
however, if we also consider the following matrices, made from a combination of the coefficients of the variables and the constants of the solutions of each equation:
$$
A_X=
\begin{pmatrix}
c_1&b_1\\c_2&b_2
\end{pmatrix}
\ 
A_Y=
\begin{pmatrix}
a_1&c_1\\a_2&c_2
\end{pmatrix}
$$
then we can simplify our general form of our solution, as the **parts of the fraction correspond to the determinants of our set of matrices**. this is the basis of *[[Cramer's rule]]*.
$$
\begin{aligned}
&\textbf{Theorem.}\ \text{Assume that the determinant}\det A\ne 0.\ \text{Then a solution $(x,y)$ of}\\&\text{ the systems of equations is given by the following formulas:}\\
&x=\frac{\det A_X}{\det A},\ y=\frac{\det A_Y}{\det A}
\end{aligned}
$$
## matrices and determinants 
a $(m\times n)$ matrix $A$ is a rectangular table of rational numbers having $m$ rows and $n$ columns.
$$
A=\begin{pmatrix} 
a_{11}&a_{12}&\dots&a_{1n}\\
a_{21}&a_{22}&\dots&a_{2n}\\
\vdots&\vdots&\ddots&\vdots\\
a_{m1}&a_{m2}&\dots&a_{mn}
\end{pmatrix}
$$
the numbers $a_{ij}\ |\ i=1,2,\dots,m\ j=1,2,\dots,n$ are called the *elements* of $A$. 
### determinants 
the *[[determinant]]* $\det A$ of a matrix $A$ is a number that is the products of the element on the main diagonal subtracted from the elements on the other diagonal in a $2\times2$ matrix.
$$
A_2=\begin{pmatrix}
a_{11} & a_{12} \\
a_{21} & a_{22}
\end{pmatrix}
\ \det A_{2}=a_{11}a_{22}-a_{21}a_{12}
$$
$$
A_{3}=\begin{pmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23}  \\
a_{31} & a_{32} & a_{33}
\end{pmatrix}
\ \det A_{3}=a_{11}a_{22}a_{33}+a_{12}a_{23}a_{31}+a_{13}a_{21}a_{32}-a_{13}a_{22}a_{31}-a_{12}a_{21}a_{33}-a_{11}a_{23}a_{32}
$$
### an inductive proof
we can also formally define the [[determinant]]  by induction, as follows:
$$
\begin{aligned}
&\textbf{Definition}\ \text{If $n=1$ then the matrix $A$ contains just one element $a_{11}$, and we set $\det A=a_{11}$.}\\&\text{Assume that $n>1$ and that we have the determinants of $(n-1)\times (n-1)$ defined.}\\
&\text{Then we can fix any number such that $1\le i\le n$, and defined.}\\
&\det A=(-1)^{i+1}a_{i1}\det A_{i1}+\cdots+(-1)^{i+j}a_{ij}\det A_{ij}+\cdots+(-1)^{i+n}a_{in}\det A_{in}.\\
&\text{It can be proved that $\det A$ does not depend on the choice of the number $i$, i.e,}\\&\text{for any $1\le i\le n$ the number $\det A$ will be the same.}
\end{aligned}
$$
this is the method that is commonly taught first, as it gives an easy formula to remember for $2\times2$ and $3\times3$ matrices. however, there is an alternate, non-inductive method to define the determinant as well.
this method gives us a neat sum to calculate the determinant of a $3\times3$ matrix: $$\det A_{3}=a_{11}\det \begin{pmatrix}
a_{22} & a_{23} \\
a_{32} & a_{33}
\end{pmatrix}-a_{12}\det \begin{pmatrix}
a_{21} & a_{23} \\
a_{31} & a_{33}
\end{pmatrix}+a_{13}\det \begin{pmatrix}
a_{21} & a_{22} \\
a_{31} & a_{32}
\end{pmatrix}$$
### proof through configurations
we begin by defining a *[[permutation]]*. this is an **ordering of a set of numbers**. it can also be classed as a one to one *[[injective map]]* on a set of numbers. for example, if we consider the set of numbers $\{1, 2, 3\}$, then one possible permutation would be $(1, 2, 3)$, which is the original ordering. another permutation could be $(1, 3, 2)$, where the second and third elements have been swapped.

we can then define an *[[inversion]]* as a pair of elements **that are "in the wrong order"**. in essence they are a pair of elements that occur in the set in decreasing order. for example, in the permutation $(1, 3, 2)$, the pair $(3, 2)$ is an inversion because $3$ is greater than $2$, but it appears before $2$ in the permutation.
$$
\begin{aligned}
\mathbf{Definition}\ &\text{Let $i_{1},i_{2},\dots,i_{n}$ be a permutation of numbers $1,2,\dots,n$. An}\\ &\text{inversion in $i_{1},i_{2},\dots,i_{n}$ is a pair $(i_{k}, i_{l})$ such that $k<l$ and $i_k>i_l$. For example,}\\&\text{ in the permutation $2,3,1$ of 1,2,3 there are two inversions, (2,1) and $(3,1)$.}
\end{aligned}
$$

next, we must define a *configuration*. this is a set of elements in a matrix such that for any two elements, say $a_{ij}$ and $a_{kl}$, in the configuration, $i \neq k$ and $j \neq l$. (**they are all from different rows and columns**). take the maximal configuration possible from a given matrix; this will always be a set of $n$ elements, where $n$ is the number of rows (or columns) in the matrix. thus a configuration can be written as the set $\{a_{1i_{1}},a_{2i_{2}},\dots,a_{ni_{n}}\}$, where $\{i_{1},i_{2},\dots,i_{n}\}$ is a permutation of $\{1,2,\dots,n\}$.

lastly, we must define $\sigma(i_{1},\dots i_{n})$ as a shorthand for the number of inversions in the given permutation $i_{1},\dots,i_{n}$.

finally, we can define the derivative of a $n\times n$ square matrix as a sum:
$$
\begin{align}
\mathbf{Definition} & \ \text{The determinant $\det A$ of A is the sum over all configurations $\{a_{1i_{1}},a_{2i_{2}},\dots,a_{ni_{n}}\}$} \\
&\det A = \sum_{\{a_{1i_{1}},a_{2i_{2}},\dots,a_{ni_{n}}\}}(-1)^{\sigma(i_{1},\dots,i_{n})}a_{1i_{1}},a_{2i_{2}},\dots,a_{ni_{n}}
\end{align}
$$
## Cramer's rule
we can now define a general theorem for [[Cramer's rule]] for any $n\times n$-matrix.
$$`
\begin{aligned}
\textbf{Theorem}\ &\text{(Cramer's rule)}\ \text{Consider a system of equations:}\\
&\begin{equation}
\begin{split}
a_{11}X_{1}+a_{12}X+\cdots+a_{1n}X_n&=b_1\\
\cdots\quad\cdots\quad&\cdots\\
a_{n1}X_1+a_{n2}X_2+\cdots+a_{nn}X_n&=b_n
\end{split}
\end{equation}\\
&\text{Consider the matrix $A=||a_{ij}||_{1\le i\le n,1\le j\le n}$ of this system. Assume that $\det A\ne0$.}\\
&\text{For each $j=1,2,\ldots,n$ denoted by $A_{X_{j}}$ the matrix obtained from $A$ by replacing }\\&\text{the column vector of $j$ by the column vector of $b$, i.e,}
\begin{pmatrix}
a_{1j}\\a_{2j}\\\cdots\\a_{nj}
\end{pmatrix}\text{, by }
\begin{pmatrix}
b_1\\b_2\\\cdots\\b_n
\end{pmatrix}.\\
&\textit{Thus, a solution of the system of equations is given by the following formula,}\\
&x_j=\frac{\det A_{X_j}}{\det A}\ \forall j=1,2,\ldots,n.
\end{aligned}
$$
