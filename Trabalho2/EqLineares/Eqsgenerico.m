% Método de newton-raphson genérico
clear
clc
format long
% f(x) = x.tg(x)-1 = 0
% Primeira etapa de localização
%grafico2
a = pi/4
b = 1
xi = 0.8
% Segunda etapa de determinação da raiz com erro controlado
criterio = 1e-15
x = fNR(xi,criterio)
x = fNRdernum(xi,criterio)
x = fMIL(xi,criterio)
x = fBissecao(a,b,criterio)
x = falsaPosicao(a,b,criterio)
