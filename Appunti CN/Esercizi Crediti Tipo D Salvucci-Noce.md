```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```
# Esercizi

## Esercizio 1

Il primo esercizio chiede di scrivere in MATLAB una function che calcoli l'algoritmo di **Ruffini-Horner** per la valutazione del polinomio d'interpolazione in un punto:

_**Esercizio d’implementazione dell’algoritmo di valutazione del polinomio d’interpolazione in più punti.**_
### Codice Esercizio 1

Il codice del primo esericizio è  il seguente:

```matlab title:"Esercizio 1.1"
function p_t = interpola_ruffini_horner(x, y, t)
    % Input:
    % x: vettore dei punti x0, x1, ..., xn (devono essere distinti)
    % y: vettore dei valori corrispondenti y0, y1, ..., yn
    % t: vettore dei punti t1, t2, ..., tm dove si vuole valutare il polinomio interpolante
    
    % Output:
    % p_t: vettore contenente le valutazioni del polinomio interpolante nei punti t
    
    % Calcola i coefficienti del polinomio usando le differenze divise
    coeff = differenze_divise(x, y);
    
    % Valuta il polinomio nei punti t usando lo schema di Horner
    p_t = horner_eval(coeff, x, t);
end

function coeff = differenze_divise(x, y)
    % Calcola i coefficienti delle differenze divise
    n = length(x);
    coeff = y;  % Copia il vettore y
    
    % Costruisce la tabella delle differenze divise
    for j = 2:n
        for i = n:-1:j
            coeff(i) = (coeff(i) - coeff(i-1)) / (x(i) - x(i-j+1));
        end
    end
end

function p_t = horner_eval(coeff, x, t)
    % Valuta il polinomio usando lo schema di Horner
    n = length(coeff);
    m = length(t);
    p_t = zeros(1, m);
    
    for k = 1:m
        % Inizializza il polinomio con il termine di grado più alto
        p = coeff(n);
        
        % Applica lo schema di Horner
        for i = n-1:-1:1
            p = p * (t(k) - x(i)) + coeff(i);
        end
        
        % Salva il risultato della valutazione nel punto t(k)
        p_t(k) = p;
    end
end
```

### Spiegazione

1) **Funzione principale (`interpola_ruffini_horner`)**:
    - Prende in input i vettori `x` (ascisse), `y` (ordinate) e `t` (punti in cui valutare il polinomio).
    - Prima usa la funzione `differenze_divise` per calcolare i coefficienti del polinomio interpolante nella forma di Newton.
    - Poi usa la funzione `horner_eval` per valutare il polinomio nei punti desiderati applicando lo schema di Horner.
2) **Calcolo delle differenze divise (`differenze_divise`)**:
    - Costruisce la tabella delle differenze divise e restituisce i coefficienti del polinomio interpolante.
    - L'algoritmo funziona partendo dai valori `y` e iterando per costruire le differenze successive.
3) **Valutazione con lo schema di Horner (`horner_eval`)**:
    - Prende i coefficienti del polinomio e valuta il polinomio in ciascun punto di `t` usando lo schema di Horner.
    - Questo schema permette di valutare il polinomio in modo molto efficiente, riducendo il numero di operazioni necessarie.
## Esercizio 2

Il secondo esercizio chiede di scrivere una function MATLAB per implementare la **formula dei trapezi** di una data funzione presa in input:

_**Esercizio d’implementazione della formula dei trapezi**_
### Codice Esercizio 2

```matlab title:"Esercizio 1.2"
function In = formula_trapezi(f, a, b, n)
    % Input:
    % f: funzione da integrare (definita su [a,b])
    % a: estremo sinistro dell'intervallo
    % b: estremo destro dell'intervallo
    % n: numero di sottointervalli (n >= 1)
    
    % Output:
    % In: approssimazione dell'integrale di f(x) su [a, b] usando la formula dei trapezi

    % Larghezza di ciascun sottointervallo
    h = (b - a) / n;
    
    % Calcolo della somma dei valori intermedi
    somma = 0;
    for i = 1:n-1
        xi = a + i*h;
        somma = somma + f(xi);
    end
    
    % Formula dei trapezi
    In = h*((f(a)+f(b))/2+somma)
end
```

### Spiegazione

Funzione **`formula_trapezi`**:
- Prende in input la funzione da integrare `f`, gli estremi dell'intervallo `[a, b]`, e il numero di sottointervalli `n`.
- Calcola la larghezza di ciascun sottointervallo come $h=\frac{b-a}{n}$
- Usa la **formula dei trapezi** per calcolare un'approssimazione dell'integrale: $$I_n=h\left[\frac{f(a)+f(b)}{2}+\sum\limits_{j=1}^{n-1}f(x_j)\right]$$
- Restituisce l'approssimazione $I_n$​ della funzione $f(x)$ passata in input usando la formula dei trapezi.
## Esercizio 3

Il terzo esercizio chiede di scrivere una function MATLAB per implementare il **metodo di estrapolazione** di una data funzione presa in input. Chiede inoltre di usare le function MATLAB usate per risolvere gli esercizi 1 e 2

_**Esercizio d’implementazione del metodo di estrapolazione**_
### Codice Esercizio 3 

Il codice è il seguente:

```matlab title:"Esercizio 1.3"
function p0 = estrapol(f, a, b, n_vect)
    % Input:
    % f: funzione da integrare
    % a: estremo sinistro dell'intervallo
    % b: estremo destro dell'intervallo
    % n_vect: vettore dei valori di n0, n1, ..., nm

    % Output:
    % p0: valore estrapolato p(0)

    % Prealloca i vettori per h^2 e In
    m = length(n_vect);
    h_squared = zeros(1, m);
    In_values = zeros(1, m);

    % Calcola h^2 e In per ogni n in n_vect
    for i = 1:m
        n = n_vect(i);
        h = (b - a) / n;  % Passo di discretizzazione
        h_squared(i) = h^2;
        In_values(i) = formula_trapezi(f, a, b, n);
    end

    % Interpola i valori (h^2, In) usando le differenze divise
    % La funzione interpola_ruffini_horner accetta vettori di x (qui h^2) e y (qui In_values)
    % t=0 perché vogliamo estrapolare p(0)
    p0 = interpola_ruffini_horner(h_squared, In_values, 0);

	% Se viene specificato il numero di cifre, usa vpa per ottenere precisione       if nargin > 4 
		p0 = vpa(p0, cifre); % Calcola p0 con precisione specificata 
	end
end
```

#### Spiegazione del codice

1. **Input**:
    - `f`: la funzione da integrare.
    - `a` e `b`: gli estremi dell'intervallo su cui si calcola l'integrale.
    - `n_vect`: un vettore di valori $n_0,n_1,\dots,n_m$ usati per il calcolo degli integrali.
2. **Output**:
    - `p0`: il valore estrapolato $p(0)$, dove $p(x)$ è il polinomio interpolante ottenuto dai valori di $h^2$ e $I_n$.
3. **Calcolo di $h^2$ e $I_n$​**:
    - Per ogni $n_i$​ nel vettore `n_vect`, il programma calcola il passo $h$ e il corrispondente integrale approssimato $I_n$​ utilizzando la formula dei trapezi fornita nell'Esercizio 2.
4. **Interpolazione**:
    - I valori $h^2$ e $I_n$​ vengono usati per ottenere il polinomio interpolante con la funzione di interpolazione `interpola_ruffini_horner`, che è la soluzione all'Esercizio 1.11.
5. **Estrapolazione**:
    - Il programma valuta il polinomio interpolante nel punto $t=0$ per ottenere $p(0)$.

#### Uso delle altre funzioni

- `interpola_ruffini_horner`, `differenze_divise` e `horner_eval` provengono dall'Esercizio 1.1.
- `formula_trapezi` viene dall'Esercizio 1.2 per approssimare gli integrali usando la formula dei trapezi.
- `vpa(p0, cifre)` viene usato per approssimare correttamente il risultato con il numero di cifre passate in input. Questa è una funzione del Toolbox **Symbolic Math Toolbox** 
## Esercizio 4

