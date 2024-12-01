function [best_result, best_x, exec_time] = main_hill_climbing(f, n_tests, x_min, x_max, max_distance)
    tic;
    best_result = -Inf;
    best_x = 0;
    for i = 1:n_tests
        start_point = x_min + rand() * (x_max - x_min);
        [local_max, x] = local_search(f, start_point, x_min, x_max, max_distance);
        if local_max > best_result
            best_result = local_max;
            best_x = x;
        end
    end
    exec_time = toc;
end