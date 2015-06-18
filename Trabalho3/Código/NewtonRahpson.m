%Aproximação Newton Rahpson
clc;
clear;
format long;

a = 1;
b = 2;
n = 2; %Número de subdivisões do intervalo [a,b] que é o grau do polinômio
h = (b-a)/n;
x = a : h : b
y = sqrt(x)
np = n*150;
hp = (b-a)/np;
xp = a: hp: b;
limite = 100
tolerancia = 1e-4

for i=1 : length(xp)
	iter = 0;
	ypi = 1;
	dif = 1;
	
	while dif > tolerancia && iter < limite
		iter++;
		yp(i) = 1/2 * (ypi + (xp(i) / ypi));
		dif = abs(yp(i) - ypi);
		ypi = yp(i);
	end
end

yp

valorExato = sqrt(xp);
erro = abs(yp - valorExato)
erroMaxNewtonRaphson = max(erro)

%plot(x,y,"*;f(x)=sqrt(x);",xp, yp, "r;Interpolador;",xp ,valorExato, "k;sqrt(x);", 2.2,0.7)
plot(xp, erro, "k;Erro;")
