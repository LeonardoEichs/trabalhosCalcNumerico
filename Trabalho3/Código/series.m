clear;
clc;
format long;


a = 1;
b = 2;
ti = 0; % Ponto médio do intervalo t[-1,1] por expansão de Série de Taylor

tPlot = [-1 : 1/100 : 1];
xPlot = 0.5 * (b-a).*tPlot + 0.5*(b+a);


% Calculo do valor exato
valorExato = sqrt(xPlot);



% Calculo do Gregory Newton Interpolado
n = 3;
h = (b-a)/n;
x = a : h : b
y = sqrt(x)

ygregorynewton = fgregorynewton(n, x, y, xPlot);
erroInterpolador = abs(ygregorynewton - valorExato)




%Serie de Taylor
n = 4;

sTaylor = fserieTaylor(tPlot, n, a, b);
erroSerieTaylor = abs(sTaylor - valorExato)




% Serie de Chebyschev

% Passo 1
% 0.00283505757266572  -0.01701034543599429   0.20412414523193151   1.22474487139158894

% Passo 2 -> Determinar Chebyschev
% 0.00283505757266572*(T3+3*T1)/4 - 0.01701034543599429*(T2+T0)/2 + 0.20412414523193151*T1 + 1.22474487139158894*T0
% 1.21623969867359 T0+0.206250438411431 T1-0.0085051727179971 T2+0.00070876439316643 T3

% Passo 3 -> avaliar o erro de truncamento
% erro de truncamento MCLAUREN(max) = 0.0156250000000000
% erro de truncamento CHEBYSCHEV(max) = 0.00308641975308642 é menor que o erro de truncamento de mclauren

% Passo 4 -> pegar a série truncada e escrever em termos de x
% 0.0028350575726657 t^3-0.017010345435994 t^2+0.20412414523193 t+1.2247448713916

coef = [-0.017010345435994 0.2041241452319 1.2247448713916];

sChebyschev = fserieCheby(tPlot, length(coef)-1, coef);
erroCheby = abs(sChebyschev - valorExato)




% Calculo do polinomio racional de Padé

sPade = fPade(tPlot, a, b);
erroPade = abs(sPade - valorExato)


erroMaxInterpolador = max(erroInterpolador)
erroMaxSerieTaylor = max(erroSerieTaylor)
erroMaxCheby = max(erroCheby)
erroMaxPade = max(erroPade)



plot( xPlot, erroSerieTaylor, "b;'Erro Taylor';")
%plot( xPlot ,valorExato , "y;'Valor Exato';", xPlot , ygregorynewton, "r;'GregoryNewton';",xPlot , sTaylor, "b;'Serie Taylor';", xPlot , sChebyschev, "k;'ChebySchev';", xPlot , sPade, "g;'Padé';", 2.2,0.7)


%plot( xPlot ,valorExato , "y;'Valor Exato';", xPlot , ygregorynewton, "r;'GregoryNewton';", 2.2,0.7)





