function cost = tour_distance(solution, cities)
    % Esta função calcula a distância total de um percurso (tour) 
    % dado por uma permutação de cidades (solution).
    % O percurso é fechado, ou seja, após a última cidade retorna à primeira.
    %
    % Parâmetros:
    % - solution: um vetor contendo a ordem (índices) em que as cidades são visitadas
    % - cities: uma matriz contendo as coordenadas das cidades, onde 
    %   cities(:, i) fornece as coordenadas da cidade i
    %
    % Saída:
    % - cost: a distância total do percurso

    cost = 0;
    n = length(solution);

    % Soma a distância entre cada par de cidades consecutivas
    for i = 1:(n-1)
        cost = cost + geo_distance(cities(:, solution(i)), cities(:, solution(i+1)));
    end

    % Fecha o percurso, adicionando a distância da última cidade de volta à primeira
    cost = cost + geo_distance(cities(:, solution(n)), cities(:, solution(1)));
end