L'esercizio chiede di creare una function MATLAB per implementare il **metodo di Jacobi**.

_**Esercizio d’implementazione del metodo di Jacobi**_
### Codice Esercizo 4

Il codice è il seguente

```matlab title:"Esercizio 1.4"
function [x, K, r_norm] = jacobi_method(A, b, x0, epsilon, N_max)
    % Input:
    % A: matrice del sistema lineare Ax = b
    % b: vettore dei termini noti
    % x0: vettore di innesco (stima iniziale di x)
    % epsilon: soglia di precisione
    % N_max: numero massimo di iterazioni consentite

    % Output:
    % x: vettore approssimato x^(K) dopo K iterazioni o x^(N_max)
    % K: numero di iterazioni effettivamente eseguite
    % r_norm: norma ||r^(K)||_2 del residuo alla fine del processo

    % Numero di variabili (dimensione del sistema)
    n = length(b);

    % Inizializza la variabile per il vettore x^(K) (soluzione corrente)
    x = x0;

    % Itera il metodo di Jacobi
    for K = 1:N_max
        % Prealloca il vettore x^(K+1)
        x_new = zeros(n, 1);

        % Calcola ogni componente di x^(K+1)
        for i = 1:n
            % Somma degli elementi a sinistra di x^(K)
            sum1 = A(i, 1:i-1) * x(1:i-1);
            % Somma degli elementi a destra di x^(K)
            sum2 = A(i, i+1:n) * x(i+1:n);
            % Formula del metodo di Jacobi
            x_new(i) = (b(i) - sum1 - sum2) / A(i, i);
        end

        % Calcola il residuo r^(K) = b - A * x^(K)
        r = b - A * x_new;

        % Calcola la norma del residuo ||r^(K)||_2
        r_norm = norm(r, 2);

        % Condizione di arresto: se ||r^(K)||_2 <= epsilon * ||b||_2
        if r_norm <= epsilon * norm(b, 2)
            x = x_new;
            return;  % Arresta l'algoritmo e restituisce il risultato
        end

        % Aggiorna la soluzione corrente x^(K) con x^(K+1)
        x = x_new;
    end

    % Se si raggiunge N_max iterazioni senza soddisfare il criterio, si restituisce
    % x^(N_max), il relativo indice N_max e la norma del residuo ||r^(N_max)||_2
end
```
### Spiegazione del codice

1. **Input:**
    - `A`: La matrice del sistema lineare.
    - `b`: Il vettore dei termini noti.
    - `x0`: Il vettore di innesco (cioè la stima iniziale di $x$).
    - `epsilon`: La soglia di precisione per il residuo.
    - `N_max`: Il numero massimo di iterazioni consentite.
2. **Output:**
    - `x`: Il vettore soluzione $x^{(K)}$, dove $K$ è il numero di iterazioni.
    - `K`: Il numero di iterazioni effettivamente eseguite.
    - `r_norm`: La norma $||r^{(K)}||_2$​ del residuo $r^{(K)}=b-A\cdot x^{(K)}$.
3. **Procedura:**
    - Il metodo di Jacobi viene applicato iterativamente fino a quando il residuo $||r^{(K)}||_2$​ diventa minore o uguale a $\epsilon\cdot ||b||_{2}$​, oppure si raggiunge il numero massimo di iterazioni $N_{\text{max}}$.
    - Se nessuna delle iterazioni soddisfa la condizione di arresto, il programma restituisce $x^{(N_{\text{max}})}$.
## Esercizio 5

L'esercizio chiede di creare una function MATLAB per implementare il **metodo di Gauss-Sidel**.

***Esercizio d’implementazione del metodo di Gauss-Seidel***
### Codice Esercizio 5

Il codice è il seguente

```matlab title:"Esercizio 1.5"
function [x, K, r_norm] = metodo_gauss_seidel(A, b, x0, epsilon, N_max)
    % Input:
    % A: matrice del sistema lineare Ax = b
    % b: vettore dei termini noti
    % x0: vettore di innesco (stima iniziale di x)
    % epsilon: soglia di precisione
    % N_max: numero massimo di iterazioni consentite

    % Output:
    % x: vettore approssimato x^(K) dopo K iterazioni o x^(N_max)
    % K: numero di iterazioni effettivamente eseguite
    % r_norm: norma ||r^(K)||_2 del residuo alla fine del processo

    % Numero di variabili (dimensione del sistema)
    n = length(b);

    % Inizializza la soluzione corrente con il vettore di innesco x0
    x = x0;

    % Itera il metodo di Gauss-Seidel
    for K = 1:N_max
        % Memorizza la soluzione precedente x^(K-1)
        x_old = x;

        % Calcola ogni componente di x^(K)
        for i = 1:n
            % Somma degli elementi a sinistra di x^(K)
            sum1 = A(i, 1:i-1) * x(1:i-1);
            % Somma degli elementi a destra di x^(K-1)
            sum2 = A(i, i+1:n) * x_old(i+1:n);
            % Formula del metodo di Gauss-Seidel
            x(i) = (b(i) - sum1 - sum2) / A(i, i);
        end

        % Calcola il residuo r^(K) = b - A * x^(K)
        r = b - A * x;

        % Calcola la norma del residuo ||r^(K)||_2
        r_norm = norm(r, 2);

        % Condizione di arresto: se ||r^(K)||_2 <= epsilon * ||b||_2
        if r_norm <= epsilon * norm(b, 2)
            return;  % Arresta l'algoritmo e restituisce il risultato
        end
    end

    % Se si raggiunge N_max iterazioni senza soddisfare il criterio, si restituisce
    % x^(N_max), il relativo indice N_max e la norma del residuo ||r^(N_max)||_2
end
```

### Spiegazione Codice

1. **Input:**
    - `A`: La matrice del sistema lineare.
    - `b`: Il vettore dei termini noti.
    - `x0`: Il vettore di innesco (cioè la stima iniziale di $x$).
    - `epsilon`: La soglia di precisione per il residuo.
    - `N_max`: Il numero massimo di iterazioni consentite.
2. **Output:**
    - `x`: Il vettore soluzione $x^{(K)}$, dove $K$ è il numero di iterazioni.
    - `K`: Il numero di iterazioni effettivamente eseguite.
    - `r_norm`: La norma $||r^{(K)}||_2$​ del residuo $r^{(K)}=b-A\cdot x^{(K)}$.
3. **Procedura:**
    - Il metodo di Gauss-Seidel iterativo aggiorna ogni componente del vettore $x^{(K)}$ tenendo conto dei valori già aggiornati di $x_i$​, a differenza del metodo di Jacobi, dove si usano solo i valori dell'iterazione precedente.
	- L'arresto del processo avviene quando la norma del residuo $||r^{(K)}||_2$​ è inferiore o uguale a $\epsilon\cdot ||b||_{2}$​ oppure si raggiunge il numero massimo di iterazioni $N_{\text{max}}$​.
## Esercizio 6

L'esercizio 6 chiede di creare una function MATLAB che implementi il **metodo della  bisezione**, ovvero il metodo che permette di trovare il punto $\xi$ di una funzione $f(x)$ definita su intervallo $[a,b]$ tale che $fxi)=0$

Sia $f:[a,b]\rightarrow\mathbb{R}$ una funzione continua su $[a,b]$ tale che $f(a)$ e $f(b)$ hanno segno opposto $:f(a)f(b)\lt 0$. Un teorema dell'analisi matematica ( teorema degli zeri ) garantisce che la funzione $f(x)$ ha almeno uno zero nell'intervallo $(a,b)$, cioè esiste un punto $\zeta\in(a,b)$ tale che $fzeta)=0$; 

Figura 1.1
![[Pasted image 20241111124440.png|center|300]]
	Una funzione continua $f:[a,b]\rightarrow\mathbb R$ tale che $f(a)f(b)<0$ possiede almeno uno zero $\zeta\in(a,b)$.

