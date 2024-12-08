clc;             % Limpa a janela de comando
clear all;       % Limpa todas as variáveis do workspace

% Escolher o conjunto de cidades
% Caso pretenda 14 cidades no norte de Portugal:
% pt_nt;        % Carrega as 14 cidades
% set_id = 1;   % Ajuste do set_id para melhor plotagem

% Caso pretenda outro conjunto, basta comentar/descomentar as linhas acima/abaixo
% pt_nt_sul_20; set_id = 2;  % 20 cidades
pt_nt_sul_30; set_id = 2;  % 30 cidades

num_cities = length(cities);

% Parâmetros do Simulated Annealing
T_initial = 1000; 
T_final = 1e-3;
alfa = 0.99;
nRep = 100;

% Regista o tempo de início da optimização
tic;

% Executa o Simulated Annealing para o TSP
[best_solution, best_cost, history_cost] = simulated_annealing_tsp(cities, T_initial, T_final, alfa, nRep);

% Regista o tempo total de execução
exec_time = toc;

% Cálculo da rota final e distância total
best_route_cities = cities(:, best_solution);
dist_best = distance_24(best_route_cities);

% Custo inicial (primeira iteração do histórico)
initial_cost = history_cost(1);
final_cost = best_cost;
percent_reduction = ((initial_cost - final_cost) / initial_cost) * 100;

% Plot da rota final em coordenadas simples
figure;
plotcities_2024(best_route_cities, set_id);
axis auto;
title('Rota Final Encontrada pelo Simulated Annealing');
xlabel('Longitude');
ylabel('Latitude');
grid on;

% Plot da rota no mapa geográfico
figure;
geoplot(best_route_cities(1,:), best_route_cities(2,:), '-o', 'MarkerFaceColor', 'r', 'LineWidth', 1.5);
geobasemap('satellite');
title('Rota sobre o mapa de Portugal');

% Apresentação dos resultados no ecrã
fprintf('\n=============== RESULTADOS DO SIMULATED ANNEALING ===============\n');
fprintf('Número de cidades visitadas: %d\n', num_cities);
fprintf('Distância total da melhor rota: %4.2f Km\n', dist_best);
fprintf('Custo inicial: %4.2f\n', initial_cost);
fprintf('Custo final (melhor encontrado): %4.2f\n', final_cost);
fprintf('Redução percentual do custo: %4.2f %%\n', percent_reduction);
fprintf('Temperatura inicial: %g\n', T_initial);
fprintf('Temperatura final: %g\n', T_final);
fprintf('Factor de arrefecimento (alfa): %g\n', alfa);
fprintf('Número de repetições por temperatura: %d\n', nRep);
fprintf('Tempo total de execução: %4.2f segundos\n', exec_time);
fprintf('=================================================================\n\n');

% Gráfico da evolução do custo durante a execução do SA
figure;
plot(history_cost, 'LineWidth', 1.5);
xlabel('Iterações');
ylabel('Custo da Solução');
title('Evolução do Custo no Simulated Annealing para o TSP');
grid on;

% Estatísticas sobre o histórico do custo
[~, idx_best] = min(history_cost);
fprintf('Iteração da melhor solução encontrada: %d\n', idx_best);
fprintf('Custo médio ao longo das iterações: %4.2f\n', mean(history_cost));
fprintf('Custo máximo ao longo das iterações: %4.2f\n', max(history_cost));
fprintf('Custo mínimo ao longo das iterações: %4.2f\n\n', min(history_cost));

% Destaque da melhor solução no gráfico do histórico de custos
figure;
hold on;
plot(history_cost, 'b-', 'LineWidth', 1.5);
plot(idx_best, best_cost, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
title('Evolução do Custo e Ponto da Melhor Solução');
xlabel('Iterações');
ylabel('Custo');
legend({'Custo ao longo do SA', 'Melhor Solução'}, 'Location', 'Best');
grid on;
hold off;
