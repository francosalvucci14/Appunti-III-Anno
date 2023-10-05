# Interpolazione Polinomiale

**Problema** : è data una funzione $f:[a,b]\to\mathbb R$ di cui sono noti i valori $f(x_0),f(x_1),...,f(x_n)$ in n+1 punti distinti $x_0,x_1,...,x_n\in[a,b]$

Si sceglie una classe $C$ di funzioni da $[a,b]\to\mathbb R$ e si vuole approsimmare $f(x)$ con una funzione $g(x)$ nella classe $C$ t.c $g(x_i)=f(x_i),\forall i=0,...,n$

Una scelta comune, per la sua semplicità, è $C=\mathbb R_n[x]=\text{ spazio dei polinomi di grado}\leq n=\{a_0+a_1x+...+a_nx^n|a_0,a_1,...,a_n\in\mathbb R\}$

Con questa scelta di $C$ si ha che :
$$\exists!p(x)\in C:p(x_i)=f(x_i),\forall i=0,..,n$$

>[!definition]- Teorema
>Siano $(x_0,y_0),(x_1,y_1),...,(x_n,y_n)\in\mathbb R^2$ t.c $x_0,x_1,...,x_n$ sono tutti distinti
>Allora $$\exists!p(x)\in\mathbb R|p(x_i)=y_i,\forall i=0,...,n$$

**Dimostrazione istruttiva 1**

Un polinomio $p(x)=a_0+a_1x+...+a_nx^n\in\mathbb R_n[x]$ soddisfa la proprietà $p(x_i)=y_{i,\forall}i=0,...,n$ se e solo se
$$\begin{cases}a_0+a_1x_0+a_2x_0^2+...+a_nx_0^n=y_0\\a_0+a_1x_1+a_2x_1^2+...+a_nx_1^n=y_1\\a_0+a_1x_2+a_2x_2^2+...+a_nx^n_2=y_2\\.\\.\\.\\a_0+a_1x_n+a_2x_n^2+...+a_nx_n^n=y_n\end{cases}$$
cioè se e solo se, il vettore dei coefficienti di $p(x)$, ossia $(a_0,a_1,...,a_n)^T$ soddisfa il sistema lineare
$$\begin{pmatrix}
1 & x_0 & x_0^2 & ... & x_0^n \\
1 & x_1 & x_1^2 & ... & x_1^n \\
1 & x_2 & x_2^2 & ... & x_2^n \\
: & : & : & : & : \\
1 & x_n & x_n^2 & ... & x_n^n
\end{pmatrix}\begin{pmatrix}
a_0 \\
a_1 \\
a_2 \\
: \\
a_n
\end{pmatrix}=\begin{pmatrix}
y_0 \\
y_1 \\
y_2 \\
: \\
y_n
\end{pmatrix}(*)$$
Dove la matrice si dice **Matrice di Vandermonde** sui nodi $x_0,x_1,...,x_n$ e si indica con $V(x_0,x_1,...,x_n)$ 

Per dimostrare che $\exists!p(x)\in\mathbb R|p(x_i)=y_i,\forall i=0,...,n$ basta dimostrare che $(*)$ ha un unica soluzione.

In tal caso, l'unica soluzione di $(*)$ sarà il vettore dei coefficienti dell'unico polinomio $p(x)\in\mathbb R_n[x]:p(x_i)=y_i$

DImostriamo dunque che $(*)$ ha un'unica soluzione, cioè che 
$$det[V(x_0,x_1,..,x_n)]\neq0$$
Per farlo, mostriamo che 
$$(**)\space det[V(x_0,x_1,..,x_n)]=\begin{cases}1&n=0\\(X)&n\geq1\end{cases}$$

Con $(X)$ che è uguale a 
$$\begin{align}\prod_{i,j=0}^{n}(x_i-x_j)=&(x_1-x_0)(x_2-x_1)(x_2-x_0)(x_3-x_0)\\&(x_3-x_1)(x_3-x_2)...(x_n-x_0)(x_n-x_1)\\&...(x_n-x_{n-1})\end{align}$$

Dimostriamo $(**)$ per $n=3$ (la dimostrazione per n generico è analoga)

Per $i=1,..,3$ definiamo:
$$d_i=det[V(x_0,...,x_i)]$$
Il nostro obiettivo è calcolare 
$$d_3=det[V(x_0,...,x_3)]$$

Quindi otteniamo che $d_3$ è quindi:

$$d_{3}= \begin{vmatrix}
1 & x_0 & x_{0}^2 & x_{0}^3 \\
1 & x_1 & x_{1}^2 & x_{1}^3 \\
1 & x_2 & x_{2}^2 & x_{2}^3 \\
1 & x_3 & x_{3}^2 & x_{3}^3 
\end{vmatrix} $$

Effettuiamo la riduzione di Gauss sulle colonne, partendo dall'ultima e sottraendo la colonna precedente moltiplicata per $x_{3}$, ovvero $C_{n}\to C_{n}-x_{3}\cdot C_{n-1}$, fino ad annullare i termini delle incognite nell'ultima riga. La matrice risulterà $$\begin{vmatrix}
1 & x_0-x_3 & x_{0}(x_0-x_3) & x_{0}^2(x_0-x_3) \\
1 & x_1-x_3 & x_{1}(x_1-x_3) & x_{1}^2(x_1-x_3) \\
1 & x_2-x_3 & x_{2}(x_2-x_3) & x_{2}^2(x_2-x_3) \\
1 & 0 & 0 & 0 
\end{vmatrix} $$

Calcoliamo il determinante grazie allo **sviluppo di Laplace**, fissando l'ultima riga che in seguito viene eliminata. Il calcolo del determinante risulterà quindi: $$d_{3}= (-1)^{3} \cdot\begin{vmatrix}
x_0-x_3 & x_{0}(x_0-x_3) & x_{0}^2(x_0-x_3) \\
x_1-x_3 & x_{1}(x_1-x_3) & x_{1}^2(x_1-x_3) \\
x_2-x_3 & x_{2}(x_2-x_3) & x_{2}^2(x_2-x_3) \\
\end{vmatrix} $$
Osserviamo che la prima riga (analogamente per la seconda e la terza) hanno in comune il fattore $(x_{0}-x_{3})$, che possiamo quindi portare fuori dal determinante. $$d_{3}= (-1)^{3} \cdot(x_{0}-x_{3})\cdot(x_{1}-x_{3})\cdot(x_{2}-x_{3})\begin{vmatrix}
1 & x_{0} & x_{0}^2 \\
1 & x_{1} & x_{1}^2 \\
1 & x_{2} & x_{2}^2 \\
\end{vmatrix} $$
Moltiplico il $(-1)^3$ per i termini portati fuori e quindi inverto di segno (si osservi che il determinante a destra è per definizione $d_{2}$)
$$d_{3}= (x_{3}-x_{0})\cdot(x_{3}-x_{1})\cdot(x_{3}-x_{2})\cdot d_2$$
Sviluppando quindi come già fatto per $d_{3}$ (per ricorrenza) ottengo $$d_{3}= (x_{3}-x_{0})\cdot(x_{3}-x_{1})\cdot(x_{3}-x_{2})\cdot(x_{2}-x_{0})\cdot(x_{2}-x_{1})\cdot d_{1}=$$
$$=(x_{3}-x_{0})\cdot(x_{3}-x_{1})\cdot(x_{3}-x_{2})\cdot(x_{2}-x_{0})\cdot(x_{2}-x_{1})\cdot(x_{1}-x_{0})$$
che risulta uguale allo sviluppo della produttoria $(X)$ per $n=3$. $\square$