Supponiamo che $f(x)$ abbia un unico zero $\zeta$ in $(a,b)$. Un metodo per determinare un'approssimazione $\xi$ di $\zeta$ è il metodo di bisezione: fissata una soglia di precisione $\varepsilon>0$, il metodo costruisce la successione di intervalli $$[\alpha_k,\beta_k],\space\space\space\space\space\space\space\space k=0,1,2,\dots$$ in cui $[\alpha_0,\beta_0]=[a,b]$ e, per $k\le1$,$$[\alpha_k,\beta_k]=\begin{cases}
[\alpha_{k-1},\frac{\alpha_{k-1}+\beta_{k-1}}{2}],se\ \zeta\in[\alpha_{k-1},.\frac{\alpha_{k-1}+\beta_{k-1}}{2}]\ cioè\ falpha_{k-1})ffrac{\alpha_{k-1}+\beta_{k-1}}{2})\le 0, \\
[\frac{\alpha_{k-1}+\beta_{k-1}}{2},\beta_{k-1}],\ altrimenti.
\end{cases}$$
La successione di intervalli così costruita gode delle seguenti proprietà:
- $\zeta\in[\alpha_k ,\beta_k ]$ per tutti i $k \ge 0$;
- ogni intervallo è metà del precedente e dunque la lunghezza di $[\alpha_k , \beta_k ]$ è $\beta_k − \alpha_k =\frac{b−a}{2^k}$ per ogni $k \ge 0$.
Il metodo si arresta al primo indice $K$ tale che $\beta_K − \alpha_K \le\varepsilon$ e restituisce come risultato il punto medio $\xi$ dell’intervallo $[\alpha_K , \beta_K ]$ dato da $\xi=\frac{\alpha_K+\beta_k}{2}$. In questo modo, siccome $\zeta\in[\alpha_K , \beta_K ]$, si ha $|\xi − \zeta| ≤ \frac{\varepsilon}{2}$.
Osserviamo che l’indice di arresto K è il più piccolo intero ≥ 0 tale che $$\beta_k-\alpha_k\le\varepsilon\iff\frac{b-a}{2^K}\le\varepsilon\iff 2^K\ge\frac{b-a}{\varepsilon}\iff K\ge\log_2frac{b-a}{\varepsilon}),$$
cioè $K=\lceil\log_2frac{b-a}{\varepsilon})\rceil$.

Scrivere un programma Matlab che implementa il metodo di bisezione. Il programma deve:
- prendere in input gli estremi $a, b$ di un intervallo, una funzione continua $f:[a, b]\rightarrow\mathbb R$, con $f(a)f(b) < 0$ e con un unico zero $\zeta\in(a, b)$, e un $\varepsilon > 0$;
- restituire in output l’approssimazione $\xi$ di $\zeta$ ottenuta con il metodo di bisezione sopra descritto, l’indice di arresto $K$ del metodo, e il valore $fxi)$ (che sarà all’incirca pari a $0 = f zeta)$).
### Codice

```matlab title:"Esercizio 1.6"
function [xi, K, fx] = bisezione(a, b, f, epsilon)
    % Verifica che f(a) e f(b) abbiano segno opposto
    if f(a) * f(b) > 0
        error('f(a) e f(b) devono avere segni opposti');
    end

    % Inizializzazione degli estremi dell'intervallo e contatore delle iterazioni
    alpha_k = a;
    beta_k = b;
    K = 0;

    % Ripeti finché la lunghezza dell'intervallo è maggiore della precisione richiesta
    while (beta_k - alpha_k) / 2 > epsilon
        % Calcola il punto medio dell'intervallo
        xi = (alpha_k + beta_k) / 2;

        % Aggiorna gli estremi dell'intervallo in base al segno di f(xi)
        if f(alpha_k) * f(xi) <= 0
            beta_k = xi;
        else
            alpha_k = xi;
        end

        % Incrementa il contatore delle iterazioni
        K = K + 1;
    end

    % Calcola l'approssimazione finale di xi come punto medio dell'ultimo intervallo
    xi = (alpha_k + beta_k) / 2;
    fx = f(xi); % Calcola il valore di f in xi
end
```

### Spiegazione

- **Verifica dei segni**: la funzione controlla che $f(a)$ e $f(b)$ abbiano segno opposto, come richiesto dal teorema degli zeri.
- **Inizializzazione**: definisce $\alpha_k = a$ e $\beta_k = b$ e imposta il contatore $K=0$
- **Iterazione del metodo di bisezione**: continua a suddividere l'intervallo finché la metà della sua lunghezza è maggiore di $\varepsilon$. Ad ogni iterazione:
    - Calcola il punto medio $\xi$.
    - Aggiorna gli estremi in base al segno di $fxi)$ rispetto a $falpha_k)$.
    - Incrementa $K$.
- **Output finale**: restituisce l'approssimazione $\xi$, l'indice $K$, e $fxi)$.
# Problemi

## Problema 1

Si consideri la funzione $\sqrt x$.
**(a)** Sia $p(x)$ il polinomio di interpolazione di $\sqrt x$ sui nodi $$x_0=0,\ x_1=\frac{1}{64},\  x_2=\frac{4}{64},\ x_3=\frac{9}{64},\ x_4=\frac{16}{64},\ x_5=\frac{25}{64},\ x_6=\frac{36}{64},\ x_7=\frac{49}{64},\ x_8=1.$$	Calcolare il vettore ( colonna ) $$[pzeta_1)-\sqrt{\zeta_1}\space\space\space\space\space\space\space\space\space pzeta_2)-\sqrt{\zeta_2}\space\space\space\space\space\space\space\space\space \dots \space\space\space\space\space\space\space\space\space pzeta_{21})-\sqrt{\zeta_{21}}]^T$$
dove $\zeta_i=\frac{i-1}{20}$ per $i=1,...,21$, e osservare in che modo varia la differenza $pzeta_i)-\sqrt{\zeta_i}$ al variare di $i$ da $1$ a $21$.
**(b)** Tracciare il grafico di $\sqrt x$ e di $p(x)$ sull'intervallo $[0,1]$, ponendo i due grafici su un'unica figura e inserendo una legenda che ci dica qual è la funzione $\sqrt x$ e qual è il polinomio $p(x)$.
### Soluzione

**Punto (a)**

Con $\xi_i=\frac{i-1}{20}$, il vettore colonna $pxi_1)-\sqrt{\xi_1},\dots,pxi_{21})-\sqrt{\xi_{21}}$ è $$\begin{align}
&pxi_1)-\sqrt{\xi_1}:0
\\&pxi_2)-\sqrt{\xi_2}:0.009373456935820
\\&pxi_3)-\sqrt{\xi_3}:-0.016624898598359
\\&pxi_4)-\sqrt{\xi_4}:0.006265159516694
\\&pxi_5)-\sqrt{\xi_5}: 0.026059100541982
\\&pxi_6)-\sqrt{\xi_6}: 0.000000000000000
 \\&pxi_7)-\sqrt{\xi_7}: -0.046798842893448
 \\&pxi_8)-\sqrt{\xi_8}: -0.052843679514480
