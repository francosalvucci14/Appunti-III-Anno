# Matrici irriducibili

Un grafo è un diagramma formato da un certo numero di nodi e di archi. Un arco è semplicemente una freccia che parte da un nodo e arriva in un altro. Se il grafico possiede $n$ nodi, questi vengono tipicamente indicati con i numeri $1,\dots,n$ mentre l'arco che va dal nodo $i$ al nodo $j$ viene indicato con una freccia $i \to j$. Un *cammino* all'interno di un grafo è un percorso che parte da un nodo $i$ e, seguendo gli archi del grafo, si arriva a un altro nodo $j$. Se il nodo di arrivo $j$ coincide con il nodo di partenza $i$ allora si parla di *ciclo*.
Un grafo si dice **fortemente connesso** se per ogni coppia di nodi $i$ e $j$ esiste un cammino all'interno del grafo che va da $i$ a $j$. Equivalentemente, un grafo è fortemente connesso se esiste un ciclo nel grafo che tocca tutti i nodi. In figura sotto sono mostrati due grafi, uno fortemente connesso e l'altro no.

![[CN/img/img2.png|center|700]]

Data una matrice $A\in\mathbb C^{n\times n}$, il grafo associato ad $A$ è così definito:
- i nodi sono $1,\dots,n$ 
- gli archi sono le frecce $i\to j$ tali che $a_{ij}\neq0$ 
In pratica nel grafo di $A$ ho un arco da $i$ a $j$ se e solo se l'elemento di $A$ in posizione $(i,j)$ è diverso da 0. Una matrice $A\in\mathbb C^{n\times n}$ si dice **irriducibile** se il suo grafo è fortemente connesso.

## Esempio 
Stabilire se le matrici $$A=\begin{bmatrix}0 & i & 0 \\ 1 & 1 & 4 \\ 0 & i & 0\end{bmatrix}\:\:\:B=\begin{bmatrix}0 & -1 & 0 \\ i & 2 & -3   \\ 0 & 0 & 0 \end{bmatrix}$$
sono irriducibili oppure no.

**Soluzione**
Il grafo della matrice $A$ è così definito:
- i nodi sono $1,2,3$ 
- gli archi sono $1\to2,2\to1,2\to2,2\to3,3\to2$ 
Il grafo di $A$ è quello mostrato in [[CN/img/img2.png|figura]] a sinistra ed è fortemente connesso, per cui $A$ non è irriducibile. 
Il grafo della matrice B è così definito:
- i nodi sono $1,2,3$
- gli archi sono $1\to2,2\to1,2\to2,2\to3$ 
Il grafo di $B$ è quello mostrato in [[CN/img/img2.png|figura]] a destra e non è fortemente connesso, per cui $B$ non è irriducibile. 

# Localizzazione degli autovalori 

