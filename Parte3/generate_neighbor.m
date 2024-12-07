function new_solution = generate_neighbor(current_solution)
    new_solution = current_solution;
    n = length(current_solution);
    i = randi(n);
    j = randi(n);
    % Troca as cidades i e j
    temp = new_solution(i);
    new_solution(i) = new_solution(j);
    new_solution(j) = temp;
end
