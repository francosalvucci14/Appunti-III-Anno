# Matrici definite positive

Una matrice $A \in \mathbb C^{n\times n}$ si dice definita positiva se $Re(\underline{x}^{\star}A\underline{x}) > 0$ per ogni vettore $x \in \mathbb C^{n} - \{0\}$. Notiamo che $$\begin{align*}
Re(\underline{x}^{\star}A\underline{x})&=\frac{\underline{x}^{\star}A\underline{x}+\overline{\underline{x}^{\star}A\underline{x}}}{2}=\frac{\underline{x}^{\star}A\underline{x}+(\underline{x}^{\star}A\underline{x})^{\star}}{2}\\
&= \frac{\underline{x}^{\star}A\underline{x}+\underline{x}^{\star}A^{\star}\underline{x}}{2}=\underline{x}^{\star}\left(\frac{A+A^{\star}}{2}\right)\underline{x}\\
&= \underline{x}^{\star}Re(A)\underline{x}
\end{align*}$$ dove $$Re(A)=(A+A^{\star}),\:\:\:Im(A)=\frac{A-A^{\star}}{2i},\:\:\:A=Re(A)+Im(A)$$
Sia la parte reale $Re(A)$ che la parte immaginaria $Im(A)$ di una qualsiasi matrice $A \in \mathbb C^{n\times n}$ sono matrici hermitiane
Di conseguenza $\underline{x}^{\star}Re(A)\underline{x}\in \mathbb R\:\:\:\forall \underline{x}\in \mathbb C^{n}$. Dunque $$\begin{align*}
A \text{ è definita positiva }&\iff Re(\underline{x}^{\star}A\underline{x})>0\:\:\: \forall \underline{x}\in \mathbb C^{n}-\{0\}\\
&\iff \underline{x}^{\star}Re(A)\underline{x}>0\:\:\: \forall \underline{x}\in \mathbb C^{n}-\{0\}\\
&\iff Re(\underline{x}^{\star}Re(A)\underline{x})>0 \:\:\: \forall \underline{x}\in \mathbb C^{n}-\{0\}\\
&\iff Re(A) \text{ è definita positiva}  
\end{align*}$$ Ogni matrice definita positiva $A$ è sicuramente invertibile perché i suoi autovalori hanno parte reale positiva (e quindi sono diversi da 0). Prendiamo $\underline{x}\ne\underline{0}$ autovettore corrispondente a $A$: $$\begin{align*}
A\underline{x}=\lambda\underline{x}&\implies \underline{x}^{\star}A\underline{x}=\underline{x}^{\star}(\lambda\underline{x})=\lambda\underline{x}^{\star}\underline{x}=\lambda\sum\limits_{i=1}^{n}\overline{x_{i}}x_{i}=\lambda\sum\limits_{i=1}^{n}|x_{i}|^{2}\\
&\implies \frac{\underline{x}^{\star}A\underline{x}}{\sum\limits_{i=1}^{n}|x_{i}|^{2}}\implies Re(\lambda)=\frac{Re(\underline{x}^{\star}A\underline{x})}{\sum\limits_{i=1}^{n}|x_{i}|^{2}} >0
\end{align*}$$

## Teorema

Sia $A \in \mathbb C^{n\times n}$ una matrice hermitiana e siano $A_{1},A_{2},\dots,A_{n}$ le sue sottomatrici principali di testa: $$A_{1}=[a_{11}],\:\:\:A_{2}=\begin{bmatrix}a_{11} & a_{12} \\ a_{21} & a_{22}\end{bmatrix},\:\:\:A_{3}=\begin{bmatrix}a_{11} & a_{12} & a_{13} \\ a_{21} & a_{22} & a_{23} \\ a_{31} & a_{32} & a_{33}\end{bmatrix},\:\:\:\dots\:\:\:,\:\:\:A_{n}=A$$
Le seguenti condizioni sono equivalenti: 
- $A$ è definita positiva 
- gli autovalori di $A$ sono reali e positivi
- $\det(A_{k})>0$ per ogni $k=1,\dots,n$ 

## Esempio 1
Dire se la matrice $$A=\begin{bmatrix}2 & -1 & 1  \\ -1 & 2 & 0 \\ 1 & 0 & 1 & \end{bmatrix}$$
è definita positiva.

