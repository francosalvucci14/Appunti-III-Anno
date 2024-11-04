% Script per risolvere il problema 2.2 con il metodo di Ruffini-Horner
addpath '/home/acronimo/Lezioni Tor Vergata/3 anno/Calcolo Numerico/Esercizi/EserciziCreditiD/Esercizio1';
% Definizione della funzione f(x) = e^x
f = @(x) exp(x);

% Intervallo di integrazione [0, 1]
a = 0;
b = 1;

% Valore esatto dell'integrale
I_exact = exp(1) - 1;

% Precisioni richieste
epsilons = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9, 1e-10];

% Inizializza le variabili per la tabella dei risultati
results = []; % tabella dei risultati

fprintf("Punto (a)\n");

% Passo (a) e (b): Trova n(epsilon) per ogni epsilon e costruisci la tabella
for eps = epsilons
    n = 1;
    In = formula_trapezi(f, a, b, n);
    error = abs(I_exact - In);
    
    % Incrementa n finché l'errore non è inferiore a epsilon
    while error > eps
        n = n + 1;
        In = formula_trapezi(f, a, b, n);
        error = abs(I_exact - In);
        
        % Debug: stampa ogni volta che In viene aggiornato
        %fprintf('Calcolo per eps = %.1e: n = %d, In = %.10f, error = %.10e\n', eps, n, In, error);
    end
    
    % Salva i risultati in una tabella
    results = [results; eps, n, In, I_exact, error];
    %disp(array2table(results, 'VariableNames', {'Epsilon', 'n', 'In', 'I_exact', 'Error'}));
    % Stampa i risultati per questo epsilon
    fprintf('%.1e\t %d\t %.10f\t %.10f\t %.10e\n', eps, n, In, I_exact, error);
end

% Visualizza la tabella dei risultati
fprintf("Punto (b)\n");
disp('Tabella dei risultati:');
disp(array2table(results, 'VariableNames', {'Epsilon', 'n', 'In', 'I_exact', 'Error'}));

% Passo (c): Calcolo di I_2, I_4, I_8, I_16 e confronto con I_exact
fprintf("Punto (c)\n");
n_values = [2, 4, 8, 16];
In_values = zeros(size(n_values));
for i = 1:length(n_values)
    n = n_values(i);
    In_values(i) = formula_trapezi(f, a, b, n);
    fprintf('I_%d = %.10f (Errore = %.10e)\n', n, In_values(i), abs(I_exact - In_values(i)));
end

% Passo (d): Calcolo del polinomio interpolante usando il metodo di Ruffini-Horner
% Usa i valori h^2 come nodi e gli I_n calcolati come valori corrispondenti
fprintf("Punto (d)\n");
h_values = 1 ./ n_values;
t = 0;  % Punto in cui vogliamo valutare il polinomio interpolante
p0 = interpola_ruffini_horner(h_values.^2,In_values, t);

fprintf('\nPolinomio interpolante p(0) = %.10f\n', p0);
fprintf('Errore tra p(0) e I_exact = %.10e\n', abs(I_exact - p0));

