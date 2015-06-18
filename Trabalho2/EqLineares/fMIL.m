function x=fMIL(xi,criterio)
dif = 1;
passos = 0;
limite = 100;
while dif > criterio && passos < limite
    passos = passos + 1;
    %x = 1/tan(xi)  %Essa formula não tem diagonal dominante ( não convergiu )
    x = atan(1/xi) ;
    dif = abs(x - xi);
    xi = x;
end
passos
end
