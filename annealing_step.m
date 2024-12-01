function [new_x, result] = annealing_step(f, x, x_min, x_max, max_distance, T)
    new_x = x + (rand() - 0.5) * max_distance;
    new_x = max(min(new_x, x_max), x_min); % Garante que new_x está nos limites
    dE = f(new_x) - f(x);
    if dE > 0 || rand() < exp(min(dE / T, 700)) % Limita o argumento de exp
        result = f(new_x);
    else
        new_x = x; % Rejeitar novo ponto
        result = f(x);
    end
end