Denotiamo con $\textit{}$ $\mathscr{C}(z_{0},r)=\{z\in\mathbb C\: : \:|z-z_{0}|\leq r\}$ il cerchio nel piano complesso $\mathbb C$ di centro $z_{0}$ e raggio $r$. Data una matrice $A \in \mathbb C^{n\times n}$, i cerchi di Gershgorin di $A$ sono i cerchi $K_{1},\dots,K_{n}$ definiti nel modo seguente: 
per ogni $i=1,\dots,n,$ $$K_{i}=\mathscr{C}(a_{ii},|a_{i1}|+\dots+|a_{i,i-1}|+|a_{i,i+1}|+\dots+|a_{in}|)=\mathscr{C}\left(a_{ii},\sum\limits_{j\neq i}|a_{ij}|\right)$$
Poiché il raggio del cerchio $K_{i}$ è la somma dei moduli degli elementi sulla riga $i$-esima di $A$ (escluso l'elemento diagonale $a_{ii}$), i cerchi di Gershgorin per colonna di $A$ che sono i cerchi $H_{1},\dots,H_{n}$ definiti nel modo seguente: 
per ogni $j=1,\dots,n,$ $$H_{j}=\mathscr{C}(a_{jj},|a_{1j}|+\dots+|a_{j-1,j}|+|a_{j+1,j}|+\dots+|a_{nj}|)=\mathscr{C}\left(a_{jj},\sum\limits_{j\neq i}|a_{ij}|\right)$$
Ad ogni modo, *quando si parla di cerci di Gershgorin senza altre specificazioni, s'intendono i cerchi di Gershgorin per riga*. Quando si vuole parlare dei cerci di Gershgorin per colonna, questo va specificato ogni volta.

# Esempio 1 

Determinare i cerchi di Gershgorin della matrice A dell'[[#Matrici irriducibili#Esempio|esempio]].

**Soluzione**
Non essendo specificato diversamente, si sta parlando dei cerchi di Gershgorin per riga di $A$. Tali cerchi sono $K_{1}=\mathscr{C}(0,1),K_{2}=\mathscr{C}(0,3),K_{3}=\mathscr{C}(0,1+\sqrt2),K_{4}=\mathscr{C}(3i,19)$ 

## Primo teorema di Gershgorin

Gli autovalori di una matrice $A\in\mathbb C^{n\times n}$ stanno tutti nell'unione dei cerchi di Gershgorin di $A$.

**Dim.**
Sia $\lambda$ un autovalore di $A$. Allora, detto $\underline{u}\neq \underline{0}$ un corrispondente autovettore, si ha $$A\underline{u}=\lambda\underline{u}\iff\sum\limits_{j=1}^{n}a_{ij}u_{j}=\lambda u_{j}\:\:\:\:\:\text{per ogni }i=1,\dots,n$$ Selezionando un indice $i$ corrispondente ad una componente $u_{i}$ di modulo massimo di $\underline{u}$, la precedente equazione $i-$esima ci dice che $$\begin{align*}
\sum\limits_{j=1}^{n}a_{ij}u_{j}=\lambda u_{i}&\implies (\lambda-a_{ii})u_{i}\sum\limits_{j\ne i}a_{ij}u_{j}\\
&\implies |\lambda-a_{ii}||u_{i}|=|\sum\limits_{j\ne i}a_{ij}u_{j}|\le\sum\limits_{j\ne i}|a_{ij}||u_{j}|=|u_{i}|\sum\limits_{j\ne i}|a_{ij}|\\
&\implies |\lambda-a_{ii}|\le\sum\limits_{j\ne i}|a_{ij}|
\end{align*}$$ Quindi $\lambda$ sta dentro $K_{i}$ e dunque dentro l'unione dei cerchi di Gershgorin di $A$. $\square$ 

## Secondo teorema di Gershgorin 

Supponiamo che l'unione di $k$ cerchi di Gershgorin di $A\in\mathbb C^{n\times n}$ sia disgiunta dall'unione degli altri $n-k$ cerchi. Allora $k$ autovalori di $A$ stanno nella prima unione e $n-k$ nella seconda.

## Terzo teorema di Gershgorin

Supponiamo che $A\in\mathbb C^{n\times n}$ sia irriducibile. Allora i punti che stanno sul bordo dei cerchi di Gershgorin di A a cui appartengono ma non sul bordo di tutti i cerchi **non sono** autovalori di $A$

Questo teorema si usa per escludere alcuni punti dai possibili autovalori di $A$. Si tratta quindi di un teorema "esclusivo". Di questo teorema esiste una versione più debole ma più semplice. 

### Terzo teorema di Gershgorin debole

Supponiamo che $A\in\mathbb C^{n\times n}$ sia irriducibile e sia $\mathscr{B}$ il bordo dell'unione dei cerchi di Gershgorin di $A$. Allora i punti di $\mathscr{B}$ che non stanno sul bordo di tutti i cerchi non sono autovalori di $A$.

**Dim.**
Ogni punto di $\mathscr{B}$ sta per forza sul bordo di quei cerchi a cui appartiene (non può stare dentro a un cerchio altrimenti non sarebbe un punto di $\mathscr{B}$). Pertanto, ogni punto di $\mathscr{B}$ che non sta sul bordo di tutti i cerchi soddisfa soddisfa l'ipotesi del [[#Terzo teorema di Gershgorin|terzo teorema di Gershgorin]] e quindi va escluso dall'insieme dei possibili autovalori di $A$. $\square$

## Esempio 2

Supponiamo di sapere che una matrice $A\in\mathbb C^{5\times 5}$ è irriducibile e che i suoi cerchi di Gershgorin siano i seguenti $$\begin{align*}
&K_{1}=\mathscr{C}(1,1)\\
&K_{2}=\mathscr{C}(-i,1)\\
&K_{3}=\mathscr{C}(4i,1)\\
&K_{4}=\mathscr{C}(1+i,1)\\
&K_{5}=\mathscr{C}(-1,1)
\end{align*}$$ Avendo a disposizione solo queste informazioni, dire se le seguenti affermazioni sono vere o false: 
1.  $0$ non è autovalore $A$ 
2. $A$ è invertibile
3. $1$ potrebbe essere un autovalore di $A$
4. $-1+4i$ potrebbe essere un autovalore di $A$
5. $K_{3}$ privato del suo bordo contiene esattamente un autovalore di $A$
6. Per il raggio spettrale $\rho(A)$ vale la stima $3<\rho(A)<5$ 

**Soluzione**
![[CN/img/img3.png|center|300]]

1. VERO, infatti $A$ è irriducibile e $0$ sta sul bordo dell'unione dei cerchi di Gershgorin ma non sul bordo di tutti i cerchi, per cui non può essere autovalore di A in base al [[#Terzo teorema di Gershgorin#Terzo teorema di Gershgorin debole|terzo teorema di Gershgorin debole]] 
2. VERO, infatti $0$ non è un autovalore di $A$ e quindi $A$ è invertibile
3. VERO, infatti non si può escludere che $1$ sia un autovalore di $A$ usando il [[#Terzo teorema di Gershgorin|terzo teorema di Gershgorin]], perché $1$ non soddisfa le ipotesi di tale teorema: $1$ appartiene a $K_{1}$ ed è interno a $K_{1}$, dunque non sta sul bordo di quei cerchi di Gershgorin a cui appartiene  
4. FALSA, $A$ è irriducibile e $-1+4i$ sta sul bordo dell'unione dei cerchi di Gershgorin ma non sul bordo di tutti i cerchi, per cui non può essere autovalore di $A$ in base al [[#Terzo teorema di Gershgorin debole|terzo teorema di Gershgorin debole]].
5. VERA, infatti $K_3$ contiene esattamente un autovalore di A per il [[#Secondo teorema di Gershgorin|secondo teorema di Gershgorin]]. Inoltre, tale autovalore non può stare sul bordo di $K_3$ perché, per lo stesso motivo visto nel punto precedente, ogni punto del bordo di $K_3$ non può essere autovalore di A. Dunque $K_3$ privato del suo bordo contiene esattamente un autovalore di A.
6. VERA, infatti l’autovalore $\lambda$ di modulo massimo di $A$ è quello che sta in $K_3$ privato del suo bordo. Questo perché $|\lambda| = \text{ distanza}(\lambda, 0) > 3$ (tutti i punti di $K_3$ privato del bordo hanno modulo $> 3$), mentre gli altri autovalori hanno modulo $< 3$ (essendo contenuti nel cerchio di centro $0$ e raggio $3$). Inoltre, $|\lambda| < 5$ perché tutti i punti interni a $K_3$ hanno questa proprietà. Infatti, tutti i punti interni a $K_3$ cono contenuti nel cerchio di centro $0$ e raggio $5$ e dunque hanno distanza da $0$ (cioè modulo) minore di $5$.