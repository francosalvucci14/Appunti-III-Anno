# Matrici a diagonale dominante e a diag. dom. in senso stretto

Sia $A\in\mathbb C^{n\times n}$ una matrice: 
- Si dice che $A$ è a diagonale dominante (per righe) se: 
	- $a_{ii}\ge\sum\limits_{j\ne i}|a_{ij}|$ per ogni $i=1,\dots,n$
	- esiste almeno un indice $k\in\{1,\dots,n\}$ per il quale vale la disuguaglianza stretta $a_{kk}>\sum\limits_{j\ne k}|a_{kj}|$.
- Si dice che $A$ è diagonale dominante in senso stretto (per righe) se $a_{ii}>\sum\limits_{j\ne i}|a_{ij}|$ per ogni $i=1,\dots,n$
- Si dice che $A$ è a diagonale dominante per colonne se:
	- $a_{jj}\ge\sum\limits_{i\ne j}|a_{ij}|$ per ogni $j=1,\dots,n$
	- esiste almeno un indice $\ell\in\{1,\dots,n\}$ per il quale vale la disuguaglianza stretta $|a_{\ell\ell}>\sum\limits_{i\ne\ell}|a_{i\ell}|$ 
- Si dice che A è a diagonale dominante in senso stretto per colonne se $|a_{jj}|>\sum\limits_{i\ne j}|a_{ij}|$ per ogni $i=1,\dots,n$. 
Analogamente a quanto avviene per i cerchi di Gershgorin, quando si parla di dominanza diagonale senza altre specificazioni, si intende per righe. Quando si vuole parlare di dominanza diagonale per colonne, questo va specificato ogni volta.

## Esempio
Discutere le proprietà di dominanza diagonale per righe e per colonne della matrice $$A=\begin{bmatrix}3 & 1 & -2 \\ 0 & -3 & 1 \\ 1-2i & -1 & 5\end{bmatrix}$$
**Soluzione**
Poiché $$\begin{align*}
|3|&=|1|+|-2|&\iff\:\:\:\: &3=3\\
|-3|&>|0|+|1|&\iff \:\:\:\:&3>1\\
|5|&>|1-2i|+|5| &\iff \:\:\:\:&5>\sqrt{5}+1
\end{align*}$$ si conclude che $A$ è a diagonale dominante (per righe) ma non a diagonale dominante in senso stretto (per righe). 
Poiché $$\begin{align*}
|3|&>|0|+|1-2i|&\iff\:\:\:\: &3>\sqrt{5}\\
|-3|&>|1|+|-1|&\iff \:\:\:\:&3>2\\
|5|&>|-2|+|1| &\iff \:\:\:\:&5>3
\end{align*}$$ si conclude che $A$ è a diagonale dominante in senso stretto per colonne.

## Teorema
Supponiamo che la matrice $A\in\mathbb C^{n\times n}$ soddisfi *almeno una* delle seguenti condizioni:
- $A$ è a diagonale dominante e irriducibile;
- $A$ è a diagonale dominante in senso stretto;
- $A$ è a diagonale dominante per colonne e irriducibile;
- $A$ è a diagonale dominante in senso stretto per colonne;
Allora $A$ è invertibile.


**Dim.**
La dimostrazione si basa sui teoremi di Gershgorin. Dimostriamo il teorema sotto l'ipotesi che $A$ sia diagonale dominante e irriducibile. Mostriamo che $0$ non è un autovalore di $A$ usando il [[#Terzo teorema di Gershgorin|terzo teorema di Gershgorin]]. Poiché $A$ è a diagonale dominante, se $0$ appartiene a un cerchio di Gershgorin $K_{i}$ allora deve stare per forza sul bordo di $K_{i}$. Infatti non può stare all'interno, perché per ipotesi di dominanza diagonale si ha $$\text{raggio di }K_{i} =\sum\limits_{j\ne i}|a_{ij}|\le|a_{ii}|=|a_{ii}|=\text{distanza}(a_{ii},0)=\text{distanza}(\text{centro di }K_{i},0)$$ Dunque $0$ sta per forza sul bordo di quei cerchi di Gershgorin a cui esso appartiene. Inoltre, sempre per l'ipotesi di dominanza diagonale, esiste un indice $k$ tale che $$|a_{kk}|>\sum\limits_{j\ne k}|a_{kj}|$$ Questo significa che $0$ non sta sul bordo di $K_{k}$ e dunque $0$ non sta sul bordo di tutti i cerchi di Gershgorin di $A$. Poiché $A$ è irriducibile per ipotesi, il terzo teorema di Gershgorin ci dice che $0$ non può essere un autovalore di $A$ e quindi $A$ è invertibile. $\square$

