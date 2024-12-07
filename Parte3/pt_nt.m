% Set of 14 cities 
% Mostly in the North of Portugal
% Paulo Moura Oliveira, 2017

%-----------------------------------------------------------------------
% 1 Bragança                41N49 6W45
% 2 Vila Real               41N18 7W45
% 3 Chaves                  41N44 7W28
% 4 Viana do Castelo        41N42 8W50 
% 5 Braga                   41N33 8W26
% 6 Aveiro                  40N38 8W39
% 7 Porto                   41N11 8W36
% 8 Viseu                   40N39 7W55
% 9 Lamego                  41N06 7W49
% 10 Águeda                 40N34 8W27
% 11 Régua                  41N10 7W47
% 12 Guimarães              41N27 8W18
% 13 Valença                42N02 8W38 
% 14 Barcelos               41N32 8W37 
%----------------------------------------------------------------------- 

% Lati and Longit\\
temp_x = [
1   41.8167  -6.75
2   41.3000  -7.75
3   41.7333  -7.4667
4   41.7000  -8.8333
5   41.5500  -8.4333
6   40.6333  -8.65
7   41.1833  -8.6
8   40.6500  -7.9167
9   41.1000  -7.8167
10  40.5667  -8.45
11  41.1667  -7.7833
12  41.4500  -8.3
13  42.0333  -8.6333
14  41.5333  -8.6167
];


% Stores the cities coordinates in a matrix
cities = [temp_x(:,2)'; temp_x(:,3)'];

