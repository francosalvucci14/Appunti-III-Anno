function p0 = estrapol(f, a, b, n_vect,cifre)
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

    % addpath server per caricare le funzioni di Esercizio1 e Esercizio2 usate sotto
    %addpath('path/to/Esercizio1/');
    %addpath('path/to/Esercizio2/');

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

    % Se viene specificato il numero di cifre, usa vpa per ottenere precisione
    if nargin > 4
        p0 = vpa(p0, cifre);  % Calcola p0 con precisione specificata
    end

end
