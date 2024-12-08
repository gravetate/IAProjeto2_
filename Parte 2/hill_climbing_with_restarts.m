function [best_global_x, best_global_f, history] = hill_climbing_with_restarts(f, search_space, max_iterations, num_restarts, restart_threshold)
    % Inicializa a melhor solução global com valores padrão
    best_global_x = NaN; 
    best_global_f = -inf; 
    history = []; 

    fprintf('Iniciando a optimização com Subida da Colina e Múltiplos Reinícios...\n');
    fprintf('Número de reinícios: %d\n', num_restarts);
    fprintf('Máximo de iterações por reinício: %d\n', max_iterations);
    fprintf('Espaço de procura: [%.2f, %.2f]\n', search_space(1), search_space(2));
    fprintf('-----------------------------\n');

    for restart = 1:num_restarts
        fprintf('Reinício %d de %d\n', restart, num_restarts);

        % Gera uma solução inicial aleatória dentro do espaço de procura
        x = search_space(1) + (search_space(2) - search_space(1)) * rand;
        best_local_x = x;
        best_local_f = f(x);

        for iteration = 1:max_iterations
            % Define um passo aleatório, limitado pelo restart_threshold
            step = restart_threshold * (rand - 0.5); 
            x_new = best_local_x + step;

            % Verifica se o novo ponto ainda está dentro do espaço de procura
            if x_new < search_space(1) || x_new > search_space(2)
                continue; 
            end

            f_new = f(x_new);

            % Se encontrou uma solução melhor localmente, actualiza-a
            if f_new > best_local_f
                best_local_x = x_new;
                best_local_f = f_new;
            end
        end

        % Armazena no histórico: [reinício, x_melhor_local, f_melhor_local]
        history = [history; restart, best_local_x, best_local_f]; %#ok<AGROW>
        fprintf('Melhor solução local neste reinício: x = %.6f, f(x) = %.6f\n', best_local_x, best_local_f);

        % Actualiza a melhor solução global se necessário
        if best_local_f > best_global_f
            best_global_x = best_local_x;
            best_global_f = best_local_f;
        end
    end

    fprintf('-----------------------------\n');
    fprintf('Optimização Concluída!\n');
    fprintf('Melhor solução encontrada:\n');
    fprintf('x = %.6f, f(x) = %.6f\n', best_global_x, best_global_f);
end
