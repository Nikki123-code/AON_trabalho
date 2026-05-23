% Maximum descent


[x_final, f_final, n_feval, n_iter] = f(func_f, grad_f, x_ini, tol_stop, alpha);
	x0 = x_ini;
	n_iter = 0;
	norm_grad = norm(grad_f(x0));
	while norm_grad > tol_stop
    		x = x0 - alpha * grad_f(x0);
    		x0 = x;

    		norm_grad = norm(grad_f(x0));
    		n_iter = n_iter + 1;
	end
	x_final = x0;
	f_final = func_f(x_final);
	n_feval = n_iter + 1;  % depende de como contas evals
end