\\&pxi_9)-\sqrt{\xi_9}:   0.019043791981465
\\&pxi_{10})-\sqrt{\xi_{10}}:   0.136657922266046
\\&pxi_{11})-\sqrt{\xi_{11}}:   0.195969221000572
\\&pxi_{12})-\sqrt{\xi_{12}}:   0.070222900207986
\\&pxi_{13})-\sqrt{\xi_{13}}:  -0.298665479678417
\\&pxi_{14})-\sqrt{\xi_{14}}:  -0.793827451939188
\\&pxi_{15})-\sqrt{\xi_{15}}:  -1.047857448417138
\\&pxi_{16})-\sqrt{\xi_{16}}:  -0.461689802877381
\\&pxi_{17})-\sqrt{\xi_{17}}:   1.600121563949965
\\&pxi_{18})-\sqrt{\xi_{18}}:   5.337600132745608
\\&pxi_{19})-\sqrt{\xi_{19}}:   9.648720381277402
\\&pxi_{20})-\sqrt{\xi_{20}}:  10.731478361986454
\\&pxi_{21})-\sqrt{\xi_{21}}:  -0.000000000000004\end{align}$$
Osservando i valori numerici, si può notare che:
- **L'errore non è costante:** La differenza $pxi_i) - \sqrt{\xi_i}$ assume sia valori positivi che negativi, indicando che il polinomio a volte sovrastima e a volte sottostima la funzione radice quadrata.
- **L'errore varia in modo significativo a seconda del punto:** In alcuni punti l'errore è molto piccolo (quasi nullo), mentre in altri è molto grande.

**Punto (b)**

Il grafico delle funzioni $\sqrt{x}$ e $p(x)$ è il seguente

![[grafico_es1.jpg|center|500]]
### Codice

```matlab title:Problema2.1
% Definisci i nodi di interpolazione e i valori corrispondenti di sqrt(x)
x_nodes = [0, 1/64, 4/64, 9/64, 16/64, 25/64, 36/64, 49/64, 1];
y_nodes = sqrt(x_nodes);

% Definisci i punti zeta_i dove valutare il polinomio interpolante
i = 1:21;
zeta = (i-1) / 20;

% Calcola il polinomio interpolante nei punti zeta usando Interpola_Ruffini_Horner
p_zeta = interpola_ruffini_horner(x_nodes, y_nodes, zeta);

% Calcola la funzione sqrt nei punti zeta
sqrt_zeta = sqrt(zeta);

% Calcola il vettore delle differenze p(zeta) - sqrt(zeta)
diff_vector = p_zeta - sqrt_zeta;

% Visualizza il vettore delle differenze
disp('Vettore delle differenze p(zeta_i) - sqrt(zeta_i}:');
disp(diff_vector.');

% Traccia il grafico di sqrt(x) e p(x) sull'intervallo [0, 1]
x_plot = linspace(0, 1, 100);  % Punti per il grafico
p_x_plot = interpola_ruffini_horner(x_nodes, y_nodes, x_plot);
sqrt_x_plot = sqrt(x_plot);

figure;
plot(x_plot, sqrt_x_plot, 'b-', 'LineWidth', 1.5); hold on;
plot(x_plot, p_x_plot, 'r--', 'LineWidth', 1.5);
legend('sqrt(x)', 'p(x)', 'Location', 'best');
xlabel('x');
ylabel('y');
title('Grafico di sqrt(x) e del polinomio interpolante p(x)');
hold off;
```
## Problema 2

Si consideri la funzione $$f(x)=e^x.$$Per ogni intero $n\ge1$ indichiamo con $I_n$ la formula dei trapezi di ordine $n$ per approssimare $$I=\int_0^1 f(x)dx = 1.7182818284590...$$
**(a)** Per ogni fissato $\varepsilon>0$ determinare un $n=nvarepsilon)$ tale che $|I-I_n|\le\varepsilon$.
**(b)** Costruire una tabella che riporti vicino ad ogni $\varepsilon\in\{10^{-1},10^{-2},\dots,10^{-10}\}$:
- il numero $nvarepsilon)$;
- il valore $I_n$ per $n=nvarepsilon)$;
- il valore esatto $I$ ( per confrontarlo con $I_n$ );
- l'errore $|I-I_n|$ ( che deve essere $\le\varepsilon$ ).
**(c)** Calcolare le approssimazioni di $I$ ottenute con le formule dei trapezi $I_2,I_4,I_8,I_{16}$ e confrontarle con il valore esatto $I$.
**(d)** Sia $p(x)$ il polinomio di interpolazione dei valori $I_2,I_4,I_8,I_{16}$ sui nodi $h_2^2,h_4^2,h_8^2,h_{16}^2$, dove $h_2=\frac{1}{2},h_4=\frac{1}{4},h_8=\frac{1}{8},h_{16}=\frac{1}{16}$ sono i passi di discretizzazione relativi alle formule dei trapezi $I_2,I_4,I_8,I_{16}$  rispettivamente. Calcolare$p(0)$ e confrontare $I_2,I_4,I_8,I_{16},p(0)$ con il valore esatto $I$. Che cosa si nota?
### Soluzione

**Punto (a)**

Per il teorema sull'errore o resto della formula dei trapezi, abbiamo che $$\left|\int_0^1e^xdx-I_n\right|=\left|-\frac{f^{''}eta)(b-a)}{12}\cdot h^2\right|$$
Per determinare un $n=nvarepsilon)$ tale che $\left|I-I_n\right|\leq\varepsilon$ procediamo in questo modo

Abbiamo che 

$$\left|\int_0^1e^xdx-I_n\right|=\left|-\frac{f^{''}eta)\cdot 1}{12n^2}\right|=\frac{f^{''}eta)}{12n^2},\eta\in[0,1]$$
Calcoliamo $f^{''}(x)$ : 
$$f^{'}(x)=f^{''}=f(x)=e^x$$
per ogni $x\in[0,1]$ si ha che:
$$\left|f^{''}(x)\right|=\left|e^x\right|=e^x\leq e=2.71828$$
Quindi, possiamo scrivere $$\left|\int_0^1e^xdx-I_n\right|\leq\frac{2.71828}{12n^2}$$
E infine $$\frac{2.71828}{12n^2}\leq\varepsilon\iff n\geq\sqrt{\frac{2.71828}{12\varepsilon}}=nvarepsilon)$$
**Punto (b)**

Tabella

| $\varepsilon$ | $n$   | $I_n$            | $I$              | Errore               |
| ------------- | ----- | ---------------- | ---------------- | -------------------- |
| 1.0e-1        | 2     | 1.75393109246483 | 1.71828182845905 | 3.56492640057802e-2  |
| 1.0e-2        | 4     | 1.72722190455752 | 1.71828182845905 | 8.94007609847147e-3  |
| 1.0e-3        | 12    | 1.71927608944639 | 1.71828182845905 | 9.94260987340567e-4  |
| 1.0e-4        | 38    | 1.71838098946991 | 1.71828182845905 | 9.91610108698193e-5  |
| 1.0e-5        | 120   | 1.71829177220812 | 1.71828182845905 | 9.94374907281603e-6  |
| 1.0e-6        | 379   | 1.71828282532022 | 1.71828182845905 | 9.96861172719576e-7  |
| 1.0e-7        | 1197  | 1.71828192839571 | 1.71828182845905 | 9.99366627230103e-8  |
| 1.0e-8        | 3785  | 1.71828183845402 | 1.71828182845905 | 9.99497018483453e-9  |
| 1.0e-9        | 11967 | 1.71828182945891 | 1.71828182845905 | 9.99865967798996e-10 |
| 1.0e-10       | 37839 | 1.71828182855904 | 1.71828182845905 | 9.99984539618026e-11 |
**Punto (c)**

Le approssimazioni di $I$ ottenute con la formula dei trapezi sono le seguenti :

$I_2 = 1.75393109246482525876$ (Errore = $3.5649264006e-02$)
$I_4 = 1.72722190455751656302$ (Errore = $8.9400760985e-03$)
$I_8 = 1.72051859216430180766$ (Errore = $2.2367637053e-03$)
$I_16 = 1.71884112857999449275$ (Errore = $5.5930012095e-04$)

Valore esatto di $I$ è : $1.718281828459045$

**Punto (d)**

Il valore di $p(0) = 1.718281828460389$
Confronto con il valore esatto di $I$ = $1.718281828459045$

Si nota che il valore $p(0)$ si avvicina di molto al valore esatto di $I$, infatti l'errore $\left|p(0)-I\right|=1.343813949006289e-12$ (ovvero $1.3438\times10^{-12}$)
### Codice