**Soluzione**
Osserviamo che $A$ è hermitiana (reale e simmetrica). Pertanto grazie al [[#Teorema|teorema]], $A$ è definita positiva se e solo se $\det(A_{k})>0$ per ogni $k=1,2,3$. Si ha $$\begin{align*}
\det(A_{1})&=2>0\\
\det(A_{2}) &= \begin{vmatrix}2 & -1\\ -1  & 2\end{vmatrix}=3>0\\
\det(A_{3}) &= \begin{vmatrix}2 & -1 & 1 \\-1 & 2 & 0\\1 & 0 & 1\end{vmatrix}=\begin{vmatrix}-1 & 1 \\2 & 0\end{vmatrix}+\begin{vmatrix}2 & -1 \\-1 & 2\end{vmatrix}=-2+3=1>0
\end{align*}$$ Dunque $A$ è definita positiva.

# Polinomi di matrici

Se $p(\lambda)=a_{0}+a_{1}\lambda+\dots+a_{m}\lambda^{m}$ è un polinomio e $A \in \mathbb C^{n\times n}$ è una matrice, definiamo la matrice $$p(A)=a_{0}I+a_{1}A+a_{2}A^{2}+\dots+a_{m}A^{m}$$

**Esempio** 
Se $p(\lambda)=1-2\lambda^{2}+\lambda^{3}$, allora $$p(A)=I-2A^{2}+A^{3}$$ 
**Teorema**
Se $p(\lambda)$ è un polinomio e $A\in \mathbb C^{n\times n}$ è una matrice con autovalori $\lambda_{1},\lambda_{2},\dots,\lambda_{n}$, allora gli autovalori della matrie $p(A)$ sono $p(\lambda_{1}),\dots,p(\lambda_{n})$.

**Dim.**
Dimostriamo il teorema soltanto in tre casi.

*Caso 1.* Il polinomio $p(\lambda)=a_{0}$ è costante. In tal caso, $p(A)=a_{0}I$ e i suoi autovalori sono $\underbrace{a_{0},\dots,a_{0}}_{\text{n volte}}$. Dunque gli autovalori di $p(A)$ sono $p(a_{0}),\dots,p(a_{0})$ e la tesi del teorema vale.
*Caso 2.* Il polinomio $p(\lambda)=a_{0}+a_{1}\lambda$ ha grado 1. In tal caso il polinomio caratteristico di $p(A)$ e quello di $A$ sono legati dalla seguente relazione: per ogni $\lambda\in\mathbb C$, $$\begin{align*}
C_{p(A)}(\lambda)&=\det(\lambda I-p(A))=\det(\lambda I-(a_{0}I+a_{1}A))=\det((\lambda-a_{0})I-a_{1}A)=\\
&= \det\left(a_{1}\left(\frac{\lambda-a_{0}}{a_{1}}I-A\right)\right)=a_{1}^{n}\det\left(\frac{\lambda-a_{0}}{a_{1}}I-A\right)=\\
&= a_{1}^{n}C_{A}\left(\frac{\lambda-a_{0}}{a_{1}}\right)
\end{align*}$$
Dunque gli autovalori di $p(A)$ sono $$\begin{align*}
\{\lambda\in\mathbb C:C_{p(A)}=0\}&=\left\{\lambda\in\mathbb C:C_{A}\left(\frac{\lambda-a_{0}}{a_{1}}\right)=0\right\} =\left\{\lambda\in \mathbb C:\frac{\lambda-a_{0}}{a_{1}}=\lambda_{1},\dots,\lambda_{n}\right\} \\
&= \left\{\lambda\in \mathbb C:\lambda=a_{0}+a_{1}\lambda_{1},\dots,a_{0}+a_{1}\lambda_{n}\right\}=\{a_{0}+a_{1}\lambda_{1},\dots,a_{0}+a_{1}\lambda_{n}\}\\
&= \{p(\lambda_{1}),p(\lambda_{2}),\dots,p(\lambda_n)\}
\end{align*} $$ 
*Caso 3.* La matrice $A$ è diagonalizzabile. In tal caso esistono una matrice invertibile $X$ e una matrice diagonale $D=\text{diag}(\lambda_{1},\dots,\lambda_{n})$ (avente sulla diagonale gli autovalori di A) tali che $$\begin{align*}
A&=XDX^{-1}\\
A^{2}&=XDX^{-1}XDX^{-1}=XD^{2}X^{-1}\\
A^{3}&=XDX^{-1}XDX^{-1}XDX^{-1}=XD^{3}X^{-1},\\
&\vdots
\end{align*}$$
Pertanto fissato un polinomio $p(\lambda)=a_{0}+a_{1}\lambda+a_{2}\lambda^{2}+\dots+a_{m}\lambda^{m}$, si ha $$p(A)=a_{0}I+a_{1}A+a_{2}A^{2}+\dots+a_{m}A^{m}=X(a_{0}I+a_{1}D+a_{m}D^{m})X^{-1}=Xp(D)X^{-1},$$ dove $$p(D)=a_{0}I+a_{1}D+a_{2}D^{2}+\dots+a_{m}D^{m}=
\begin{bmatrix}p(\lambda_{1}) &   &   &  \\  & p(\lambda_{2}) &   &  \\  &   & \ddots &  \\   &   &   & p(\lambda_{n})\end{bmatrix}$$
In conclusione la forumal $p(A)=Xp(D)X^{-1}$ ci sta dicendo che $p(A)$ è diagonalizzabile con autovalori $p(\lambda_{1}),p(\lambda_{2}),\dots,p(\lambda_{n})$ (e con corrispondenti autovettori dati dalle colonne di $X$).