% Método do Nicolau

function resultado = crank_nicolson(f, a, b, alfa, N)
%f = @(t, y) -2 * y;
%a = 0;
%b = 3;
%alfa = 1;
%N = 20;
    h = (b - a) / N;
    t = a:h:b;
    w = zeros(1, N + 1);
    pontos=w;
    pontos(1)=a;

    w(1) = alfa;

    for i = 1:N
        g = @(x) w(i) + (h/2) * (f(t(i), w(i)) + f(t(i+1), x));
        % Usamos o ponto fixo para encontrar o valor de w(i+1)
        w(i+1) = ponto_fixo(g, w(i), 1e-5, 15);
        pontos(i+1)=a + h*i;
    end
    w=w.';
    pontos=pontos.';
    indices=a:1:N;
    indices=indices.';
    resultado=horzcat(indices,pontos,w);
end