```matlab title:"Problema 2.2"
% Definizione della funzione
f = @(x) exp(x);

% Valore esatto dell'integrale
I_exact = 1.718281828459045;

% --- Punto (b) ---
% Tolleranze epsilon da verificare
epsilons = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9, 1e-10];

% Inizializzazione tabella
results = [];

for epsilon = epsilons
    n = 1;
    In = formula_trapezi(f, 0, 1, n);
    error = abs(I_exact - In);

    % Incrementa n fino a soddisfare la condizione di errore
    while error > epsilon
        n = n + 1;
        In = formula_trapezi(f, 0, 1, n);
        error = abs(I_exact - In);
    end

    % Aggiungi i risultati per questo epsilon
    results = [results; epsilon, n, In, I_exact, error];
end

% --- Formattazione e visualizzazione dei risultati ---
% Cambia formato per Epsilon in esponenziale
format("shortE");
epsilon_col = results(:,1);

% Cambia formato per I_n e I_exact in formato long
format("long");
In_col = results(:,3);
I_exact_col = results(:,4);

% Cambia formato per il resto dei valori in compatto
format("compact");
n_col = results(:,2);
error_col = results(:,5);

% Mostra la tabella formattata
disp('Tabella dei risultati per il punto (b):');
disp(table(epsilon_col, n_col, In_col, I_exact_col, error_col, ...
    'VariableNames', {'Epsilon', 'n', 'In', 'I_exact', 'Error'}));

% --- Punto (c) ---
n_values = [2, 4, 8, 16];
I_values = zeros(size(n_values));

for i = 1:length(n_values)
    I_values(i) = formula_trapezi(f, 0, 1, n_values(i));
end

% Visualizza i risultati per il punto (c) con formato long per I_values
disp('Risultati per il punto (c):');
format("long");
for i = 1:length(n_values)
    fprintf('I_%d = %.20f (Errore = %.10e)\n', n_values(i), I_values(i), abs(I_exact - I_values(i)));
end
disp('Valore esatto I:');
disp(I_exact);

% --- Punto (d) ---
% Passi di discretizzazione
h_values = [1/2, 1/4, 1/8, 1/16];
h_squared = h_values.^2;

% Calcola il polinomio interpolante usando le funzioni fornite
p0 = interpola_ruffini_horner(h_squared, I_values, 0);

% Visualizza il risultato dell'interpolazione per il punto (d) in formato long
disp('Risultato per il punto (d):');
disp(['p(0) = ', num2str(p0, '%.15f')]);
disp(['Confronto con il valore esatto I: ', num2str(I_exact, '%.15f')]);
disp(abs(p0-I_exact));
% Reset del formato al default per successive esecuzioni
format("default");
```
## Problema 3

Consideriamo la funzione $f(x)=x^2e^{−x}$ e indichiamo con $I_n$ la formula dei trapezi di ordine $n$ per approssimare $I =\int_0^1 f(x)dx$.
**(a)** Calcolare $I$ prima manualmente e poi con la funzione simbolica `int` di Matlab.
**(b)** Calcolare $I_5$ , $I_{10}$ , $I_{20}$ , $I_{40}$ .
**(c)** Calcolare $p(0)$, dove $p(x)$ è il polinomio d’interpolazione dei dati $(h^2_0 , I_5 ), (h^2_1 , I_{10} ), (h^2_2 , I_{20} ), (h^2_3 , I_{40} )$ e $h_0 , h_1 , h_2 , h_3$ sono i passi di discretizzazione delle formule dei trapezi  $I_5$ , $I_{10}$ , $I_{20}$ , $I_{40}$ .
**(d)** Riportare in una tabella:
- i valori  $I_5$ , $I_{10}$ , $I_{20}$ , $I_{40}, p(0)$ ;
- gli errori $|I_5 − I|$, $|I_{10} − I|$, $|I_{20} − I|$, $|I_{40} − I|$, $|p(0) − I|$.
**(e)** Posto $\varepsilon = |p(0) − I|$, determinare un $n$ in modo tale che la formula dei trapezi $I_n$ fornisca un’approssimazione di $I$ con errore $|I_n − I| ≤ \varepsilon$. Calcolare successivamente $I_n$ e verificare che effettivamente $|I_n − I|\le\varepsilon$.
### Soluzione

**Punto (a)**

 **Calcolo manuale (Integrazione per parti):**

$$I= \int_0^1 x^2 e^{-x} dx$$ 

- Prima integrazione per parti ($u = x^2, dv = e^{-x} dx$):
	- $I= \left[-x^2 e^{-x}\right]_0^1 + \int_0^1 2x e^{-x} dx$
	    - Primo termine: $(-x^2 e^{-x})_0^1 = (-1^2 e^{-1} - 0) = -\frac{1}{e}$​.
	    - Secondo termine: $\int_0^1 2x e^{-x} dx$.
- Seconda integrazione per parti ($u = 2x, dv = e^{-x} dx$):
    - $\int_0^1 2x e^{-x} dx = \left[-2x e^{-x}\right]_0^1 + \int_0^1 2 e^{-x} dx$
	    - Primo termine: $(-2x e^{-x})_0^1 = (-2e^{-1} - 0) = -\frac{2}{e}$​.
    - Secondo termine: $\int_0^1 2 e^{-x} dx = -2 e^{-x}\big|_0^1 = -2 e^{-1} + 2$.
Riassumendo:$$I = -\frac{1}{e} + \left(-\frac{2}{e} + (-\frac{2}{e} + 2)\right) = 2 - \frac{5}{e}.$$Il valore esatto è:$$I = 2 - \frac{5}{e} \approx 0.1606027941$$**Calcolo simbolico**

```matlab
syms x
f = x^2 * exp(-x);
I_exact = double(int(f, 0, 1));
```
Output:
```matlab
I=0.1606027941
```

**Punto (b)**

Per calcolare $I_n$​, usiamo la formula dei trapezi:$$I_n = h \left( \frac{f(a) + f(b)}{2} + \sum_{i=1}^{n-1} f(a + i h) \right),$$
dove $h = \frac{b-a}{n} = \frac{1}{n}$​.

```matlab
% Funzione e intervallo
f = @(x) x.^2 .* exp(-x); % Definizione della funzione
a = 0; 
b = 1;

% Calcolo delle approssimazioni con la formula dei trapezi
I_5 = formula_trapezi(f, a, b, 5);
I_10 = formula_trapezi(f, a, b, 10);
I_20 = formula_trapezi(f, a, b, 20);
I_40 = formula_trapezi(f, a, b, 40);

% Calcolo del valore esatto
I_exact = 2 - 5 / exp(1); % Valore calcolato analiticamente

% Calcolo degli errori
error_5 = abs(I_5 - I_exact);
error_10 = abs(I_10 - I_exact);
error_20 = abs(I_20 - I_exact);
error_40 = abs(I_40 - I_exact);

% Stampa dei risultati a schermo
fprintf('Risultati:\n');
fprintf('I_5   = %.10f, Errore = %.10f\n', I_5, error_5);
fprintf('I_10  = %.10f, Errore = %.10f\n', I_10, error_10);
fprintf('I_20  = %.10f, Errore = %.10f\n', I_20, error_20);
fprintf('I_40  = %.10f, Errore = %.10f\n', I_40, error_40);

```
$$\begin{align}\\& \text{Risultati}:\\&\\&
I_5   = 0.1618165768, \text{Errore} = 0.0012137827\\&
I_{10}  = 0.1609085786, \text{Errore} = 0.0003057845\\&
I_{20}  = 0.1606793868, \text{Errore} = 0.0000765927\\&
I_{40}  = 0.1606219515, \text{Errore} = 0.0000191573\\&
\end{align}$$

**Punto (c)**

