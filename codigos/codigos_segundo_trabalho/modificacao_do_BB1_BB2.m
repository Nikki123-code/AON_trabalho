function [x_final, f_final, n_feval, n_iter] = BB_hibrido(func_f, grad_f, x_ini, tol_stop, lambda)
  % lambda: peso entre 0 e 1 (0 -> BB2, 1 -> BB1)
  c1 = 1e-4;
  beta = 0.5;
  x = x_ini;
  f = func_f(x);
  g = grad_f(x);
  n_iter = 0;
  n_feval = 1;

  while norm(g) >= tol_stop
    d = -g;

    if n_iter == 0
      alfa = 1;
      x_temp = x + alfa*d;
      f_temp = func_f(x_temp);
      n_feval = n_feval + 1;
      while f_temp > f + c1*alfa*g'*d
        alfa = alfa*beta;
        x_temp = x + alfa*d;
        f_temp = func_f(x_temp);
        n_feval = n_feval + 1;
      endwhile
    else
      s = x - x_antigo;
      y = g - g_antigo;
      prod = s'*y;

      if prod <= 0
        alfa = 1e-4;
      else
        alfa_bb1 = (s'*s) / prod;
        alfa_bb2 = prod / (y'*y);

        alfa = lambda * alfa_bb1 + (1 - lambda) * alfa_bb2;
      endif

      x_temp = x + alfa*d;
      f_temp = func_f(x_temp);
      n_feval = n_feval + 1;
    endif

    x_antigo = x;
    x = x_temp;
    f = f_temp;
    g_antigo = g;
    g = grad_f(x);
    n_iter = n_iter + 1;
  endwhile

  x_final = x;
  f_final = f;
endfunction
