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
\dots&\dots&\dots&\dots\\
a_{m1}&a_{m2}&\dots&a_{mn}
\end{pmatrix}
$$
the numbers $a_{ij}\ |\ i=1,2,\dots,m\ j=1,2,\dots,n$ are called the *elements* of $A$. 
### determinants 
the *[[determinant]]* $\det A$ of a matrix $A$ is a number that we can define by induction, as follows:
$$
\begin{aligned}
&\textbf{Definition}\ \text{If $n=1$ then the matrix $A$ contains just one element $a_{11}$, and we set $\det A=a_{11}$.}\\&\text{Assume that $n>1$ and that we have the determinants of $(n-1)\times (n-1)$ defined.}\\
&\text{Then we can fix any number such that $1\le i\le n$, and defined.}\\
&\det A=(-1)^{i+1}a_{i1}\det A_{i1}+\cdots+(-1)^{i+j}a_{ij}\det A_{ij}+\cdots+(-1)^{i+n}a_{in}\det A_{in}.\\
&\text{It can be proved that $\det A$ does not depend on the choice of the number $i$, i.e,}\\&\text{for any $1\le i\le n$ the number $\det A$ will be the same.}
\end{aligned}
$$
 this is the method that is commonly taught first, as it gives an easy formula to remember for $2\times2$ and $3\times3$ matrices. however, there is an alternate, non-inductive method to define the determinant as well.
## Cramer's rule
we can now define a general theorem for [[Cramer's rule]] for any $n\times n$-matrix.
$$
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
