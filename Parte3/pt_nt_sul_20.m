% PMO 
% 20 Portuguese Cities Coordinates

clear all;

% Dados das cidades: [ID Latitude Longitude]
temp_x = [ 1 41.49 6.45
           2 41.18 7.45
           3 41.44 7.28
           4 41.42 8.50
           5 41.33 8.26
           6 40.38 8.39
           7 41.11 8.36
           8 40.39 7.55
           9 41.06 7.49
          10 41.27 8.18 
          11 40.12 8.25
          12 37.01 7.56
          13 38.34 7.54
          14 38.43 9.10
          15 39.17 7.26
          16 37.07 7.39
          17 37.00 8.56
          18 38.32 8.54
          19 40.32 7.16
          20 39.14 8.41];

% Matriz de coordenadas (Latitudes e Longitudes)
cities = temp_x(:, 2:3); % Extraindo apenas latitudes e longitudes

% Nomes das cidades (opcional para visualizações)
citynames = {'Bragança', 'Vila Real', 'Chaves', 'Viana do Castelo', 'Braga', ...
             'Aveiro', 'Porto', 'Viseu', 'Lamego', 'Guimarães', ...
             'Coimbra', 'Faro', 'Évora', 'Lisboa', 'Portalegre', ...
             'Tavira', 'Sagres', 'Setúbal', 'Guarda', 'Santarém'};

% Exibir coordenadas
disp('Cidades e suas coordenadas (Latitude, Longitude):');
disp(array2table(cities, 'VariableNames', {'Latitude', 'Longitude'}, 'RowNames', citynames));
