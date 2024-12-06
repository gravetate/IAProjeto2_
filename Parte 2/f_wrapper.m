function val = f_wrapper(x, base_f)
    global func_eval_count
    val = base_f(x);
    func_eval_count = func_eval_count + numel(x); % Contagem de avaliações
end
