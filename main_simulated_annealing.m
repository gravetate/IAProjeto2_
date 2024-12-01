function [best_result, best_x, exec_time] = main_simulated_annealing(f, T, alpha, nRep, x_min, x_max, max_distance)
    tic;
    x = rand() * (x_max - x_min) + x_min;
    best_x = x;
    best_result = f(x);
    while T > 1e-3
        for i = 1:nRep
            [x, result] = annealing_step(f, x, x_min, x_max, max_distance, T);
            if result > best_result
                best_result = result;
                best_x = x;
            end
        end
        T = T * alpha;
    end
    exec_time = toc;
end