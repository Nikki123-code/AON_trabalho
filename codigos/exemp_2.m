function retval = exemp_2 ()
h=[0.25 0.2 0.1 0.05];
f=@(t,y) 5 * e^(5*t) * (y-t)^2 + 1;
T=1;
alfa=-1;
y=@(t) t - e^(-5*t);

N=zeros(1,4);
% o valor de N depende de h nos exemplos
for i=1:4
  N(i)=T/h(i);
endfor

%guardar as diferentes matrizes
resultados_ee={};% euler explicito
resultados_heun={};% heun
resultados_cn={};% crank nicolson
resultados_ei={};% euler implicito

for i=1:4
  resultado=NaN(N(i)+1,3);

  resultado=euler_explicito(f,0,T,alfa,N(i));
  resultados_ee=horzcat(resultados_ee,resultado);

  resultado=Heun_explicito(f,0,T,alfa,N(i));
  resultados_heun=horzcat(resultados_heun,resultado);

  resultado=crank_nicolson(f,0,T,alfa,N(i));
  resultados_cn=horzcat(resultados_cn,resultado);

  resultado=crank_nicolson(f,0,T,alfa,N(i));
  resultados_cn=horzcat(resultados_cn,resultado);

  resultado=euler_implicito(f,0,T,alfa,N(i));
  resultados_ei=horzcat(resultados_ei,resultado)
  endfor
endfunction
