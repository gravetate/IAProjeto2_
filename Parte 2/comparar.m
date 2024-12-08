clear; clc; close all;

% Número de execuções independentes para análise estatística
num_runs = 20;

% Espaço de procura
search_space = [0, 1.6];

% Parâmetros do Hill Climbing (com reinícios)
max_iterations_hc = 300;
num_restarts = 10;
restart_threshold = 0.02 * (search_space(2) - search_space(1));

% Parâmetros do Simulated Annealing
T_initial = 1.0;
T_final = 1e-6;
alfa = 0.99;
nRep = 100;

% Contador global de avaliações da função
global func_eval_count;
func_eval_count = 0; 

% Definição da função base (f)
% Nota: f_wrapper deverá ser uma função auxiliar que incrementa o contador global
base_f = @(x) 4 * (sin(5 * pi * x + 0.5).^6) .* exp(log2((x - 0.8).^2));
f = @(x) f_wrapper(x, base_f);

% Matrizes para armazenar resultados: [f(x), x, avaliações]
hc_results = zeros(num_runs, 3);
sa_results = zeros(num_runs, 3);

% Loop principal para executar múltiplas vezes e obter estatísticas
for i = 1:num_runs
    % Hill Climbing com reinícios
    func_eval_count = 0;
    [best_hc_x, best_hc_f, ~] = hill_climbing_with_restarts(f, search_space, max_iterations_hc, num_restarts, restart_threshold);
    hc_eval_count = func_eval_count;
    
    % Simulated Annealing
    func_eval_count = 0;
    [best_sa_x, best_sa_f, ~, ~] = simulated_annealing(f, search_space, T_initial, T_final, alfa, nRep);
    sa_eval_count = func_eval_count;
    
    hc_results(i,:) = [best_hc_f, best_hc_x, hc_eval_count];
    sa_results(i,:) = [best_sa_f, best_sa_x, sa_eval_count];
end

% Cálculo das estatísticas do Hill Climbing
hc_mean = mean(hc_results(:,1));
hc_std = std(hc_results(:,1));
hc_best = max(hc_results(:,1));
hc_worst = min(hc_results(:,1));
hc_mean_eval = mean(hc_results(:,3));

% Cálculo das estatísticas do Simulated Annealing
sa_mean = mean(sa_results(:,1));
sa_std = std(sa_results(:,1));
sa_best = max(sa_results(:,1));
sa_worst = min(sa_results(:,1));
sa_mean_eval = mean(sa_results(:,3));

% Impressão dos resultados no ecrã
fprintf('----------------------------------------\n');
fprintf('Estatísticas após %d execuções:\n\n', num_runs);

fprintf('Hill Climbing:\n');
fprintf('  Melhor f(x): %.6f\n', hc_best);
fprintf('  Pior f(x): %.6f\n', hc_worst);
fprintf('  Média f(x): %.6f\n', hc_mean);
fprintf('  Desvio-padrão f(x): %.6f\n', hc_std);
fprintf('  Média de avaliações da função: %.2f\n', hc_mean_eval);

fprintf('\nSimulated Annealing:\n');
fprintf('  Melhor f(x): %.6f\n', sa_best);
fprintf('  Pior f(x): %.6f\n', sa_worst);
fprintf('  Média f(x): %.6f\n', sa_mean);
fprintf('  Desvio-padrão f(x): %.6f\n', sa_std);
fprintf('  Média de avaliações da função: %.2f\n', sa_mean_eval);

% Geração de valores para plotagem da função base
x_vals = linspace(search_space(1), search_space(2), 1000);
f_vals = arrayfun(base_f, x_vals);

% Localizar as melhores execuções individuais
[~, hc_best_idx] = max(hc_results(:,1));
hc_best_x = hc_results(hc_best_idx,2);
hc_best_f = hc_results(hc_best_idx,1);

[~, sa_best_idx] = max(sa_results(:,1));
sa_best_x = sa_results(sa_best_idx,2);
sa_best_f = sa_results(sa_best_idx,1);

% Gráfico da função e dos melhores resultados
figure;
plot(x_vals, f_vals, 'b-', 'LineWidth', 1.5);
hold on;

phc = plot(hc_best_x, hc_best_f, 'r^', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
psa = plot(sa_best_x, sa_best_f, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

title('Comparação de Otimização (Melhor Execução Encontrada)');
xlabel('x'); ylabel('f(x)');
legend([phc, psa], 'Hill Climbing (melhor run)', 'Simulated Annealing (melhor run)', 'Location', 'Best');
grid on;

text(hc_best_x, hc_best_f, sprintf('HC max: %.4f', hc_best_f), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
text(sa_best_x, sa_best_f, sprintf('SA max: %.4f', sa_best_f), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');

% Histogramas das distribuições dos resultados
figure;
subplot(1,2,1);
histogram(hc_results(:,1), 10);
title('Hill Climbing: Distribuição de f(x)');
xlabel('f(x)'); ylabel('Frequência');
grid on;

subplot(1,2,2);
histogram(sa_results(:,1), 10);
title('Simulated Annealing: Distribuição de f(x)');
xlabel('f(x)'); ylabel('Frequência');
grid on;