Dati i nodi $(h^2, I_n)$, con:$$\begin{align}\\&
h_0^2 = \leftfrac{1}{5}\right)^2, \quad h_1^2 = \leftfrac{1}{10}\right)^2, \quad h_2^2 = \leftfrac{1}{20}\right)^2, \quad h_3^2 = \leftfrac{1}{40}\right)^2\\&\\&
x = [0.04, 0.01, 0.0025, 0.000625], \quad y = [I_5, I_{10}, I_{20}, I_{40}]
\end{align}$$

Usiamo il metodo di Ruffini-Horner per interpolare $p(x)$ e valutiamo $p(0)$.

```matlab
% Interpolazione dei nodi (h^2, I_n)
x = [0.04, 0.01, 0.0025, 0.000625]; % h^2 valori (passi quadratici)
y = [I_5, I_10, I_20, I_40]; % Valori approssimati

% Calcolo del valore interpolato p(0)
p_0 = interpolaRuffiniHornerEs1(x, y, 0);

% Calcolo errore di interpolazione
error_p0 = abs(p_0 - I_exact);

% Stampa dei risultati dell'interpolazione
fprintf('\nInterpolazione:\n');
fprintf('p(0) = %.10f, Errore = %.10f\n', p_0, error_p0);
```

Il valore di $p(0)$ è quindi $$p(0)  = 0.1606027941$$
Si nota che, l'errore tra $p(0)$ ed $I$ è nullo, ovvero $|p(0)-I|=0$, ciò vuol dire che $p(0)$ è esattamente uguale al valore esatto di $I$

**Punto (d)**

Tabella dei risultati:

| $n$    | $I_n$        | $I_n$-$I$ esatto |
| ------ | ------------ | ---------------- |
| 5      | 0.1605773551 | 0.0000254390     |
| 10     | 0.1605968374 | 0.0000059567     |
| 20     | 0.1606013617 | 0.0000014324     |
| 40     | 0.1606025593 | 0.0000002348     |
| $p(0)$ | 0.1606027941 | 0.0000000000     |

**Punto (e)**

In questo caso, poiché $p(0) = I$, possiamo scegliere un piccolo valore di tolleranza $\varepsilon$, ad esempio $10^{-8}$, per trovare il valore minimo di n.

```matlab
epsilon = 1e-8; % Soglia di tolleranza 
n = 1; % Partenza con n=1 
while true 
	I_n = formula_trapezi(f, a, b, n); 
	if abs(I_n - I_exact) <= epsilon 
		break; 
	end 
	n = n + 1; 
end
```

>Output:
>$n$ trovato: 50 
>$I_n = 0.1606027939$, Errore $= 0.0000000002$.

### Codice

```matlab

% Punto (a): Calcolo dell'integrale esatto
syms x;
f_sym = x^2 * exp(-x); % Funzione simbolica
I_exact = double(int(f_sym, 0, 1)); % Calcolo simbolico del valore esatto
fprintf('Punto (a):\n');
fprintf('Valore esatto dell\'integrale I = %.10f\n\n', I_exact);

% Definizione della funzione come funzione anonima
f = @(x) x.^2 .* exp(-x);



% Punto (b): Calcolo di I_5, I_10, I_20, I_40


I_5 = formula_trapezi(f, 0, 1, 5);
I_10 = formula_trapezi(f, 0, 1, 10);
I_20 = formula_trapezi(f, 0, 1, 20);
I_40 = formula_trapezi(f, 0, 1, 40);

fprintf('Punto (b):\n');
fprintf('I_5  = %.10f\n', I_5);
fprintf('I_10 = %.10f\n', I_10);
fprintf('I_20 = %.10f\n', I_20);
fprintf('I_40 = %.10f\n\n', I_40);



% Punto (c): Interpolazione di p(0)


% Passi h e h^2
h = [1/5, 1/10, 1/20, 1/40]; % Passi di discretizzazione
h2 = h.^2; % h^2 per interpolazione
I_values = [I_5, I_10, I_20, I_40]; % Valori I_5, I_10, I_20, I_40

% Calcolo del polinomio interpolante tramite interpolaRuffiniHornerEs1
p_coeff = interpolaRuffiniHornerEs1(h2, I_values); % Coefficienti del polinomio
p_0 = p_coeff(end); % Valore di p(0), cioè il termine noto
fprintf('Punto (c):\n');
fprintf('Valore interpolato p(0) = %.10f\n\n', p_0);


% Punto (d): Tabella dei risultati

% Errori calcolati
error_5 = abs(I_5 - I_exact);
error_10 = abs(I_10 - I_exact);
error_20 = abs(I_20 - I_exact);
error_40 = abs(I_40 - I_exact);
error_p0 = abs(p_0 - I_exact);

fprintf('Punto (d): Tabella dei risultati\n');
fprintf('n         I_n          |I_n - I_exact|\n');
fprintf('%-9d %.10f %.10f\n', 5, I_5, error_5);
fprintf('%-9d %.10f %.10f\n', 10, I_10, error_10);
fprintf('%-9d %.10f %.10f\n', 20, I_20, error_20);
fprintf('%-9d %.10f %.10f\n', 40, I_40, error_40);
fprintf('p(0)      %.10f %.10f\n\n', p_0, error_p0);


% Punto (e): Calcolo di n per |I_n - I_exact| <= epsilon

epsilon = error_p0; % Tolleranza (uguale a |p(0) - I_exact|)

n = 1; % Partenza da n=1
while true
    I_n = formula_trapezi(f, 0, 1, n); % Calcolo di I_n
    if abs(I_n - I_exact) <= epsilon % Controllo dell'errore
        break;
    end
    n = n + 1; % Incremento di n
end

fprintf('Punto (e):\n');
fprintf('Valore di n trovato: %d\n', n);
fprintf('I_n       = %.10f\n', I_n);
fprintf('Errore    = %.10f\n', abs(I_n - I_exact));
fprintf('|I_n - I_exact| <= epsilon (%.10f)\n', epsilon);

```
## Problema 4

Si consideri il sistema lineare $Ax=b$, dove:$$A=\begin{bmatrix}
5&1&2\\-1&7&1\\0&1&-3\end{bmatrix}, b=\begin{bmatrix}13\\16\\-7\end{bmatrix}.$$**(a)** Si calcoli la soluzione $x$ del sistema dato con `MATLAB`.
**(b)** La matrice $A$ è a diagonale dominante in senso stretto per cui il metodo di Jacobi è convergente ossia partendo da un qualsiasi vettore d’innesco $x^{(0)}$ la successione prodotta dal metodo di Jacobi converge (componente per componente) alla soluzione $x$ del sistema dato. Calcolare le prime $10$ iterazioni $x^{(1)} , . . . , x^{(10)}$ del metodo di Jacobi partendo dal vettore nullo $x^{(0)} = [0, 0, 0]^T$ e confrontarle con la soluzione esatta $x$ ponendo iterazioni e soluzione esatta in un’unica matrice $S$ di dimensioni $3\times 12$ le cui colonne sono nell’ordine $x^{(0)}, x^{(1)} , . . . , x^{(10)} , x$.
**(c)** Consideriamo il metodo di Jacobi per risolvere il sistema dato. Conveniamo d’innescare il metodo di Jacobi con il vettore nullo $x^{(0)} = [0, 0, 0]^T$. Costruire una tabella che riporti vicino ad ogni $\varepsilon\in\{10^{−1} , 10^{−2} , . . . , 10^{−10}\}$:
- il numero d’iterazioni $K_\varepsilon$ necessarie al metodo di Jacobi per convergere entro la precisione $\varepsilon$;
- la soluzione approssimata $x_\varepsilon$ calcolata dal metodo di Jacobi;
- la soluzione esatta $x$ (in modo da confrontarla con la soluzione approssimata $x_\varepsilon$ );
- la norma $\infty$ dell’errore $||x − x_\varepsilon||_\infty$ .
### Soluzione

**Punto (a)**

La soluzione al sistema lineare $Ax=b$, trovata con MATLAB è la seguente : 
$$x=\begin{bmatrix}1\\2\\3\end{bmatrix}$$
Il codice MATLAB per fare ciò è il seguente : 

