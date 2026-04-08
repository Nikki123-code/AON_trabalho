% Método de Euler implicito

function resultado = euler_implicito(f, a, b, alfa, N)
	% Primeiro, vamos definir a malha e o comprimento do passo
	h = (b -a)/N
	t = a:h:b

	% De seguida, definimos os pontos na malha sendo todos 0 inicialmente
	w = zeros(1, N + 1)

	% Por fim, aplicamos o método
	w(1)=alfa
	for i=1:N
		% Nota - Podemos variar a tolerancia e as iteradas do método do ponto fixo
		g = @(x) w(i) + h * f(t(i+1), x);
		w(i+1)= ponto_fixo(g, w(i), 0.5, 15)
	resultado = w
	end
end
