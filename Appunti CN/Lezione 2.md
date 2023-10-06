# Sempre su Interpolazione Polinomiale

**Dim. 2**
$\forall j=0,\dots,n$ definiamo il polinomio $$L_j(x)=\prod_{k=0, k\neq j}^{n} \frac{x-x_{k}}{x_{j}-x_{k}}=\frac{(x-x_0)\dots(x-x_{j-1})(x-x_{j+1})\dots(x-x_{n})}{(x_{j}-x_0)\dots(x_{j}-x_{j-1})(x_{j}-x_{j+1})\dots(x_{j}-x_{n})}$$
gli $n+1$ polinomi $L_{0}(x),\: L_{1}(x),\dots,\: L_{n}(x)$ hanno grado $n$ e appartengono a $\mathbb R_n[x]$.

Mostriamo che $L_{0}(x),\: L_{1}(x),\dots,\: L_{n}(x)$ sono una base di $\mathbb R_n[x]$.

Siccome questi polinomi sono in numero di $n+1=\text{dim } \mathbb R_n[x]$, per dimostrare che sono una base, basta dimostrare che sono *linearmente dipendenti.

>**Oss.**
>- Il fatto che $\text{dim }\mathbb R_n[x]=n+1$ vale perché sappiamo che una base di $\mathbb R_n[x]$ è la base canonica $1,\:x,\:x^2,\dots,\:x^n$ che ha precisamente $n+1$ elementi
>- Ricordiamo che una base di uno spazio vettoriale è un insieme di elementi linearmente indipendenti che generano lo spazio
>- Tutte le basi di uno spazio vettoriale hanno lo stesso numero di elementi che è detto dimensione dello spazio

Per dimostrare che $L_{0}(x),\: L_{1}(x),\dots,\: L_{n}(x)$, sono linearmente indipendenti, mettiamo in luce una proprietà: $\forall\:i,\:j=0,\dots,\:n$  $$(\triangle)\:\: L_j(x_i)=\begin{cases} 1 & \text{se }i=j \\ 0 & \text{se } i\neq j
\end{cases}$$
ora dobbiamo mostrare che se $\alpha_0L_0(x)+\alpha_1L_1(x)+\dots+\alpha_nL_n(x)$ è il polinomio *identicamente nullo*, allora $\alpha_0=\alpha_1=\dots=\alpha_n=0$ .
Sia dunque $\alpha_0L_0(x)+\alpha_1L_1(x)+\dots+\alpha_nL_n(x)=0$ identicamente $\forall\:x \in \mathbb R$.
Di conseguenza $\forall \:i=0,\dots,\:n$ dovrò avere $$\alpha_0L_0(x_i)+\alpha_1L_1(x_i)+\dots+\alpha_nL_n(x_i)=0$$
allora $\alpha_0=\alpha_1=\dots=\alpha_n=0\implies L_{0}(x),L_{1}(x),\dots,L_{n}(x)$ sono linearmente indipendenti e dunque sono base di $\mathbb R_n[x]$. 
Definiamo $$p(x)=y_0L_0(x)x+y_1L_1(x)+\dots+y_nL_n(x)\in \mathbb R_n[x]$$
Verifichiamo che $p(x_i)=y_{i} \: \forall \: i =0,\dots,n$ $$p(x_{i})=y_0L_0(x_i)+y_1L_1(x_{i})+\dots+y_nL_n(x_{i})=y_{i}$$Questo dimostra l'esistenza di un polinomio $p(x)$ che soddisfa le tesi del teorema. 

Dimostriamo ora l'unicità. Supponiamo che $q(x)$ sia un altro polinomio in $\mathbb R_n[x]$ t.c. $q(x_i)=y_{i}\:\forall \: i=0,\dots,n$ , poiché $L_{0}(x),\: L_{1}(x),\dots,\: L_{n}(x)$ sono una base di $\mathbb R_n[x]$, possiamo scrivere $$q(x)=\beta_0L_0(x)+\beta_1L_1(x)+\dots+\beta_nL_n(x)$$
per certi $\beta_0,\beta_1,\dots,\beta_n\in\mathbb R$. Valutando $q(x)$ nei punti $x_0,x_1,\dots,x_n$ otteniamo che $\forall\:i=0,\dots,n$ $$q(x_i)=\beta_0L_0(x_i)+\beta_1L_1(x_i)+\dots+\beta_nL_n(x_i)=\beta_i$$
ma $q(x_i)=y_i$ per $(\triangle)$, quindi possiamo scrivere $$q(x)=y_0L_0(x)+y_1L_1(x)+\dots+y_nL_n(x)=p(x)$$Questo dimostra che $p(x)$ è l'unico polinomio in $\mathbb R_n[x]$ t.c. $p(x_i)=y_{i}\:\: \forall\: i=0,\dots,n$. $\square$

**Def.**
Siano $(x_0,y_0),(x_1,y_1),\dots,(x_n,y_n)\in\mathbb R^2$  con $x_0,x_1,\dots,x_n$ distinti. L'unico polinomio $p(x)\in \mathbb R_n[x]$ t.c. $p(x_i)=y_{i}\:\forall i=0,\dots,n$ si chiama **polinomio di interploazione** dei dati  $(x_0,y_0),(x_1,y_1),\dots,(x_n,y_n)$ o anche **polinomio di interpolazione** dei valori $y_0,\dots,y_n$ sui nodi $x_0,\dots,x_n$.

