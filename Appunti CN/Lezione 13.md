# Norme matriciali
## Il concetto di norma matriciale

Si vuole introdurre un concetto di distanza sullo spazio delle matrici per misurare la "vicinanza" di due matrici $A,B\in\mathbb C^{n\times n}$. A questo scopo si può interpretare una matrice $A\in\mathbb C^{n\times n}$ come un vettore di $n^2$ componenti e utilizzare come distanza una delle [[#Norme vettoriali|norme vettoriali]] già introdotte. Questo procedimento è senz'altro corretto, ma spesso conduce a norme che "non si comportano bene" rispetto al prodotto di matrici e pertanto sono di scarso interesse. Diamo comunque qui la definizione generale di norma matriciale e ci
riserviamo di trattare le norme matriciali interessanti nella sezione successiva.

**Def.**
Una funzione $||\cdot||:\mathbb{C}^{n\times n}\to\mathbb R$ si dice norma matriciale se soddisfa le seguenti proprietà:
- $||A||\ge0$ per ogni $A\in\mathbb{C}^{n\times n}$ e $||A||=0$ se e solo se $A=0\text{ [ positività ]}$ 
- $||\alpha A||=|\alpha|\:||A||$ per ogni $\alpha\in\mathbb{C}$ e ogni $A\in\mathbb C^{n\times n}\text{ [ omogeneità ]}$
- $||A+B||\le||A||+||B||$ per ogni $A,B\in\mathbb C^{n\times n}\text{ [ disuguaglianza triangolare ]}$  
Data una norma vettoriale $||\cdot||:\mathbb{C}^{n\times n}\to\mathbb R$, definiamo la distanza fra due matrici $A,B\in\mathbb C^{n\times n}$ come $||A-B||$.

Un esempio di norma matriciale è dato dall'analoga della norma $\infty$ tra vettori: data $A \in \mathbb C^{n\times n}$, s'immagina $A$ come se fosse un vettore di $n^{2}$ componenti e si definisce la sua norma come se fosse la norma $\infty$ del vettore di $n^{2}$ componenti:$$|A|_{\infty}=\max_{i,j=1,\dots,n}|a_{ij}|$$
In modo analogo si possono definire le norme $|A|_{1}$ e $|A|_{2}$. Purtroppo, la norma $|\cdot|_{\infty}$ "non si comporta bene" rispetto al prodotto di matrici perché non è submoltiplicativa: date due matrici $A,B \in \mathbb C^{n\times n}$, non è detto che risulti $|AB|_{\infty}\le|A|_{\infty}|B|_{\infty}$. Ecco un esempio: $$\begin{align*}
&A=\begin{bmatrix}1 & 1\\
0 & 1\end{bmatrix}, \:\:\:\:\: |A|_{\infty}=1\\
&B=\begin{bmatrix}1 & 0\\
1 & 1\end{bmatrix}, \:\:\:\:\: |B|_{\infty}=1 \\
&AB=\begin{bmatrix}2 & 1\\
1 & 1\end{bmatrix},\:\:\:\:\: |AB|_\infty=2
\end{align*}$$
## Norme matriciali indotte

Vogliamo introdurre una classe di norme matriciali interessanti e ricavarne alcune proprietà.

**Def.**
Data una norma vettoriale $||\cdot||$ in $\mathbb C^{n}$ e una matrice $A \in \mathbb C^{n\times n}$, definiamo il numero $$||A||=\max_{\underline{x}\ne\underline{0}} \frac{||A\underline{x}||}{||\underline{x}||}= \max_{\underline{x}\ne\underline{0}}\bigg|\bigg|A\left(\frac{\underline{x}}{||\underline{x}||}\right)\bigg|\bigg|=\max_{||\underline y||=1}||A\underline y|| $$ Si può dimostrare che $||\cdot||:\mathbb{C}^{n\times n}\to\mathbb R$ è una norma matriciale che prende il nome di norma matriciale indotta dalla norma vettoriale $||\cdot||$. 
Si osservi che la norma matriciale indotta dalla norma vettoriale $||\cdot||$ viene volutamente denotata con lo stesso simbolo $||\cdot||$. Il seguente teorema mette in luce interessanti proprietà delle norme matriciali indotte.

### Teorema

Sia $||\cdot||:\mathbb{C}^{n\times n}\to\mathbb R$ una norma matriciale indotta dalla norma vettoriale $||\cdot||$ e siano $A,B\in\mathbb C^{n\times n}$. Allora valgono le seguenti proprietà.
1. $||I||=1$
2. $||A\underline x|| \le ||A||\:||\underline x||$ per ogni $\underline x \in\mathbb C^n$ 
3. $||A||$ è la più piccola costante $C$ che soddisfa $||A\underline x||\le C||\underline x||$ per ogni $\underline x\in\mathbb C^n$ 
4. $||AB||\le ||A||\: ||B||\:\:\:\:\: \text{[ submoltiplicatività ]}$
5. $\rho(A)\le||A||$

**Dim.**
1. Risulta $$||I||=\max_{||\underline x||=1} ||I\underline x||=\max_{||\underline x||=1}||\underline x||=1$$
2. Per ogni $\underline{x}\ne\underline{0}$ si ha $$\frac{||A\underline{x}||}{||\underline{x}||}\le\max_{\underline{y}\ne\underline{0}}\frac{||A\underline{y}||}{||\underline{y}||}=||A||\implies||A\underline{x}||\le||A||\:||\underline{x}||$$ La disuguaglianza precedente vale ovviamente anche per $\underline x=\underline 0$.
3. Presa una qualsiasi costante $C$ che soddisfa $||A\underline x||\le C||\underline x||$ per ogni $\underline x\in\mathbb C^n$, si ha $$\frac{||A\underline{x}||}{||\underline{x}||}\le C \text{ per ogni }\underline x\ne \underline 0\implies ||A||=\max_{\underline x=\underline 0}\frac{||A\underline{x}||}{||\underline{x}||}\le C$$
4. Per ogni $\underline x\in\mathbb C^{n}$ si ha $$||AB\underline x||\le ||A||\:||B\underline x||\le||A||\:||B||\:||\underline x||$$ Concludiamo che $||AB||\le||A||\:||B||$ in quanto $||AB||$ è la più piccola costante $C$ che soddisfa $||AB\underline x||\le C||\underline x||$ per ogni $\underline x\in \mathbb C^n$.
5. Sia $\lambda$ un autovalore di $A$ di modulo massimo e sia $\underline x\ne\underline 0$ un corrispondente autovettore. Dall'equazione $A\underline x=\lambda\underline x$ otteniamo $$||A\underline x||=||\lambda\underline x||=|\lambda|\:||\underline x||=\rho(A)||\underline x||\implies \rho(A)=\frac{||A\underline{x}||}{||\underline{x}||}\le\max_{\underline y\ne\underline 0}\frac{||A\underline{y}||}{||\underline{y}||}=||A||.\:\:\: \square $$
## Le norme 1, 2, $\infty$

Le norme matriciali più importanti per i nostri scopi sono tre: la norma 1, la norma 2 (o euclidea) e la norma $\infty$. Esse sono semplicemente le norme matriciali indotte dalle norme vettoriali 1, 2 e $\infty$: $$\begin{align*}
||A||_{1}=\max_{\underline x\ne \underline 0}\frac{||A\underline{x}||_{1}}{||\underline{x}||_{1}}=\max_{||\underline x||_{1}=1}||A\underline x||_{1}\\
||A||_{2}=\max_{\underline x\ne \underline 0}\frac{||A\underline{x}||_{2}}{||\underline{x}||_{2}}=\max_{||\underline x||_{2}=1}||A\underline x||_{2}\\
||A||_{\infty}=\max_{\underline x\ne \underline 0}\frac{||A\underline{x}||_{\infty}}{||\underline{x}||_{\infty}}=\max_{||\underline x||_{\infty}=1}||A\underline x||_{\infty}
\end{align*}$$ Il seguente teorema fornisce delle formule per calcolare le norme $1, 2, \infty$ delle matrici. In ciò che segue, se $A \in \mathbb C^{n\times n}$, denotiamo con $A_{[1]},A_{[2]},\dots,A_{[n]}$ le righe di $A$ e con $A^{[1]},A^{[2]},\dots,A^{[n]}$ le colonne di $A$.

### Teorema

Per ogni $A \in \mathbb C^{n\times n}$ valgono le seguenti formule: 
- $||A||_{1}=\max_{j=1,\dots,n}\sum\limits_{i=1}^{n}|a_{ij}|=\max(||A^{[1]}||_{1},||A^{[2]}||_{1},\dots,||A^{[n]}||_{1})$
- $||A||_{2}=\sqrt{\rho(A^{\star}A)}$
- $||A||_{\infty}=\max_{i=1,\dots,n}\sum\limits_{j=1}^{n}|a_{ij}|=\max(||A_{[1]}||_{1},||A_{[2]}||_{1},\dots,||A_{[n]}||_{1})$
## Equivalenza delle norme matriciali

Vale per le norme matriciali un teorema di equivalenza identico a quello per le norme vettoriali.

### Teorema
Tutte le norme matriciali in $\mathbb C^{n\times n}$ sono equivalenti, nel senso che se prendiamo due norme matriciali $||\cdot||',||\cdot||'':\mathbb C^{n\times n}\to \mathbb R$ allora si ha: $$\alpha||A||''\le||A||'\le \beta||A||'' \:\:\:\text{ per ogni }A \in \mathbb C^{n\times n} $$ dove $\alpha, \beta>0$ sono due costanti indipendenti da $A$.
## Successioni di matrici

Una successione di matrici $A^{(0)},A^{(1)},A^{(2)},\dots$ in $\mathbb C^{n\times n}$ si dice convergente alla matrice $A\in\mathbb C^{n\times n}$ rispetto alla norma matriciale $||\cdot||$ se $||A^{(k)}-A||\to0$. Poiché tutte le norme matriciali sono equivalenti per il [[#Equivalenza delle norme matriciali#Teorema|teorema]], se una successione di matrici converge ad $A$ rispetot a una norma $||\cdot||$, allora converge ad $A$ rispetto a tutte le norme.
La dimostrazione è identica a quella fatta per i [[#Successioni di vettori|vettori]], quindi è omessa.

Una successione di matrici $A^{(0)},A^{(1)},A^{(2)},\dots$ in $\mathbb C^{n\times n}$ si dice convergente (componente per componente) alla matrice $A\in \mathbb C^{n\times n}$ se $A^{(k)}\to A$ componente per componente, cioé se $$\begin{align*}
a_{ij}^{(k)}\to a_{ij}\text{ per ogni }i,j=1,\dots,n &\iff |a_{ij}^{(k)}-a_{ij}|\to0\text{ per ogni }i,j=1,\dots,n\\
&\iff \max_{i,j=1,\dots,n}|a_{ij}^{(k)}-a_{ij}|\to0\\
&\iff |A^{(k)}-A|_\infty\to0 
\end{align*}$$ Vediamo quindi che la convergenza componente per componente altro non è che la convergenza in $|\cdot|_{\infty}$. 
Pertanto, ricordando l'equivalenza di tutte le norme, dire che $A^{(k)}\to A$ componente per componente è lo stesso che dire che $A^{(k)}\to A$ in una qualsiasi norma.
Il prossimo teorema è **fondamentale** per i nostri scopi. Esso ci dice quando la successione delle potenze di una fissata matrice $A$ tende alla matrice nulla.

### Teorema

Sia $A\in \mathbb C^{n\times n}$. Allora $$\lim_{k\to\infty}A^{k}=O\iff \rho(A)<1$$
**Dim.**
Facciamo la dimostrazione soltanto nel caso in cui la matrice $A$ è diagonalizzabile. In tal caso, esistono una matrice invertibile $X$ e una matrice diagonale $D = diag(\lambda_1,\dots,\lambda_n)$ (avente sulla diagonale gli autovalori di A) tali che $$\begin{align*}
A&=XDX^{-1},\\
A^{2}&=XDX^{-1}XDX^{-1}=XD^{2}X^{-1},\\
A^{3}&=XDX^{-1}XDX^{-1}XDX^{-1}=XD^{3}X^{-1}\\
\vdots\\
A^{k}&=XD^{k}X^{-1}
\end{align*}$$
$(\impliedby)$ Se $\rho(A)<1$ allora dall'equazione $A^{k}=XD^{k}X^{-1}$ e dalla proprietà di submoltiplicatività (proprietà 4 del [[#Norme matriciali indotte#Teorema|teorema]]) applicata alla norma $||\cdot||_{\infty}$ si ottiene $$||A^{k}||_{\infty}=||XD^{k}X^{-1}||_{\infty}\le||X||_{\infty}||D^{k}||_{\infty}||X^{-1}||_{\infty}=||X||_{\infty}\rho(A)^{k}||X^{-1}||_{\infty}\to0$$ per cui $||A^{k}||_{\infty}\to 0$ e $A^k\to O$.
$(\implies)$ Viceversa, se $A^{k}\to O$ allora dall'equazione $A^{k}=XD^{k}X^{-1}$ si ottiene $D^{k}=X^{-1}A^{k}X$ $$\rho(A)^{k}=||D^{k}||_{\infty}=||X^{-1}A^{k}X||_{\infty}\le||X^{-1}||_{\infty}||A^{k}||_{\infty}||X||_{\infty}\to 0$$ per cui $\rho(A)^{k}\to0$ cioè $\rho(A)<1$. $\square$