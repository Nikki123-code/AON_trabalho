function [x, f, nfe, nit] = hibrido_bb_wolfe(func_f, grad_f, x_ini, tol, lambda)

  x = x_ini;
  g = grad_f(x);
  f = func_f(x);

  nit = 0;
  nfe = 1;

  c1 = 1e-4;
  alfa_min = 1e-10;
  alfa_max = 1e3;
  alfa0 = 1;

  while norm(g) > tol
    d = -g;

    if nit == 0
      alfa = alfa0;
    else
      s = x - x_old;
      y = g - g_old;

      sy = sum(sum(s .* y));
      ss = sum(sum(s .* s));
      yy = sum(sum(y .* y));

      if sy > 1e-14 && yy > 1e-14
        alfa_bb1 = ss / sy;
        alfa_bb2 = sy / yy;
        alfa = lambda * alfa_bb1 + (1 - lambda) * alfa_bb2;
      else
        alfa = alfa0;
      endif

      alfa = min(max(alfa, alfa_min), alfa_max);
    endif

    f_trial = func_f(x + alfa * d);
    nfe = nfe + 1;

    g_dot_d = sum(sum(g .* d));

    while f_trial > f + c1 * alfa * g_dot_d
      alfa = alfa / 2;

      if alfa < alfa_min
        alfa = alfa_min;
        break;
      endif

      f_trial = func_f(x + alfa * d);
      nfe = nfe + 1;
    endwhile

    x_old = x;
    g_old = g;

    x = x + alfa * d;
    f = f_trial;
    g = grad_f(x);

    nit = nit + 1;
  endwhile
endfunction
