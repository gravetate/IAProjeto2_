f = @(x) 4 * (sin(5 * pi * x + 0.5).^6) .* exp(log2((x - 0.8).^2));

search_space = [0, 1.6];
max_iterations = 300;    
num_restarts = 10;      
restart_threshold = 0.02 * (search_space(2) - search_space(1)); 

[best_global_x, best_global_f, history] = hill_climbing_with_restarts(f, search_space, max_iterations, num_restarts, restart_threshold);

x_vals = linspace(search_space(1), search_space(2), 1000);
f_vals = f(x_vals);

figure;
plot(x_vals, f_vals, 'b-', 'LineWidth', 1.5);
hold on;
plot(best_global_x, best_global_f, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Melhor solução
title('Otimização da Função com Subida da Colina');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'Melhor Solução Encontrada', 'Location', 'Best');
grid on;
