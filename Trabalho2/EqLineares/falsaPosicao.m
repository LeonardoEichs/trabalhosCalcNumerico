function x=falsaPosicao(a,b,criterio)
%Método da bisseção só funciona para intervalos {a,b} onde f(x) seja contínua e 
%que exista uma única raiz no intervalo
dif = 1;
passos = 0;
limite = 100;
xMedioI = (a+b)/2;
while dif > criterio && passos < limite
    passos = passos + 1;
    xMedio = (a*fx(b) - b*fx(a))/(fx(b) - fx(a));
    if fx(a)*fx(xMedio) < 0     %Teorema de Bolzano
        %a = a;
        b = xMedio;
    else
        a = xMedio;
        %b = b;
    end
    dif = abs(xMedio-xMedioI);
    xMedioI = xMedio;
end
passos
x=xMedio;
end