**Oss.**
Nella dimostrazione del [[#Matrici a diagonale dominante e a diag. dom. in senso stretto#Teorema|teorema]] abbiamo dovuto usare la versione forte del terzo teorema di Gershgorin perché quella [[#Terzo teorema di Gershgorin debole|debole]] non basta. Infatti la matrice $$A=\begin{bmatrix}1 & 1 & 0 & 0 & 0 \\ 0 & i & 1 & 0 & 0 \\  0 & 0 & -1 & 1 & 0 \\ 0 & 0 & 0 & -i & 1 \\ 1/4 & 0 & 0 & 0 & 1\end{bmatrix}$$ è a diagonale dominante e irriducibile e ha i cerchi di Gershgorin sia per righe che per colonne mostrati sotto in figura, per cui non riusciremmo a dimostrare che é invertibile (cioé che $0$ non è un autovalore) usando la sola versione debole del terzo teorema di Gershgorin. 

![[CN/img/img4.png|center|350]]


# Norme vettoriali 
## Il concetto di norma vettoriale
Consideriamo il sistema lineare $$\begin{bmatrix}8 & 1 & 1 \\ 1 & 5 & -1 \\ 1 & -1 & 5\end{bmatrix}\begin{bmatrix}x_{1} \\ x_{2} \\ x_{3}\end{bmatrix}=\begin{bmatrix}26 \\ 7 \\ 7 \end{bmatrix}$$ la cui soluzione è $\underline{x}=[3,1,1]^{T}$. Si supponga di aver ottenuto le seguenti approssimazioni della soluzione: $$\begin{align*}
\underline{y}=[2.99972,1.00023,1.00030]^{T}\\
\underline{z}=[3.00027,0.99971,0.99955]^{T}
\end{align*}$$ Come possiamo stabilire quale delle due è più vicina alla soluzione $\underline{x}$? Occorre introdurre un concetto di distanza sullo spazio dei vettori e misurare la distanza di $\underline{y}$ e $\underline{z}$ da $\underline{x}$: la soluzione approssimata che dista di meno è quella più vicina. Un ottimo concetto di distanza in uno spazio di vettori è il concetto di norma vettoriale.

**Def.**
Una funzione $||\cdot||:\mathbb{C}^{n}\to\mathbb R$ si dice norma vettoriale se soddisfa le seguenti proprietà:
- $||\underline{x}||\ge0$ per ogni $\\underline{x}\in\mathbb{C}^{n}$ e $||\underline{x}||=0$ se e solo se $\underline{x}=\underline{0}\text{ [ positività ]}$ 
- $||\alpha\underline{x}||=|\alpha|\:||\underline{x}||$ per ogni $\alpha\in\mathbb{C}$ e ogni $\underline{x}\in\mathbb C^{n}\text{ [ omogeneità ]}$
- $||\underline{x}+\underline{y}||\le||\underline{x}||+||\underline{y}||$ per ogni $\underline{x},\underline{y}\in\mathbb C^{n}\text{ [ disuguaglianza triangolare ]}$  
Data una norma vettoriale $||\cdot||:\mathbb{C}^{n}\to\mathbb R$, definiamo la distanza fra due vettori $\underline{x},\underline{y}\in\mathbb C^{n}$ come $||\underline{x}-\underline{y}||$.

## Le norme 1, 2, $\infty$ 
Le norme più importanti in $\mathbb C^{\infty}$ sono tre: la norma 1, la norma 2 (o euclidea) e la norma $\infty$. Esse sono definite nel modo seguente: $$\begin{align*}
||\underline{x}||_{1}&=|x_{1}|+|x_{2}|+\dots+|x_{n}|\\
||\underline{x}||_{2}&=\sqrt{|x_{1}|^{2}+|x_{2}|^{2}+\dots+|x_{n}|^{2}}\\
||\underline{x}||_{\infty}&=\max(|x_{1}|,|x_{2}|,\dots,|x_{n}|)
\end{align*}$$ Le relative distanze sono definite nel modo seguente: $$\begin{align*}
||\underline{x}||_{1}&=|x_{1}-y_{1}|+|x_{2}-y_{2}|+\dots+|x_{n}-y_{n}|\\
||\underline{x}||_{2}&=\sqrt{|x_{1}-y_{1}|^{2}+|x_{2}-y_{2}|^{2}+\dots+|x_{n}-y_{n}|^{2}}\\
||\underline{x}||_{\infty}&=\max(|x_{1}-y_{1}|,|x_{2}-y_{1}|,\dots,|x_{n}-y_{1}|)
\end{align*}$$ Tornando all'[[#Il concetto di norma vettoriale|esempio introduttivo]], se calcoliamo la distanza dei vettori $\underline{y}$ e $\underline{z}$ dal vettore $\underline{x}=[3,1,1]^{T}$ usando la $||\cdot||_{\infty}$, otteniamo $$\begin{align*}
\underline{x}-\underline{y}=[0.00028,-0.00023,-0.00030]^{T} &\implies ||\underline{x}-\underline{y}||_{\infty}=0.00030\\
\underline{x}-\underline{z}=[-0.00027,0.00029,0.00045]^{T} &\implies ||\underline{x}-\underline{z}||_{\infty}=0.00045\\
\end{align*}$$ Quindi rispetto alla $||\cdot||_{\infty}$ il vettore $\underline{y}$ è più vicino a $\underline{x}$ rispetto a $\underline{z}$.

## Equivalenza delle norme vettoriali
### Teorema
Tutte le norme vettoriali in $\mathbb C^{n}$ sono equivalenti, nel senso che se prendiamo due norme vettoriali $||\cdot||',||\cdot||'':\mathbb C^{n}\to\mathbb R$ allora si ha $$\alpha||\underline{x}||''\le ||\underline{x}||'\le \beta||\underline{x}||''\:\:\: \text{per ogni }\underline{x}\in\mathbb C^{n}\:\:\:\: (\star)$$ dove $\alpha, \beta>0$ sono due costanti indipendenti da $\underline{x}$.

Verifichiamo ad esempio che $||\cdot||_{1}$ e $||\cdot||_{\infty}$ sono equivalenti. Per ogni $\underline{x} \in \mathbb C^{n}$ si ha $$\begin{align*}
&\max(|x_{1}|,\dots,|x_{n}|)\le|x_{1}|+\dots+|x_{n}|\le n\max(|x_{1}|,\dots,|x_{n}|)\\\\

&\implies||\underline{x}||_{\infty}\le ||\underline{x}||_{1}\le n||\underline{x}||_{\infty}\implies \frac{1}{n}||\underline{x}||_{1}\le ||\underline{x}||_{\infty}\le ||\underline{x}||_{1} 
\end{align*}$$
Dunque $||\cdot||_{1}$ e $||\cdot||_{\infty}$ sono equivalenti essendo $(\star)$ soddisfatta per $\alpha=1$ e $\beta=n$ (considerando $||\cdot||'=||\cdot||_{1}$ e $,||\cdot||''=||\cdot||_{\infty}$) oppure con $\alpha= \frac{1}{n}$ e $\beta=1$ (considerando $||\cdot||'=||\cdot||_{\infty}$ e $,||\cdot||''=||\cdot||_{1}$). In ogni caso, quello che conta è che $\alpha$ e $\beta$ sono costanti positive indipendenti da $\underline{x}$. 
Analogamente, possiamo verificare che  $||\cdot||_{2}$ e $||\cdot||_{\infty}$ sono equivalenti: Per ogni $\underline{x} \in \mathbb C^{n}$ si ha $$\begin{align*}
\max(|x_{1}|,\dots,&|x_{n}|)\le \sqrt{|x_{1}|^{2}+..+|x_{n}|^{2}} \le \sqrt{n\max(|x_{1}|,..,|x_{n}|)^{2}}=\sqrt{n}\max(|x_{1}|,..,|x_{n}|) \\\\
&\implies||\underline{x}||_{\infty}\le ||\underline{x}||_{2}\le \sqrt{n}||\underline{x}||_{\infty}\implies \frac{1}{n}||\underline{x}||_{2}\le ||\underline{x}||_{\infty}\le ||\underline{x}||_{2} 
\end{align*}$$
## Successioni di vettori
Una successione di vettori $\underline{x}^{(0)},\underline{x}^{(1)},\underline{x}^{(2)},\dots$ in $\mathbb C^{n}$ si dice convergente al vettore $\underline{x}\in \mathbb C^{n}$ rispetto alla norma vettoriale $||\cdot||$ se $||\underline{x}^{(k)}-\underline{x}||\to0$. Poiché tutte le norme vettoriali sono equivalenti, se una successione vettoriale converge a $\underline{x}$ rispetto una norma $||\cdot||$ allora converge a $\underline{x}$ rispetto a tutte le norme. Infatti, supponiamo che la successione $\{\underline{x}^{(k)}\}_{k=0,1,2,\dots}$ converga a $\underline{x}$ rispetto alla norma $||\cdot||$ e sia $||\cdot||'$ un'altra norma. Poiché $||\cdot||$ e $||\cdot||'$ sono equivalenti, esistono due costanti $\alpha,\beta>0$ tali che $$\alpha||\underline{y}||''\le ||\underline{y}||'\le \beta||\underline{y}||''\:\:\: \text{per ogni }\underline{y}\in\mathbb C^{n}$$ dunque $$\alpha||\underline{x}^{(k)}-\underline{x}||\le||\underline{x}^{(k)}-\underline{x}||'\le \beta||\underline{x}^{(k)}-\underline{x}||\:\:\: \text{per ogni }k=0,1,2,\dots$$ Siccome $||\underline{x}^{(k)}-\underline{x}||\to0$ (perché $\underline{x}^{(k)}\to\underline{x}$ in norma $||\cdot||$) concludiamo che $||\underline{x}^{(k)}-\underline{x}||'\to0$ (cioè $\underline{x}^{(k)}\to\underline{x}$ in norma $||\cdot||'$).

Una successione di vettori $\underline{x}^{(0)},\underline{x}^{(1)},\underline{x}^{(2)},\dots$ in $\mathbb C^{n}$ si dice convergente (componente per componente) al vettore $\underline{x}\in \mathbb C^{n}$ se $\underline{x}^{(k)}\to\underline{x}$ componente per componente, cioè se $$\begin{align*}
\\
\begin{cases}
x_{1}^{(k)}\to x_{1} \\
x_{2}^{(k)}\to x_{2} \\
\vdots \\
x_{n}^{(k)}\to x_{n}
\end{cases}&\iff\begin{cases}
|x_{1}^{(k)}- x_{1}|\to0\\
|x_{2}^{(k)}- x_{2}|\to0\\\\
\vdots\\
|x_{n}^{(k)}- x_{n}|\to0\\
\end{cases}\\\\

&\iff \max(|x_{1}^{(k)}- x_{1}|,|x_{2}^{(k)}- x_{2}|,\dots,|x_{n}^{(k)}- x_{n}|)\to 0\\\\
&\iff ||\underline x^{(k)}-\underline x||_{\infty}\to 0
\end{align*}$$ Vediamo quindi che la convergenza componente per componente altro non è che la convergenza in $||\cdot||_{\infty}$. Pertanto, ricordando l'equivalenza di tutte le norme, dire che $\underline{x}^{(k)}\to\underline{x}$ componente per componente è lo stesso che dire che $\underline{x}^{(k)}\to\underline{x}$ in una qualsiasi norma.