- La prima dimostrazione del teorema ci dice che $p(x)$ si scrive in forma canonica come $$p(x)=a_0+a_1x+\dots+a_nx^n$$ dove $$\begin{pmatrix} a_0\\ a_1 \\ \vdots \\ a_n \end{pmatrix} = \left[V\left(x_{0},x_{1},\dots,x_{n}\right)\right]^{-1} \begin{pmatrix}y_{0} \\ y_1 \\ \vdots \\ y_n\end{pmatrix}$$e $V(x_0,x_1,\dots,x_n)$ è la matrice di Vandermonde sui nodi $x_0,x_1,\dots,x_n$.
- La seconda dimostrazione ci dice che $$p(x)=y_0L_0(x)x+y_1L_1(x)+\dots+y_nL_{n}(x) \:\: (\$\$)$$dove $\forall \:j=0,\dots,n$ $$L_j(x)=\prod_{k=0, k\neq j}^{n} \frac{x-x_{k}}{x_{j}-x_{k}}=\frac{(x-x_0)\dots(x-x_{j-1})(x-x_{j+1})\dots(x-x_{n})}{(x_{j}-x_0)\dots(x_{j}-x_{j-1})(x_{j}-x_{j+1})\dots(x_{j}-x_{n})}$$
si chiama **j-esimo polinomio di Lagrange** relativo ai nodi $x_0,x_{1},\dots,x_n$. 

La $(\$\$)$ si chiama *forma di Lagrange* del polinomio di interpolazione 
- Se gli $y_{i}$ sono i valori nei punti $x_{i}$ di una funzione $f:[a,b] \to \mathbb R$, cioé se risulta $y_i=f(x_{i}) \:\forall \:i=0,\dots,n$, allora il polinomio $p(x)$ si chiama anche **polinomio di interpolazione della funzione $f(x)$** sui nodi $x_0,\dots,x_n$.

## Esempio
Della funzione $\sin(x)$ sono noti i valori nei tre punti $x_0=0,\:x_1=\frac{\pi}{6},\:x_2=\frac{\pi}{4}$ e sono dati da $\sin(x_0)=0,\:\sin(x_1)=\frac{1}{2},\: \sin(x_2)=\frac{\sqrt{2}}{2}$.
Scrivere in forma canonica e in forma di Lagrange il polinomio di interpolazione $p(x)$ di $\sin(x)$ sui nodi $x_0,\:x_1,\:x_2$.

**Soluzione**
Iniziamo dalla forma di Lagrange $$p(x)=\sin(x_0)L_0(x)+\sin(x_1)L_1(x)+\sin(x_2)L_2(x)=$$
$$=\cancel{\sin(x_0)\frac{(x-x_1)(x-x_2)}{(x_0-x_1)(x_0-x_2)}}+\sin(x_1)\frac{(x-x_0)(x-x_2)}{(x_1-x_0)(x_1-x_2)}+\sin(x_2)\frac{(x-x_0)(x-x_1)}{(x_2-x_0)(x_2-x_1)}=$$
$$=\frac{1}{2}\frac{x(x-\frac{\pi}{4})}{\frac{\pi}{6}\cdot(-\frac{\pi}{12})}+ \frac{\sqrt2}{2}\frac{x(x- \frac{\pi}{6})}{\frac{\pi}{4}\cdot \frac{\pi}{12}}=$$
$$=\frac{1}{2}\frac{x(x-\frac{\pi}{4})}{- \frac{\pi^{2}}{72}} + \frac{\sqrt2}{2}\frac{x(x- \frac{\pi}{6})}{\frac{\pi^{2}}{48}}$$
Sviluppando i calcoli e raccogliendo i termini della $x$ e della $x^2$, portiamo il polinomio in forma canonica:$$p(x)=\left(\frac{9}{\pi}- \frac{4\sqrt2}{\pi}\right)x+\left(- \frac{36}{\pi^{2}}+ \frac{24\sqrt2}{\pi^{2}}\right)x^{2} \:\: (\texteuro)$$
*Oss.*
Dall'espressione della forma canonica di $p(x)$ avevamo che $p(x)=a_0+a_1x+a_2x^2$ con $$\begin{pmatrix} a_0\\ a_1 \\ a_{2} \end{pmatrix} = \left[V\left(0, \frac{\pi}{6},\frac{\pi}{12}\right)\right]^{-1} \begin{pmatrix} 0\\ \frac{1}{2} \\ \frac{\sqrt2}{2} \end{pmatrix}$$
Dunque per confronto con $(\texteuro)$ concludiamo senza risolvere il sistema lineare di Vandermonde che $$\left[V\left(0, \frac{\pi}{6},\frac{\pi}{12}\right)\right]^{-1}\begin{pmatrix} 0\\ \frac{1}{2} \\ \frac{\sqrt2}{2} \end{pmatrix}=\begin{pmatrix}0  \\ \frac{9}{\pi}- \frac{4\sqrt2}{\pi} \\ - \frac{36}{\pi^{2}}+ \frac{24\sqrt2}{\pi^{2}}\end{pmatrix}$$
