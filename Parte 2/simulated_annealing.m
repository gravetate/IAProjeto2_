function [best_x, best_f, history_x, history_f] = simulated_annealing(f, search_space, T_initial, T_final, alfa, nRep)
    x = search_space(1) + (search_space(2) - search_space(1)) * rand; 
    best_x = x; 
    best_f = f(x); 
    current_x = x; 
    current_f = best_f; 
    T = T_initial; 

    history_x = [];
    history_f = [];

    while T > T_final
        for rep = 1:nRep
            step = (rand - 0.5) * 0.1 * (search_space(2) - search_space(1)); 
            new_x = current_x + step;

            if new_x < search_space(1) || new_x > search_space(2)
                continue;
            end

            new_f = f(new_x);
            dE = new_f - current_f;

            if dE > 0
                p = 1; 
            else
                p = exp(dE / T);
            end

            if p > rand
                current_x = new_x;
                current_f = new_f;

                if new_f > best_f
                    best_x = new_x;
                    best_f = new_f;
                end
            end

            history_x = [history_x, current_x];
            history_f = [history_f, current_f];
        end

        T = alfa * T;
    end

    fprintf('-----------------------------\n');
    fprintf('Otimização Concluída!\n');
    fprintf('Melhor solução encontrada:\n');
    fprintf('x = %.6f, f(x) = %.6f\n', best_x, best_f);
end