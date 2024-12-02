%-----------------------------------------------------------------------
% 14 Cities - Mostly in the North of Portugal
% Paulo Moura Oliveira, 2017
%-----------------------------------------------------------------------

% Cities: Names, Latitudes (in degrees), Longitudes (in degrees)
city_data = {
    'Bragança',           41.49, -6.75;
    'Vila Real',          41.18, -7.75;
    'Chaves',             41.44, -7.28;
    'Viana do Castelo',   41.42, -8.50;
    'Braga',              41.33, -8.26;
    'Aveiro',             40.38, -8.39;
    'Porto',              41.11, -8.36;
    'Viseu',              40.39, -7.55;
    'Lamego',             41.06, -7.49;
    'Águeda',             40.34, -8.27;
    'Régua',              41.10, -7.47;
    'Guimarães',          41.27, -8.18;
    'Valença',            42.02, -8.38;
    'Barcelos',           41.32, -8.37;
};

% Extracting Names, Latitudes, and Longitudes
citynames = city_data(:, 1);
latitudes = cell2mat(city_data(:, 2));
longitudes = cell2mat(city_data(:, 3));

% Combine into a coordinates matrix for compatibility
cities = [latitudes, longitudes];

% Display data for confirmation
disp('City Coordinates:');
disp(table(citynames, latitudes, longitudes));
