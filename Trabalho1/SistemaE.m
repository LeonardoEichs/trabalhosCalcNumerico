
clc;
clear;


passo = 0;

limite = 2000;

criterio = 1.e-4;

dif = 1;

for k=1:100
	xi(k) = 0;
end

x = xi;

n=100;

lambda = 1.8;


while (passo < limite && dif > criterio )

	passo++;

	i=1;
	
	x(i)= (1 - lambda)*xi(i) + lambda*(150-x(i+1));

	for i=2:n/2

	x(i)=(1 - lambda)*xi(i) + lambda*(100-x(i-1)-x(i+1)-x(i+50))/3;

	end
	for i=(n/2)+1:n-1
	
	x(i)=(1 - lambda)*xi(i) + lambda*(200-x(i-50)-x(i-1)-x(i+1))/3;
	
	end
	i=n;
	
	x(i)=((1 - lambda)*xi(i) + lambda*(300-x(i-1)));
	

	dif = max(abs(x - xi));	

	[passo, x]


	xi = x;


end



limite = 2000;

criterio = 1.e-8;

dif = 1;

passo = 0;

xn = x;

while (passo < limite && dif > criterio )

	passo++;

	i=1;

	xn(i)= (1 - lambda)*xi(i) + lambda*(150-xn(i+1));

	for i=2:n/2
	
	xn(i)=(1 - lambda)*xi(i) + lambda*(100-xn(i-1)-xn(i+1)-xn(i+50))/3;

	end
	for i=(n/2)+1:n-1

	xn(i)=(1 - lambda)*xi(i) + lambda*(200-xn(i-50)-xn(i-1)-xn(i+1))/3;

	end
	i=n;

	xn(i)=((1 - lambda)*xi(i) + lambda*(300-xn(i-1)));
	

	dif = max(abs(xn - xi));	

	[passo, xn]


	xi = xn;


end


erroTruncamento = max(abs(x - xn))

