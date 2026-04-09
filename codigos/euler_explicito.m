% Método de Euler explicito

function y = euler_explicito(f, a, b, alfa, N)
%f = @(t, y) -2 * y;
%a = 0;
%b = 3;
%alfa = 1;
%N = 20;
  % Define h e a malha
  h = (b - a) / N;
  t = a:h:b;

  % Define os zeros
  y = zeros(1, N + 1);
  pontos=y;
  y(1) = alfa;
  pontos(1)=a;

  % Itera no método
  for i = 1:N
    y(i+1) = y(i) + h * f(t(i), y(i));
    pontos(i+1)=a + h*i;
  endfor
  y=y.';
  pontos=pontos.';
  indices=a:1:N;
  indices=indices.';
  y=horzcat(indices,pontos,y);
  %assim temos uma matriz onde coluna_1==i ; coluna_2==t_i ; coluna_3==w_i

endfunction
