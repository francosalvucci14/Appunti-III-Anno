# Errore (resto) dell'interpolazione polinomiale

>[!definition]-  Teorema
>Sia $f:[a,b]\to\mathbb R$ di classe $C^{n+1}[a,b]$ e sia $p(x)$ il polinomio di interpolazione di $f(x)$ sugli n+1 nodi distinti $x_0,x_1,\dots,x_n\in[a,b]$
>Allora 
>$$\begin{align}&\forall x\in[a,b]\exists\xi=\xi(x)\in[a,b] :\\(X)\space &f(x)-p(x) = \frac{f^{n+1}(\xi)}{(n+1)!}\cdot(x-x_0)(x-x_1)\dots(x-x_n)\end{align}$$

**Dimostrazione**

Sia $x\in[a,b]$ fissato

1) se x coincide con uno dei nodi $x_i$ allora $(X)$ è soddisfata con un qualsiase $\xi\in(a,b)$, perchè entrambi i memebri vengono uguali a 0
2) Supponiamo che x non coincida con nessuno dei nodi $x_i$

Siamo nel caso 2)

Definiamo $\pi(y) = (y-x_0)(y-x_1)\dots(y-x_n)$ e $r(y) = f(y)-p(y)$

Definiamo $z:[a,b]\to\mathbb R,z(y) = r(y)-\underbrace{\frac{r(x)}{\pi(x)}}_{\text{costante}}\pi(y)$
La funzione $z(y)$ è di classe $C^{n+1}[a,b]$ come somma/diff. di funzioni $f(y),p(y),\pi(y)$, tutte di classe $C^{n+1}[a,b]$ ($p(y),\pi(y)$ addirittura di classe $C^\infty[a,b]$)

Inoltre, la funzione z si annulla in almeno n+2 punti, perchè si annulla in tutti i nodi $x_0,\dots,x_n$ e anche nel punto x

>[!tip]- Osservazione
>$z(x_i)= r(x_i)-\frac{r(x)}{\pi(x)}\cdot\pi(x_i)= \underbrace{f(x_i)-p(x_i)}_{=0}-\frac{r(x)}{\pi(x)}\cdot\underbrace{\pi(x_i)}_{=0}\implies z(x) = \cancel{r(x)}-\cancel{\frac{r(x)}{\pi(x)}}\cdot\cancel{\pi(x)} = 0$

**Passaggio cruciale della dimostrazione**

Per il teorema di Rolle :

$z'(y)$ si annulla in almeno n+1 punti di $(a,b)$
$z''(y)$ si annulla in almeno n punti di $(a,b)$
$z'''(y)$ si annulla in almeno n-1 punti di $(a,b)$
...
$z^{n+1}(y)$ si annulla in almeno 1 punti di $(a,b)\to$ chiamo questo punto $\xi$

Mostriamo che il punto $\xi$ è quello che fa valere la formula $(X)$

$$\begin{align}&z(y)=r(y)-\frac{r(x)}{\pi(x)}\cdot\pi(y)\\&r(y)=f(y)-\underbrace{p(y)}_{\in\mathbb R_n[y]}\\&\underbrace{\pi(y)=(y-x_0)(y-x_1)\dots(y-x_n)}_{=y^{n+1}\cdot \underbrace{q(y)}_{\in\mathbb R_n[y]}}\end{align}$$

Quindi

$$\begin{align}z^{n+1}(y)&=r^{n+1}(y)-\frac{r(x)}{\pi(x)}\pi^{n+1}(y)\\&=f^{n+1}(y)-\cancel{p^{n+1}(y)}_{=0}-\frac{r(x)}{\pi(x)}\cdot(n+1)!\\&=f^{n+1}(y)-\frac{r(x)}{\pi(x)}\cdot(n+1)!\end{align}$$

$z^{n+1}(y)$ si annulla in $\xi$, quindi posso scrivere 
$$\begin{align}0=&z^{n+1}(\xi)=f^{n+1}(\xi)-\frac{r(x)}{\pi(x)}\cdot(n+1)!\\&\implies\frac{r(x)}{\pi(x)}\cdot(n+1)!=f^{n+1}(\xi)\\&\implies r(x)=\frac{f^{n+1}(\xi)}{(n+1)!}\cdot\pi(x)\end{align}$$
Che è proprio $(X)$ quindi $\square$

Per esempio vedi pdf su Notability
















