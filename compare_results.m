% Definição da função objetivo
f = @(x) 4 * (sin(5 * pi * x + 0.5)^6) * exp(log((x - 0.8)^2)^2);

% Parâmetros
n_tests = 300;
max_distance = 0.02;
x_min = 0;
x_max = 1.6;
T = 1;
alpha = 0.99;
nRep = 100;

% Hill Climbing
disp('--- Hill Climbing ---');
[hc_best_result, hc_best_x, hc_time] = main_hill_climbing(f, n_tests, x_min, x_max, max_distance);

% Simulated Annealing
disp('--- Simulated Annealing ---');
[sa_best_result, sa_best_x, sa_time] = main_simulated_annealing(f, T, alpha, nRep, x_min, x_max, max_distance);

% Comparação de Resultados
disp('--- Comparação de Resultados ---');
fprintf('Hill Climbing: Melhor Resultado = %.4f, Tempo = %.4f segundos\n', hc_best_result, hc_time);
fprintf('Simulated Annealing: Melhor Resultado = %.4f, Tempo = %.4f segundos\n', sa_best_result, sa_time);

% Gráficos
x = linspace(0, 1.6, 1000);
y = arrayfun(f, x);
y = min(y, prctile(y, 99)); % Normalização baseada no percentil

figure;
plot(x, y, 'b-', 'LineWidth', 1.5); % Função
hold on;
plot(hc_best_x, hc_best_result, 'ro', 'MarkerSize', 8, 'DisplayName', 'Hill Climbing');
plot(sa_best_x, sa_best_result, 'go', 'MarkerSize', 8, 'DisplayName', 'Simulated Annealing');
title('Resultados dos Algoritmos de Otimização');
xlabel('x');
ylabel('f(x)');
legend({'Função', 'Hill Climbing', 'Simulated Annealing'}, 'Location', 'Best');
grid on;

figure;
bar([hc_time, sa_time]);
set(gca, 'XTickLabel', {'Hill Climbing', 'Simulated Annealing'});
title('Tempo de Execução dos Algoritmos');
ylabel('Tempo (s)');
grid on;
