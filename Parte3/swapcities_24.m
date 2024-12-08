function s = swapcities_24(inputcities, n)
    % Esta função realiza 'n' trocas aleatórias entre as posições de duas cidades 
    % num conjunto de cidades fornecido.
    %
    % Parâmetros:
    % - inputcities: matriz em que cada coluna representa uma cidade 
    %   (por exemplo, [latitude; longitude] de cada cidade).
    % - n: número de trocas a serem efectuadas.
    %
    % Saída:
    % - s: matriz resultante após as trocas, mantendo o mesmo número e ordem de cidades
    %   excepto pelas trocas aleatórias realizadas.
    
    s = inputcities;
    num_cidades = length(inputcities);

    for i = 1:n
        % Gera dois índices aleatórios de cidades
        city_1 = round(num_cidades * rand(1));
        if city_1 < 1
            city_1 = 1;
        end
        
        city_2 = round(num_cidades * rand(1));
        if city_2 < 1
            city_2 = 1;
        end
        
        % Realiza a troca
        temp = s(:, city_1);
        s(:, city_1) = s(:, city_2);
        s(:, city_2) = temp;
    end
end
