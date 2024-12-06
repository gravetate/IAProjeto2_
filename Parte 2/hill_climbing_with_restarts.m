function [best_global_x, best_global_f, history] = hill_climbing_with_restarts(f, search_space, max_iterations, num_restarts, restart_threshold)
    best_global_x = NaN; 
    best_global_f = -inf; 
    history = []; 

    fprintf('Iniciando otimização com Subida da Colina e Reinicializações Múltiplas...\n');
    fprintf('Número de reinicializações: %d\n', num_restarts);
    fprintf('Máximo de iterações por reinicialização: %d\n', max_iterations);
    fprintf('Espaço de busca: [%.2f, %.2f]\n', search_space(1), search_space(2));
    fprintf('-----------------------------\n');

    for restart = 1:num_restarts
        fprintf('Reinicialização %d de %d\n', restart, num_restarts);

        x = search_space(1) + (search_space(2) - search_space(1)) * rand;
        best_local_x = x;
        best_local_f = f(x);

        for iteration = 1:max_iterations
            step = restart_threshold * (rand - 0.5); 
            x_new = best_local_x + step;

            if x_new < search_space(1) || x_new > search_space(2)
                continue;
            end

            f_new = f(x_new);

            if f_new > best_local_f
                best_local_x = x_new;
                best_local_f = f_new;
            end
        end

        history = [history; restart, best_local_x, best_local_f]; %#ok<AGROW>
        fprintf('Melhor solução local nesta reinicialização: x = %.6f, f(x) = %.6f\n', best_local_x, best_local_f);

        if best_local_f > best_global_f
            best_global_x = best_local_x;
            best_global_f = best_local_f;
        end
    end

    fprintf('-----------------------------\n');
    fprintf('Otimização Concluída!\n');
    fprintf('Melhor solução encontrada:\n');
    fprintf('x = %.6f, f(x) = %.6f\n', best_global_x, best_global_f);
end
