function cost = tour_distance(solution, cities)
    cost = 0;
    n = length(solution);
    for i = 1:(n-1)
        cost = cost + geo_distance(cities(:,solution(i)), cities(:,solution(i+1)));
    end
    % Fechar o ciclo
    cost = cost + geo_distance(cities(:,solution(n)), cities(:,solution(1)));
end
