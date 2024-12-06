clc;            % Clear screen
clear all;      % Clear all variables from workspace
close all;      % Close all figures

%------------------------------------------------------------------------
% Loading cities in Portugal
pt_nt; % Carregar conjunto de cidades (14 cidades no Norte de Portugal)
set_id = 1; 

% Input Settings
inputcities = cities; % Coordenadas geográficas das cidades

% Extract latitude and longitude
latitudes = inputcities(:, 1);
longitudes = inputcities(:, 2);

% Ajustar os limites do mapa
margin = 0.2; % Margem adicional para visualização
latMin = min(latitudes) - margin;
latMax = max(latitudes) + margin;
lonMin = min(longitudes) - margin;
lonMax = max(longitudes) + margin;

% Plot initial map with cities
figure('Position', [100, 100, 800, 600]); % Ajustar tamanho da janela
geobasemap('streets'); % Fundo do mapa geográfico
hold on;

% Plotar as cidades no mapa
geoscatter(latitudes, longitudes, 100, 'r', 'filled');
text(latitudes, longitudes, citynames, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

% Adicionar título ao mapa
title('Mapa Inicial das Cidades em Portugal (TSP)');

% Definir limites do mapa
geolimits([latMin, latMax], [lonMin, lonMax]);
hold off;

%------------------------------------------------------------------------
% Initial trip distance
initialDist = distance_24(inputcities);
fprintf(1, 'Initial roundtrip length for %d cities: %4.2f Km\n', length(inputcities), initialDist);

%------------------------------------------------------------------------
% Simulated Annealing Optimization
% Parameters
T = 1000;       % Temperatura inicial
alpha = 0.95;   % Fator de decaimento da temperatura
nRep = 100;     % Número de iterações por temperatura

% Call Simulated Annealing function
[bestRoute, bestDistance] = simulated_annealing_tsp(inputcities, T, alpha, nRep);

% Results
fprintf(1, 'Optimized roundtrip length: %4.2f Km\n', bestDistance);

% Plot optimized route with map
figure('Position', [100, 100, 1000, 800]); % Ajustar tamanho da janela
geobasemap('streets'); % Fundo do mapa
hold on;

% Plotar as cidades no mapa
geoscatter(latitudes, longitudes, 100, 'r', 'filled');
text(latitudes + 0.03, longitudes, citynames, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'FontSize', 10, 'Color', 'blue');

% Adicionar rota otimizada
optimizedLatitudes = latitudes(bestRoute);
optimizedLongitudes = longitudes(bestRoute);
geoplot([optimizedLatitudes; optimizedLatitudes(1)], [optimizedLongitudes; optimizedLongitudes(1)], '-g', 'LineWidth', 2);

% Adicionar título ao mapa
title('Rota Otimizada (Simulated Annealing)', 'FontSize', 14);

% Definir limites do mapa com margem adicional
margin = 0.2; % Margem para melhor visualização
latMin = min(latitudes) - margin;
latMax = max(latitudes) + margin;
lonMin = min(longitudes) - margin;
lonMax = max(longitudes) + margin;
geolimits([latMin, latMax], [lonMin, lonMax]);

hold off;

