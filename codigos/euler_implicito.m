% Método de Euler implicito

function resultado = euler_implicito(f, a, b, alfa, N)
f = @(t, y) -2 * y;
a = 0;
b = 3;
alfa = 1;
N = 20;
	% Primeiro, vamos definir a malha e o comprimento do passo
	h = (b -a)/N;
	t = a:h:b;

	% De seguida, definimos os pontos na malha sendo todos 0 inicialmente
	w = zeros(1, N + 1);
  pontos=w;
  pontos(1)=a;

	% Por fim, aplicamos o método
	w(1)=alfa;
	for i=1:N
		% Nota - Podemos variar a tolerancia e as iteradas do método do ponto fixo
		g = @(x) w(i) + h * f(t(i+1), x);
		w(i+1)= ponto_fixo(g, w(i), 1e-5, 15);
    pontos(i+1)=a + h*i;
	endfor
    w=w.';
    pontos=pontos.';
    indices=a:1:N;
    indices=indices.';
    resultado=horzcat(indices,pontos,w);
endfunction
