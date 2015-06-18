function x=fNR(xi,criterio)
dif = 1;
passos = 0;
limite = 100;
while dif > criterio && passos < limite
    passos = passos + 1;
    dx = -fx(xi)/dfx(xi);
    x = xi + dx;
    xi = x;
    dif = abs(dx);
end
passos
end
