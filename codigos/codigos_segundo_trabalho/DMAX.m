function [x_final,f_final,n_feval,n_iter] = DMAX (func_f, grad_f, x_ini, tol_stop)
  c1 = 10^-4;
  beta = 0.5;
  x = x_ini;
  f = func_f(x);
  g = grad_f(x);
  n_iter = 0;
  n_feval=1 %sempre func_f aparece, este counter deve ser atualizado
  while norm(g)>=tol_stop
    d = -g;
    alfa = 1;
    x_temp = x + alfa*d;
    f_temp = func_f(x_temp);
    n_feval=n_feval+1;
    while f_temp > f + c1*alfa*g'*d
      alfa = alfa*beta;
      x_temp = x + alfa*d;
      f_temp = func_f(x_temp);
      n_feval=n_feval+1;
    endwhile
    x = x_temp;
    f = f_temp;
    g = grad_f(x);
    n_iter = n_iter + 1;
  endwhile
  x_final=x;
  f_final=f;
endfunction
