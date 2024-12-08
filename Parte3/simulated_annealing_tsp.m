function [best_solution, best_cost, history_cost] = simulated_annealing_tsp(cities, T_initial, T_final, alfa, nRep)
    n = size(cities,2); 
    current_solution = randperm(n);
    current_cost = tour_distance(current_solution, cities);

    best_solution = current_solution;
    best_cost = current_cost;

    T = T_initial; 
    history_cost = [];

    while T > T_final
        for rep = 1:nRep
            new_solution = generate_neighbor(current_solution);
            new_cost = tour_distance(new_solution, cities);
            dE = new_cost - current_cost;

            if dE < 0
                current_solution = new_solution;
                current_cost = new_cost;
                if current_cost < best_cost
                    best_solution = current_solution;
                    best_cost = current_cost;
                end
            else
                if rand < exp(-dE / T)
                    current_solution = new_solution;
                    current_cost = new_cost;
                end
            end

            history_cost = [history_cost, current_cost];
        end
        T = alfa * T;
    end

    fprintf('-----------------------------\n');
    fprintf('Otimização Concluída!\n');
    fprintf('Melhor solução encontrada com SA:\n');
    fprintf('Custo = %.6f\n', best_cost);
    fprintf('Rota = '); fprintf('%d ', best_solution); fprintf('\n');
end

