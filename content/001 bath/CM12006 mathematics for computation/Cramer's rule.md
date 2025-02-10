#matrices
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