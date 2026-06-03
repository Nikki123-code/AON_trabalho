function grad_f = grad_lj(X, epsilon, sigma)
    if nargin < 2, epsilon = 1; end
    if nargin < 3, sigma = 1; end

    dim = 10; % Definimos as 10 dimensões!
    N = length(X) / dim;
    X_mat = reshape(X, dim, N)';
    grad_mat = zeros(N, dim);

    for i = 1:N
        for j = 1:N
            if i ~= j
                r_vec = X_mat(i, :) - X_mat(j, :);
                r = norm(r_vec);

                term6 = (sigma / r)^6;
                term12 = term6^2;

                coef = 24 * epsilon * (term6 - 2 * term12) / (r^2);
                grad_mat(i, :) = grad_mat(i, :) + coef * r_vec;
            end
        end
    end

    grad_f = reshape(grad_mat', dim*N, 1);
end
