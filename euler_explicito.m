% Método de Euler explicito

function y = euler_explicito(f, a, b, alfa, N)
  % Define h e a malha
  h = (b - a) / N;
  t = a:h:b;

  % Define os zeros
  y = zeros(1, N + 1);
  y(1) = alfa;

  % Itera no método
  for i = 1:N
    y(i+1) = y(i) + h * f(t(i), y(i));
  end
end

% Exemplo de teste
% f = @(t, y) -2 * y;
% a = 0;
% b = 3;
% alfa = 1;
% N = 20;
% valores_y = euler_explicito(f, a, b, alfa, N);

