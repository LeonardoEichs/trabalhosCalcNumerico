function x=fBissecao(a,b,criterio)
%Método da bisseção só funciona para intervalos {a,b} onde f(x) seja contínua e 
%que exista uma única raiz no intervalo
dif = 1;
passos = 0;
limite = 100;
while dif > criterio && passos < limite
    passos = passos + 1;
    xMedio = (a+b)/2;
    if fx(a)*fx(xMedio) < 0     %Teorema de Bolzano
        %a = a;
        b = xMedio;
    else
        a = xMedio;
        %b = b;
    end
    dif = abs(a-b);
end
passos
x=xMedio;
end
