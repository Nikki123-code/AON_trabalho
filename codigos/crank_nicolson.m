% Método do Nicolau

function resultado = crank_nicolson(f, a, b, alfa, N)
    h = (b - a) / N;
    t = a:h:b;
    w = zeros(1, N + 1);

    w(1) = alfa;

    for i = 1:N
        g = @(x) w(i) + (h/2) * (f(t(i), w(i)) + f(t(i+1), x));
        % Usamos o ponto fixo para encontrar o valor de w(i+1)
        w(i+1) = ponto_fixo(g, w(i), 1e-5, 50);
    end
    resultado = w;
end
