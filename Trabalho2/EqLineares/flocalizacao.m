function xi = flocalizacao(n,coef)

%Propriedade 9
r=1+max(abs(coef(2:n+1)))/abs(coef(1));
raio9(1:n)=complex(r,r);
%xi(1:n)=complex(r,r);

%Cota de Cauchy
crit = 1e-15;
limite = 1000;
passo = 0;
xi = 0;
dif  = 1;
while dif > crit  && passo < limite
  formula = 0;
  expoente = 0;
  for indice = n+1: -1 : 2
    formula = formula + (abs(coef(indice)/coef(1)))*xi^expoente;
    expoente++;
  end
  passo = passo + 1; %
  x = formula^(1/n); %
  dif = abs(x - xi);
  xi = x;
end
raioCauchy(1:n) = complex(x,x);
xi(1:n) = complex(x*0.2,x*0.2);

%Cota de Kojima
%for indice = 1 : n
%    sequencia(indice)  = (abs(coef(indice + 1))/abs(coef(1)))^(1/indice);
%end

%if sequencia(1) < sequencia(2)
%    m2 = sequencia(1); % segundo maior
%    m1 = sequencia(2); % maior
%else
%    m2 = sequencia(2); % segundo maior
%    m1 = sequencia(1); % maior
%end

%for i = 3 : n
%    if sequencia(i) >= m2
%      if sequencia(i) >= m1
%        m2 = m1;
%        m1 = sequencia(i);
%      else
%        m2 = sequencia(i);
%      end
%    end
%end
%raioKojima(1:n) = complex(m2+m1, m2+m1);
%xi(1:n) = complex((m2+m1)*0.2, (m2+m1)*0.2);

end
