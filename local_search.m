function [max_value, x] = local_search(f, start_point, x_min, x_max, max_distance)
    x = start_point;
    max_value = f(x);
    for j = 1:100 % Iterações máximas de busca local
        new_x = x + (rand() - 0.5) * max_distance;
        new_x = max(min(new_x, x_max), x_min); % Garante que new_x está nos limites
        if f(new_x) > max_value
            x = new_x;
            max_value = f(x);
        end
    end
end
