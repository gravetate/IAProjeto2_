function d = distance_24(inputcities)
    % Esta função calcula a distância total do percurso definido em 'inputcities'.
    % Cada coluna de 'inputcities' corresponde a uma cidade.
    % O percurso é fechado, ou seja, após a última cidade volta-se à primeira.
    %
    % Parâmetros:
    % - inputcities: uma matriz onde cada coluna corresponde à posição de uma cidade,
    %   por exemplo [latitude; longitude] ou [x; y].
    %
    % Saída:
    % - d: a distância total do percurso.

    d = 0;
    num_cidades = length(inputcities);

    for n = 1 : num_cidades
        if n == num_cidades
            % Para a última cidade, adiciona a distância de volta à primeira cidade
            d = d + geo_distance(inputcities(:,n), inputcities(:,1)); 
        else
            % Para as cidades intermédias, adiciona a distância até à próxima cidade
            d = d + geo_distance(inputcities(:,n), inputcities(:,n+1));
        end
    end
end
