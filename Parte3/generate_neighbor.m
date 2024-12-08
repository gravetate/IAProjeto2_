function new_solution = generate_neighbor(current_solution)
    % Esta função gera um vizinho (solução vizinha) a partir de uma solução atual
    % do problema do caixeiro viajante, efetuando uma troca aleatória entre duas 
    % cidades.
    %
    % Parâmetros:
    % - current_solution: um vetor representando a ordem de visita das cidades
    %
    % Saída:
    % - new_solution: uma nova solução resultante da troca aleatória de duas cidades
    
    new_solution = current_solution;
    n = length(current_solution);
    
    % Seleciona aleatoriamente dois índices de cidades
    i = randi(n);
    j = randi(n);
    
    % Efetua a troca das cidades i e j
    temp = new_solution(i);
    new_solution(i) = new_solution(j);
    new_solution(j) = temp;
end
