function d = haversine(coord1, coord2)
    % haversine - Calcula a distância entre dois pontos geográficos
    % coord1 e coord2 são vetores [latitude, longitude] em graus
    R = 6371; % Raio da Terra em km
    lat1 = deg2rad(coord1(1));
    lon1 = deg2rad(coord1(2));
    lat2 = deg2rad(coord2(1));
    lon2 = deg2rad(coord2(2));
    dlat = lat2 - lat1;
    dlon = lon2 - lon1;
    a = sin(dlat / 2)^2 + cos(lat1) * cos(lat2) * sin(dlon / 2)^2;
    c = 2 * atan2(sqrt(a), sqrt(1 - a));
    d = R * c;
end