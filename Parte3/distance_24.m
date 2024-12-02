function d = distance_24(inputcities)
    % Calcula a distância total da viagem de ida e volta
    % inputcities é uma matriz (Nx2) com [latitude, longitude]

    d = 0; % Inicializar a distância total

    % Loop para calcular a distância entre cidades consecutivas
    for n = 1:size(inputcities, 1)-1
        d = d + geo_distance(inputcities(n, :), inputcities(n+1, :));
    end

    % Adicionar a distância de volta à cidade inicial
    d = d + geo_distance(inputcities(end, :), inputcities(1, :));
end