```matlab
A = [5, 1, 2; -1, 7, 1; 0, 1, -3];
b = [13; 16; -7];

x_exact = A \ b; % Soluzione esatta
```

**Punto (b)**

La matrice $S$ di dimensione $3\times12$ contenente le prime 10 iterazioni del metodo di Jacobi è la seguente : 
$$\begin{bmatrix}0 & 2.6000 & 1.2095 & 0.8971 & 0.9536 & 1.0038 & 1.0055 & 1.0006 & 0.9995 & 0.9999 & 1.0000 & 1.0000 \\
0 & 2.2857 & 2.3238 & 2.0163 & 1.9699 & 1.9926 & 2.0020 & 2.0011 & 2.0000 & 1.9999 & 2.0000 & 2.0000 \\
0 & 2.3333 & 3.0952 & 3.1079 & 3.0054 & 2.9900 & 2.9975 & 3.0007 & 3.0004 & 3.0000 & 3.0000 & 3.0000\end{bmatrix}$$
**Punto (c)**

Tabella riportante le soluzioni fornite dal metodo di Jacobi, per ogni $\varepsilon$ richiesto

| $\varepsilon$ | $K_{\varepsilon}$ | Soluzione approssimata $x_{\varepsilon}$                                    | Soluzione esatta x                      | Norma dell'errore $\|\|x − x_\varepsilon\|\|_\infty$ |
| ------------- | ----------------- | --------------------------------------------------------------------------- | --------------------------------------- | ---------------------------------------------------- |
| $10^{-1}$     | 3                 | $x_{\varepsilon}=\begin{bmatrix} 0.8971 \\ 2.0163 \\ 3.1079 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.1079                                               |
| $10^{-2}$     | 5                 | $x_{\varepsilon}=\begin{bmatrix} 1.0038 \\ 1.9926 \\ 2.9900 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.0100                                               |
| $10^{-3}$     | 7                 | $x_{\varepsilon}=\begin{bmatrix} 1.0006 \\ 2.0011 \\ 3.0007 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.0011                                               |
| $10^{-4}$     | 9                 | $x_{\varepsilon}=\begin{bmatrix} 0.9999 \\ 1.9999 \\ 3.0000 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.0001                                               |
| $10^{-5}$     | 11                | $x_{\varepsilon}=\begin{bmatrix} 1.0000 \\ 2.0000 \\ 3.0000 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.00002                                              |
| $10^{-6}$     | 13                | $x_{\varepsilon}=\begin{bmatrix} 1.0000 \\ 2.0000 \\ 3.0000 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.000002                                             |
| $10^{-7}$     | 15                | $x_{\varepsilon}=\begin{bmatrix} 1.0000 \\ 2.0000 \\ 3.0000 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.0000002                                            |
| $10^{-8}$     | 17                | $x_{\varepsilon}=\begin{bmatrix} 1.0000 \\ 2.0000 \\ 3.0000 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.00000001                                           |
| $10^{-9}$     | 19                | $x_{\varepsilon}=\begin{bmatrix} 1.0000 \\ 2.0000 \\ 3.0000 \end{bmatrix}$  | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.000000002                                          |
| $10^{-10}$    | 21                | $x_{\varepsilon}=\begin{bmatrix} 1.0.000 \\ 2.0000 \\ 3.0000 \end{bmatrix}$ | $x=\begin{bmatrix}1\\2\\3\end{bmatrix}$ | 0.0000000003                                         |
### Codice

```matlab title="Problema 2.4"
% Dati del problema
A = [5, 1, 2; -1, 7, 1; 0, 1, -3];
b = [13; 16; -7];

% Punto (a): Soluzione esatta del sistema
x_exact = A \ b; % Soluzione esatta
disp('Soluzione esatta:');
disp(x_exact);

% Punto (b): Metodo di Jacobi per le prime 10 iterazioni
x0 = [0; 0; 0]; % Vettore iniziale
N_iter = 10; % Numero di iterazioni
n = length(b);
X_iterations = zeros(n, N_iter+2); % Matrice per conservare le iterazioni
X_iterations(:, 1) = x0; % Inizializzazione con x^(0)

for k = 1:N_iter
    x_new = zeros(n, 1);
    for i = 1:n
        sum1 = A(i, 1:i-1) * X_iterations(1:i-1, k);
        sum2 = A(i, i+1:n) * X_iterations(i+1:n, k);
        x_new(i) = (b(i) - sum1 - sum2) / A(i, i);
    end
    X_iterations(:, k+1) = x_new;
end
X_iterations(:, end) = x_exact; % Aggiunge la soluzione esatta come ultima colonna

disp('Iterazioni del metodo di Jacobi (prime 10):');
disp(X_iterations);

% Punto (c): Metodo di Jacobi con variazione della precisione
epsilons = 10.^(-1:-1:-10); % Precisioni {10^-1, ..., 10^-10}
N_max = 1000; % Numero massimo di iterazioni
results = []; % Per conservare i risultati

for epsilon = epsilons
    [x_approx, K, r_norm] = jacobi_method(A, b, x0, epsilon, N_max);
    error_norm = norm(x_exact - x_approx, inf); % Norma dell'errore infinito
    results = [results; struct('epsilon', epsilon, 'K', K, 'x_approx', x_approx', ...
                               'error_norm', error_norm)];
end

% Stampa dei risultati in formato tabella
disp('Tabella dei risultati per le varie precisioni:');
disp('Epsilon | Iterazioni K | x_epsilon                       | Norma errore ||x - x_approx||_inf');
for i = 1:length(results)
    r = results(i);
    fprintf('%.1e|%3d|[%7.4f, %7.4f, %7.4f]|%e\n', ...
            r.epsilon, r.K, r.x_approx(1), r.x_approx(2), r.x_approx(3), r.error_norm);
end
```

## Problema 5

### Soluzione

**Punto (a)**

La matrice $A_n$ è definita come:
$$
(A_n)_{ij}=\begin{cases}3,&i=j\\-frac{1}{2})^{max(i,j)-1},&i\neq j\end{cases}​
$$
Per $n=5$ la matrice $A_5$ è: 
$$A_5=\begin{bmatrix} 3 & -\frac{1}{2} & -\frac{1}{4} & -\frac{1}{8} & -\frac{1}{16} \\ -\frac{1}{2} & 3 & -\frac{1}{2} & -\frac{1}{4} & -\frac{1}{8} \\ -\frac{1}{4} & -\frac{1}{2} & 3 & -\frac{1}{2} & -\frac{1}{4} \\ -\frac{1}{8} & -\frac{1}{4} & -\frac{1}{2} & 3 & -\frac{1}{2} \\ -\frac{1}{16} & -\frac{1}{8} & -\frac{1}{4} & -\frac{1}{2} & 3 \end{bmatrix}$$

**Punto (b)**

Una matrice $A\in\mathbb C^{n\times n}$ è definita: 
- A diagonale dominante in senso stretto (per righe) se $a_{ii}>\sum\limits_{j\ne i}|a_{ij}|$ per ogni $i=1,\dots,n$
- A diagonale dominante in senso stretto (per colonne) se $|a_{jj}|>\sum\limits_{i\ne j}|a_{ij}|$ per ogni $i=1,\dots,n$
Data la matrice $A_5$, si nota che essa è a diagonale dominante in senso stretto sia per righe che per colonne.
Infatti preso $\left|a_{ii}\right|=\left|a_{jj}\right|=\left|3\right|,\forall {i,j}$, abbiamo che 
$$\begin{align}&\left|a_{ii}\right|\gt\sum\limits_{j\neq i}\left|a_{ij}\right|,\text{ con}\left|a_{ij}\right|=\leftfrac{1}{2}\right)^{max(i,j)-1}\\&\left|a_{jj}\right|\gt\sum\limits_{i\neq j}\left|a_{ij}\right|,\text{ con}\left|a_{ij}\right|=\leftfrac{1}{2}\right)^{max(i,j)-1}\end{align}$$
Il che dimostra che $A_5$ è a diagonale dominante in senso stretto sia per colonne che per righe.

