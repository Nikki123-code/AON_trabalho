function fval = f_rosenbrock(x)
    % Garante que x é um vetor coluna
    x = x(:);

    % Calcula o somatório da função de Rosenbrock para dimensão 10
    fval = sum( 100 * (x(2:10) - x(1:9).^2).^2 + (1 - x(1:9)).^2 );
end
