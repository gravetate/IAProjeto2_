function [bestRoute, bestDistance] = simulated_annealing_tsp(coordinates, T, alpha, nRep)
    % simulated_annealing_tsp - Resolve o problema do caixeiro viajante usando Simulated Annealing.
    %
    % Inputs:
    % coordinates - Matriz de coordenadas (n x 2), onde cada linha é [latitude, longitude]
    % T - Temperatura inicial
    % alpha - Fator de decaimento da temperatura
    % nRep - Número de repetições por temperatura
    %
    % Outputs:
    % bestRoute - Melhor rota encontrada (índices das cidades)
    % bestDistance - Distância da melhor rota

    % Número de cidades
    nCities = size(coordinates, 1);
    
    % Função para calcular a distância total de uma rota
    function dist = total_distance(route)
        dist = 0;
        for i = 1:length(route)-1
            dist = dist + haversine(coordinates(route(i), :), coordinates(route(i+1), :));
        end
        % Fechar o ciclo
        dist = dist + haversine(coordinates(route(end), :), coordinates(route(1), :));
    end

    % Inicializar solução
    currentRoute = randperm(nCities);
    currentDistance = total_distance(currentRoute);
    bestRoute = currentRoute;
    bestDistance = currentDistance;
    
    while T > 1e-3 % Parar quando a temperatura for muito baixa
        for i = 1:nRep
            % Gerar uma nova solução (swap aleatório)
            newRoute = currentRoute;
            idx = randperm(nCities, 2);
            newRoute(idx) = newRoute(flip(idx)); % Trocar duas cidades
            
            % Calcular a distância da nova solução
            newDistance = total_distance(newRoute);
            
            % Calcular variação de energia
            dE = newDistance - currentDistance;
            
            % Aceitar a nova solução?
            if dE < 0 || rand < exp(-dE / T)
                currentRoute = newRoute;
                currentDistance = newDistance;
                
                % Atualizar melhor solução encontrada
                if currentDistance < bestDistance
                    bestRoute = currentRoute;
                    bestDistance = currentDistance;
                end
            end
        end
        % Reduzir temperatura
        T = T * alpha;
    end
end


