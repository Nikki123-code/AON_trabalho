function f_val = funcao_lj(X, epsilon, sigma)
    if nargin < 2, epsilon = 1; end
    if nargin < 3, sigma = 1; end

    dim = 10; % Definimos as 10 dimensões!
    N = length(X) / dim;
    X_mat = reshape(X, dim, N)';
    f_val = 0;

    for i = 1:(N-1)
        for j = (i+1):N
            r_vec = X_mat(i, :) - X_mat(j, :);
            r = norm(r_vec);

            term6 = (sigma / r)^6;
            term12 = term6^2;

            f_val = f_val + 4 * epsilon * (term12 - term6);
        end
    end
end
