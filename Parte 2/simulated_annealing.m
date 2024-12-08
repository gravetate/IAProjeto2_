function [best_x, best_f, history_x, history_f] = simulated_annealing(f, search_space, T_initial, T_final, alfa, nRep)
    % Gera uma solução inicial aleatória dentro do espaço de procura
    x = search_space(1) + (search_space(2) - search_space(1)) * rand; 
    best_x = x; 
    best_f = f(x); 
    current_x = x; 
    current_f = best_f; 
    T = T_initial; 

    % Vetores para histórico das soluções
    history_x = [];
    history_f = [];

    % Enquanto a temperatura for superior à temperatura final desejada
    while T > T_final
        for rep = 1:nRep
            % Gera um novo candidato perturbando a solução actual
            step = (rand - 0.5) * 0.1 * (search_space(2) - search_space(1)); 
            new_x = current_x + step;

            % Verifica se a nova solução está dentro do espaço de procura
            if new_x < search_space(1) || new_x > search_space(2)
                continue; % Ignora e tenta outra se estiver fora dos limites
            end

            new_f = f(new_x);
            dE = new_f - current_f;

            % Calcula a probabilidade de aceitar a nova solução
            if dE > 0
                p = 1;  % Se melhor, aceita de imediato
            else
                p = exp(dE / T); % Caso contrário, aceita com uma probabilidade exp(dE/T)
            end

            % Avalia se aceita a nova solução com base na probabilidade p
            if p > rand
                current_x = new_x;
                current_f = new_f;

                % Actualiza a melhor solução encontrada, se for o caso
                if new_f > best_f
                    best_x = new_x;
                    best_f = new_f;
                end
            end

            % Regista o histórico de soluções e valores de f(x)
            history_x = [history_x, current_x];
            history_f = [history_f, current_f];
        end

        % Arrefecimento da temperatura
        T = alfa * T;
    end

    fprintf('-----------------------------\n');
    fprintf('Otimização Concluída!\n');
    fprintf('Melhor solução encontrada:\n');
    fprintf('x = %.6f, f(x) = %.6f\n', best_x, best_f);
end
