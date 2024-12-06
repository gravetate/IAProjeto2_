% Definir a função a ser otimizada
f = @(x) 4 * (sin(5 * pi * x + 0.5).^6) .* exp(log2((x - 0.8).^2));

% Definir os parâmetros
search_space = [0, 1.6]; % Limites do espaço de busca
T_initial = 1.0;         % Temperatura inicial
T_final = 1e-6;          % Temperatura final
alfa = 0.99;             % Fator de decaimento
nRep = 100;              % Número de repetições por temperatura

% Chamar a função de Simulated Annealing
[best_x, best_f, history_x, history_f] = simulated_annealing(f, search_space, T_initial, T_final, alfa, nRep);

% Visualizar resultados
x_vals = linspace(search_space(1), search_space(2), 1000);
f_vals = f(x_vals);

figure;
plot(x_vals, f_vals, 'b-', 'LineWidth', 1.5);
hold on;
plot(history_x, history_f, 'g.', 'MarkerSize', 10); % Histórico da busca
plot(best_x, best_f, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Melhor solução
title('Simulated Annealing: Otimização da Função');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'Histórico da busca', 'Melhor Solução', 'Location', 'Best');
grid on;
