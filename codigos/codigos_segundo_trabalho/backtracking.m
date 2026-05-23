% backtracking

[alpha_final] = backtracking(func_f, grad_f, x_ini, tol_stop, alpha_initial, c1, dk, scale);
  alpha = alpha_initial
  x_1 = x_ini - alpha * grad_f(x_ini)

  derivada_direcional = grad_f(x_ini)' * dk;

  % Check if Armadillo is met
  while func_f(x_1) > func_f(x0) + c1 * alpha * derivada_direcional
    alpha = alpha * scale
    x_1 = x_ini + alpha * dk;
  alpha_final = alpha

end