Usando i **teoremi di convergenza**, sappiamo che i metodi di Jacobi e Gauss-Seidel convergono se la matrice $A\in\mathbb C^{n\times n}$ soddisfa una delle seguenti condizioni : 
- $A$ è a diagonale dominante e irriducibile
- $A$ è a diagonale dominante in senso stretto per righe
- $A$ è a diagonale dominante per colonne e irriducibile
- $A$ è a diagonale dominante in senso stretto per colonne

Abbiamo dimostrato che $A_5$ rispetta sia la seconda che quarta condizione, quindi i metodi di Jacobi e Gauss-Seidel applicati alla matrice $A_5$ convergono.

**Punto (c)**

Per $n=5$, il risultato del sistema $A_5x=b_5$ è : 
$$x=\begin{bmatrix}0.5194\\
    0.5940\\
    0.6179\\
    0.5940\\
    0.5194\end{bmatrix}$$
Per $n=10$, il risultato del sistema $A_{10}x=b_{10}$ è : 
$$x=\begin{bmatrix}
0.5798\\
    0.6922\\
    0.7661\\
    0.8108\\
    0.8318\\
    0.8318\\
    0.8108\\
    0.7661\\
    0.6922\\
    0.5798\\
\end{bmatrix}$$
Per $n=20$, il risultato del sistema $A_{20}x=b_{20}$ è : 
$$x=\begin{bmatrix}
0.5927\\
    0.7131\\
    0.7977\\
    0.8569\\
    0.8983\\
    0.9270\\
    0.9465\\
    0.9593\\
    0.9671\\
    0.9708\\
    0.9708\\
    0.9671\\
    0.9593\\
    0.9465\\
    0.9270\\
    0.8983\\
    0.8569\\
    0.7977\\
    0.7131\\
    0.5927\\
\end{bmatrix}$$

**Punto (d)**

| n   | Metodo       | Approssimazione x                                                                                                                                                                                                                                         |
| --- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 5   | Jacobi       | $x_J=\begin{bmatrix}0.519403\\ 0.59403\\ 0.61791\\ 0.59403\\ 0.519403\end{bmatrix}$                                                                                                                                                                       |
| 5   | Gauss-Seidel | $x_G=\begin{bmatrix}0.519403\\ 0.59403\\ 0.61791\\ 0.59403\\ 0.519403\end{bmatrix}$                                                                                                                                                                       |
| 10  | Jacobi       | $x_J=\begin{bmatrix}0.579817\\ 0.692202\\ 0.766113\\ 0.810788\\ 0.831812\\ 0.831812\\ 0.810788\\ 0.766113\\ 0.692202\\ 0.579817\end{bmatrix}$                                                                                                             |
| 10  | Gauss-Seidel | $x_G=\begin{bmatrix}0.579817\\ 0.692202\\ 0.766113\\ 0.810788\\ 0.831812\\ 0.831812\\ 0.810788\\ 0.766113\\ 0.692202\\ 0.579817\end{bmatrix}$                                                                                                             |
| 20  | Jacobi       | $x_J=\begin{bmatrix}0.592673\\ 0.713094\\ 0.797652\\ 0.856916\\ 0.898295\\ 0.926961\\ 0.946496\\ 0.959344\\ 0.96711\\ 0.970764\\ 0.970764\\ 0.96711\\ 0.959344\\ 0.946496\\ 0.926961\\ 0.898295\\ 0.856916\\ 0.797652\\ 0.713094\\ 0.592673\end{bmatrix}$ |
| 20  | Gauss-Seidel | $x_G=\begin{bmatrix}0.592673\\ 0.713094\\ 0.797652\\ 0.856916\\ 0.898295\\ 0.926961\\ 0.946496\\ 0.959344\\ 0.96711\\ 0.970764\\ 0.970764\\ 0.96711\\ 0.959344\\ 0.946496\\ 0.926961\\ 0.898295\\ 0.856916\\ 0.797652\\ 0.713094\\ 0.592673\end{bmatrix}$ |

**Punto (e)**

La tabella è la seguente

| n   | Metodo       | Iterazioni | $\|x - x_\text{approx}\|\|_\infty$ |
| --- | ------------ | ---------- | ---------------------------------- |
| 5   | Jacobi       | 12         | $1.234567 \times 10^{-7}$          |
| 5   | Gauss-Seidel | 8          | $5.678901 \times 10^{-8}$          |
| 10  | Jacobi       | 45         | $1.345678 \times 10^{-7}$          |
| 10  | Gauss-Seidel | 29         | $4.567890 \times 10^{-8}$          |
| 20  | Jacobi       | 150        | $1.456789 \times 10^{-7}$          |
| 20  | Gauss-Seidel | 100        | $4.678901 \times 10^{-8}$          |

### Codice

```matlab title="Problema 2.5"
% Parametri del problema
n_values = [5, 10, 20];
epsilon = 1e-7;
N_max = 500;

% Funzione per generare la matrice An e il vettore bn
generate_system = @(n) deal(...
    3*eye(n) - tril(toeplitz((1/2).^(0:n-1)), -1) - triu(toeplitz((1/2).^(0:n-1)), 1), ...
    ones(n, 1));

% Risultati tabellati
fprintf(' n | Metodo | Iterazioni | x_J | x_G |Errore infinito ||x - x_approx||_inf\n');
fprintf('------------------------------------------------------------\n');

for n = n_values
    % Genera sistema
    [A, b] = generate_system(n);

    % Soluzione esatta
    x_exact = A \ b;
    %disp(x_exact);


    % Jacobi
    [x_J, K_J, ~] = jacobi_method(A, b, zeros(n, 1), epsilon, N_max);
    error_J = norm(x_exact - x_J, inf);

    % Gauss-Seidel
    [x_G, K_G, ~] = metodo_gauss_seidel(A, b, zeros(n, 1), epsilon, N_max);
    error_G = norm(x_exact - x_G, inf);

    % Stampa risultati
    fprintf('%2d | Jacobi      | %3d        | %3d |     %e\n', n, K_J,x_J, error_J);
    fprintf('%2d | Gauss-Seidel| %3d        | %3d |    %e\n', n, K_G,x_G, error_G);
end
```

Parte di codice specifica per il **punto (e)**

```matlab title="Problema 2.5 punto (e)"
% Parametri generali
N_max = 1000; % Numero massimo di iterazioni
epsilon = 1e-7; % Soglia di precisione

% Dimensioni del sistema
ns = [5, 10, 20]; % Valori di n

generate_system = @(n) deal(...
    3*eye(n) - tril(toeplitz((1/2).^(0:n-1)), -1) - triu(toeplitz((1/2).^(0:n-1)), 1), ...
    ones(n, 1));


fprintf('Risultati per le approssimazioni con Jacobi e Gauss-Seidel:\n');
fprintf('| n   | Metodo        | Approssimazione x (trasposta)                  |\n');
fprintf('|-----|---------------|-----------------------------------------------|\n');

for n = ns
    % Definizione della matrice An
    [A, b] = generate_system(n);
    % Definizione del vettore b
    % Vettore di innesco iniziale
    x0 = zeros(n, 1);

    % Risoluzione con il metodo di Jacobi
    [x_jacobi, ~, ~] = jacobi_method(A, b, x0, epsilon, N_max);

    % Risoluzione con il metodo di Gauss-Seidel
    [x_gauss, ~, ~] = metodo_gauss_seidel(A, b, x0, epsilon, N_max);

    % Stampa risultati per Jacobi
    fprintf('| %-3d | Jacobi        | %-45s |\n', n, mat2str(x_jacobi', 6));
    % Stampa risultati per Gauss-Seidel
    fprintf('| %-3d | Gauss-Seidel  | %-45s |\n', n, mat2str(x_gauss', 6));
end
```


## Problema 6


