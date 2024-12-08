function val = f_wrapper(x, base_f)
    % Esta função serve como um "wrapper" (envoltório) para a função base_f.
    % O seu propósito é incrementar o contador global de avaliações
    % sempre que a função é chamada, de forma a acompanhar o número total
    % de avaliações da função-objetivo.
    
    global func_eval_count
    
    val = base_f(x);  % Avalia a função base_f no ponto x
    func_eval_count = func_eval_count + numel(x);  % Incrementa o contador global
end
