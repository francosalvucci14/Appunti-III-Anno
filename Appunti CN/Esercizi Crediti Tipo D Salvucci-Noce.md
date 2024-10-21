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

Il primo esercizio chiede di scrivere in MATLAB una function che calcoli l'algoritmo di **Ruffini-Horner** per la valutazione del polinomio d'interpolazione in un punto
### Codice Esercizio 1

Il codice del primo esericizio è  il seguente: ^[Codice Interpolazione con Ruffini-Horner ]

```matlab
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

Il secondo esercizio chiede di scrivere una function MATLAB per implementare la **formula dei trapezi** di una data funzione presa in input.
### Codice Esercizio 2

```matlab
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

Il terzo esercizio chiede di scrivere una function MATLAB per implementare il **metodo di estrapolazione** di una data funzione presa in input.
Chiede anche di usare le function MATLAB usate per risolvere gli esercizi 1 e 2

## Codice Esercizio 3 

Il codice è il seguente:

```matlab
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

end
```

### Spiegazione del codice

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
## Esercizio 4

L'esercizio cheide di creare una function MATLAB per implementare il **metodo di Jacobi**.
## Codice Esercizo 4

Il codice è il seguente

```matlab
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
## Spiegazione del codice

### Descrizione del codice:

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

L'esercizio cheide di creare una function MATLAB per implementare il **metodo di Gauss-Sidel**.
## Codice Esercizio 5

Il codice è il seguente

```matlab
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

## Spiegazione Codice

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

## Codice

## Spiegazione


# Problemi

## Problema 1
## Problema 2
## Problema 3
## Problema 4
## Problema 5
## Problema 6

# Appendice dei programmi


