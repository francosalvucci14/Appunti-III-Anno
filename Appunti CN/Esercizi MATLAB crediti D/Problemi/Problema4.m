% Script per risolvere il sistema lineare Ax = b utilizzando il metodo di Jacobi

% Dati del problema
A = [5, 1, 2; -1, 7, 1; 0, 1, -3];
b = [13; 16; -7];

% Punto (a): Soluzione esatta del sistema utilizzando il backslash (\)
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
X_iterations(:, end) = x_exact; % Aggiungi la soluzione esatta come ultima colonna

disp('Iterazioni del metodo di Jacobi (prime 10):');
disp(X_iterations);

% Punto (c): Metodo di Jacobi con variazione della precisione
epsilons = 10.^(-1:-1:-10); % Precisioni {10^-1, ..., 10^-10}
N_max = 1000; % Numero massimo di iterazioni
results = []; % Per conservare i risultati
% 
% for epsilon = epsilons
%     [x_approx, K, r_norm] = jacobi_method(A, b, x0, epsilon, N_max);
%     error_norm = norm(x_exact - x_approx, inf); % Norma dell'errore infinito
%     results = [results; epsilon, K, x_approx,error_norm];
% end
% 
% disp('Tabella dei risultati per le varie precisioni:');
% disp('Epsilon | Iterazioni K | Norma errore ||x - x_approx||_inf');
% disp(results);

% Tabella dei risultati con aggiunta di x_epsilon
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
    fprintf('%.1e | %3d           | [%7.4f, %7.4f, %7.4f]        | %e\n', ...
            r.epsilon, r.K, r.x_approx(1), r.x_approx(2), r.x_approx(3), r.error_norm);
end


% % Funzione per il metodo di Jacobi
% function [x, K, r_norm] = jacobi_method(A, b, x0, epsilon, N_max)
%     n = length(b); % Dimensione del sistema
%     x = x0; % Soluzione iniziale
%     for K = 1:N_max
%         x_new = zeros(n, 1);
%         for i = 1:n
%             sum1 = A(i, 1:i-1) * x(1:i-1);
%             sum2 = A(i, i+1:n) * x(i+1:n);
%             x_new(i) = (b(i) - sum1 - sum2) / A(i, i);
%         end
%         r = b - A * x_new; % Residuo
%         r_norm = norm(r, 2); % Norma 2 del residuo
%         if r_norm <= epsilon * norm(b, 2)
%             x = x_new;
%             return;
%         end
%         x = x_new;
%     end
% end
