function x=fNRdernum(xi,criterio)
dif = 1;
passos = 0;
limite = 100;
dx = 0.01;
while dif > criterio && passos < limite
    passos = passos + 1;
    dfxN = (fx(xi + dx) - fx(xi))/dx;
    dx = -fx(xi)/dfxN;
    x = xi + dx;
    xi = x;
    dif = abs(dx);
end
passos
end
