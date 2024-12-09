addpath '/home/acronimo/Lezioni Tor Vergata/3 anno/Calcolo Numerico/Esercizi/EserciziCreditiD/Esercizio4';

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
