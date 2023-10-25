# Esercizi su errore della formula dei trapezi

## Esempio 1

- Calcolare l'approssimazione di $\int_{0}^{1}\sqrt{\cos x}\:dx$ con $I_{10}$
- Stimare l'errore $\bigg|\int_{0}^{1}\sqrt{\cos x}\:dx-I_{10}\bigg|$ 

**Soluzione**
Applichiamo la formula di $I_{n}$ con $n=10$, $h= \frac{1-0}{10}= \frac{1}{10}$, $f(x)=\sqrt{\cos x}$, $x_{j}= \frac{j}{10}$, $j=0,\dots,10$, per cui $$I_{10}= \frac{1}{10}\left[\frac{\sqrt{\cos 0}+\sqrt{\cos 1}}{2}+\sum\limits_{j=1}^{9}\sqrt{\cos \frac{j}{10}}\right]$$ $$=\frac{1}{10}\left[\frac{1+\sqrt{\cos 1}}{2}+\sqrt{\cos \frac{1}{10}}+\sqrt{\cos \frac{2}{10}}+\dots+\sqrt{\cos \frac{9}{10}}\right]$$ $$=0.9135078\dots$$
Per il secondo punto abbiamo che $f(x)=\sqrt{\cos x}$ è $C^{\infty}[0,1]$ perché è la composizione di $\cos x:[0,1]\to[\cos 1,1]$ e $\sqrt{y}:[\cos1,1]\to \mathbb R$ ed entrambe le funzioni sono $C^{\infty}$ sui rispettivi domini. Di conseguenza per il [[#^d9e450|teorema]] abbiamo che $$(\star)\:\:\int_{0}^{1}\sqrt{\cos x}\:dx-I_{10}=\frac{-f^{''}(\eta)}{12}\left(\frac{1}{10}\right)^{2}=\frac{-f^{''}(\eta)}{1200}\:\:\:(\eta\in[0,1])$$
Calcoliamo $f^{''}(x)$:
 $$f^{'}(x)=\frac{-\sin x}{2\sqrt{\cos x}}$$ $$\begin{align}f^{''}(x)&=\frac{-\cos x2\sqrt{\cos x}-(-\sin x)\cancel2\frac{-\sin x}{\cancel2\sqrt{\cos x}}}{4\cos x}= \\
 &=- \frac{1}{2}\sqrt{\cos x}-\frac{\sin^{2}x}{4(\cos x)^{\frac{3}{2}}}
 \end{align}$$
 Per ogni $x\in[0,1]$ si ha $$|f^{''}(x)|\le \frac{1}{2}\sqrt{\cos x}+\frac{sin^{2}x}{4(\cos x)^{\frac{3}{2}}}\le \frac{1}{2}+\frac{\sin^{2}1}{4(\cos 1)^{\frac{3}{2}}}\le0.9458$$ 
 Tornando a $(\star)$ si ha $$\left|\int_{0}^{1}\sqrt{\cos x}\:dx-I_{10}\right|=\frac{\big|f^{''}(\eta)\big|}{1200}\le\frac{0.9458}{1200}=0.000788$$ 
## Esempio 2

Fissato $\epsilon=10^{-8}$, determinare un $n$ tale che la formula $I_{n}$fornisca un'approssimazione di $\int_{0}^{1}\sqrt{\cos x}\:dx$ con errore $\bigg|\int_{0}^{1}\sqrt{\cos x}\:dx-I_{n}\bigg|\le \epsilon$ .

**Soluzione**
Per il teorema sull'errore della formula dei trapezi si ha $$\bigg|\int_{0}^{1}\sqrt{\cos x}\:dx-I_{n}\bigg|=\left|-\frac{f^{''}(\eta)}{12}\left(\frac{1}{n}\right)^{2}\right|=\frac{\big|f^{''}(\eta)\big|}{12n^{2}}\:\:\:(\eta\in[0,1])$$ 
Nell'[[#Esempio 1|esempio precedente]] abbiamo che $|f^{''}(x)|\le0.9458$ per ogni $x\in[0,1]$ e quindi risulta $$\left|\int_{0}^{1}\sqrt{\cos x}\: dx-I_{n}\right|\le \frac{1}{12n^{2}}$$
Poiché $$\frac{1}{12n^{2}}\le\epsilon\iff n\ge \sqrt{\frac{1}{12\epsilon}}=n(\epsilon)$$ si ha $$\left|\int_{0}^{1}\sqrt{\cos x}\: dx-I_{n}\right|\le\epsilon\:\:\:\: \forall n\ge n(\epsilon)$$
Nel nostro caso abbiamo $\epsilon=10^{-8}$ e quindi per garantire che $\left|\int_{0}^{1}\sqrt{\cos x}\: dx-I_{n}\right|\le10^{-8}$, basta prendere un qualsiasi $n \ge n(10^{-8})=2886.75\dots$

## Esempio 3

Fissato $\epsilon > 0$, determinare un $n$ tale $I_n$ fornisca un'approssimazione di $\left|\int_{0}^{1}\frac{x+2}{\log(x+2)}\:dx-I_{n}\right|\le \epsilon$. Quanto vale $n$ se $\epsilon=10^{-8}$?

**Soluzione**
Posto $f(x)=\frac{x+2}{\log(x+2)}$, si ha $$\left|\int_{0}^{1}\frac{x+2}{\log(x+2)}\:\: dx-I_{n}\right|=\left|- \frac{1}{12n^{2}}f^{''}(\eta)\right|=\frac{f^{''}(\eta)}{12n^{2}}\:\:\:(\eta\in[0,1])$$ Calcoliamo $f^{''}(x)$:$$\begin{align}f^{'}(x)&=\frac{\log(x+2)-(x+2)\frac{1}{x+2}}{\log^{2}(x+2)}=\frac{\log(x+2)-1}{\log^2(x+2)}\\
f^{''}(x)&=\frac{\frac{1}{x+2}\log^{2}(x+2)-(\log(x+2)-1)2\log(x+2)\frac{1}{x+2}}{\log^{4}(x+2)}=\frac{2-\log(x+2)}{(x+2)\log^{3}(x+2)}\end{align}$$
Per ogni $x\in[0,1]$ si ha $$\big|f^{''}(x)\big|=\left|\frac{2-\log(x+2)}{(x+2)\log^{3}(x+2)}\right|=\frac{2-\log(x+2)}{(x+2)\log^{3}(x+2)}\le \frac{2-\log2}{2\log^{3}2}\le1.97$$
Dunque $$\left|\int_{0}^{1}\frac{x+2}{\log(x+2)}\:dx-I_{n}\right|\le \frac{1.97}{12n^{2}}$$
Poiché $$\frac{1.97}{12n^{2}}\le\epsilon\iff n\ge\sqrt{\frac{1.97}{12\epsilon}}=n(\epsilon)$$
Nel caso $\epsilon=10^{-8}$, per garantire che $\left|\int_{0}^{1}\frac{x+2}{\log(x+2)}\:dx-I_{n}\right|\le 10^{-8}$ basta prendere un qualsiasi $n\ge n(10^{-8})=4051.74$