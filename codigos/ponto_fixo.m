% Método do ponto fixo (necessário para os métodos implicitos)

function [x, iter] = ponto_fixo(g, x0, tol, max_iter)
  x = x0;

  for iter = 1:max_iter
    x_new = g(x);

    % critério de paragem
    if abs(x_new - x) < tol
      x = x_new;
      return;
    endif
    x = x_new;
  endfor

  warning("Número máximo de iterações atingido");
endfunction
