% Método do Ho-Oh

function resultado = Heun_explicito(f, a, b, alfa, N)
	h = (b - a) / N;
    	t = a:h:b;
    	w = zeros(1, N + 1);
    	w(1) = alfa;
	for i=1:N
		w(i+1)=w(i)+(h/2)*(f(t(i),w(i))+f(t(i+1),w(i)+h*f(t(i),w(i))))
	end
	resultado = w
end

