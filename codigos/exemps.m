function tabela_final = exemps ()
h=[0.25 0.2 0.1 0.05];

%os exemplos estão abaixo, comentar dependendo do que se deseja

%exemplo 1
%eu fiz o exemplo 2 primeiro, onde o t_i comum a todos os passos eram o 1º(nao tem utilidade) e o último
%no exemplo 1 vao aparecer 2 t_i relevantes (o 1 e o 2), as matrizes têm um nº impar de colunas, o 1 é sempre nºcolunas/2 + 0.5
%deve dar para fazer assim, mas a tabela final vai precisar de alterações...

f=@(t,y) -30*y;
T=2;
alfa=1/3;
y=@(t) (1/3)*e^(-30*t);


%exemplo 2, o f não é linear pelo que está a dar Inf em algumas aproximações dos metodos implicitos
%TO DO: resolver os Inf, talvez não seja possivel, verificar à mão e euler implicito de passo 0.25 - ele estraga logo, deve ser fácil :)
#{
f=@(t,y) 5 * e^(5*t) * (y-t)^2 + 1;
T=1;
alfa=-1;
y=@(t) t - e^(-5*t);
#}

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

%fazer as aproximações
for i=1:4
  resultado=NaN(N(i)+1,3);

  resultado=euler_explicito(f,0,T,alfa,N(i));
  resultados_ee=horzcat(resultados_ee,resultado);

  resultado=Heun_explicito(f,0,T,alfa,N(i));
  resultados_heun=horzcat(resultados_heun,resultado);

  resultado=crank_nicolson(f,0,T,alfa,N(i));
  resultados_cn=horzcat(resultados_cn,resultado);

  resultado=euler_implicito(f,0,T,alfa,N(i));
  resultados_ei=horzcat(resultados_ei,resultado);
endfor

passos=h.';
erro_abs_ee=NaN(4,1);
erro_abs_heun=NaN(4,1);
erro_abs_cn=NaN(4,1);
erro_abs_ei=NaN(4,1);

convergencia_ee=erro_abs_ee;
convergencia_heun=erro_abs_heun;
convergencia_cn=erro_abs_cn;
convergencia_ei=erro_abs_ei;

%calcular erro absoluto
for i=1:4
  erro_abs_ee(i)=abs(resultados_ee{i}(end,end)-y(T));
  erro_abs_heun(i)=abs(resultados_heun{i}(end,end)-y(T));
  erro_abs_cn(i)=abs(resultados_cn{i}(end,end)-y(T));
  erro_abs_ei(i)=abs(resultados_ei{i}(end,end)-y(T));
endfor

%calcular o rácio dos erros
for i=1:3
  convergencia_ee(i)=erro_abs_ee(i+1)/erro_abs_ee(i);
  convergencia_heun(i)=erro_abs_heun(i+1)/erro_abs_heun(i);
  convergencia_cn(i)=erro_abs_cn(i+1)/erro_abs_cn(i);
  convergencia_ei(i)=erro_abs_ei(i+1)/erro_abs_ei(i);
endfor

%preparar a tabela
tabelinha_ee=horzcat(passos,erro_abs_ee,convergencia_ee);
tabelinha_heun=horzcat(passos,erro_abs_heun,convergencia_heun);
tabelinha_cn=horzcat(passos,erro_abs_cn,convergencia_cn);
tabelinha_ei=horzcat(passos,erro_abs_ei,convergencia_ei);

%tabela de facto
tabela=vertcat(tabelinha_ee,tabelinha_heun,tabelinha_cn,tabelinha_ei);
nomes_linhas=[repmat({'Euler Explicito'},4,1);repmat({'Heun'},4,1); repmat({'Crank-Nicolson'},4,1); repmat({'Euler Implicito'},4,1)];
tabela_final=table(nomes_linhas,tabela(:,1),tabela(:,2),tabela(:,3),'VariableNames',{'Metodo','h','Erro Absoluto','Erro_i+1/Erro_i'});
endfunction
