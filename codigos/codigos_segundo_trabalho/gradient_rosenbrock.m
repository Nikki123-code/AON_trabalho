function gval = g_rosenbrock(x)
    % Garante que x é um vetor coluna
    x = x(:);
    gval = zeros(10, 1);

    % Derivada em ordem a x1
    gval(1) = -400 * x(1) * (x(2) - x(1)^2) - 2 * (1 - x(1));

    % Derivadas em ordem a x2 até x9
    for i = 2:9
        gval(i) = 200 * (x(i) - x(i-1)^2) - 400 * x(i) * (x(i+1) - x(i)^2) - 2 * (1 - x(i));
    end

    % Derivada em ordem a x10
    gval(10) = 200 * (x(10) - x(9)^2);
end
