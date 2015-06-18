
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

op = 0;

while (passo < limite && dif > criterio )

	passo++;

	i=1;
	
	op = op + 5;	
	x(i)= (1 - lambda)*xi(i) + lambda*(150-x(i+1));

	for i=2:n/2

	op = op + 8;
	x(i)=(1 - lambda)*xi(i) + lambda*(100-x(i-1)-x(i+1)-x(i+50))/3;

	end
	for i=(n/2)+1:n-1
	
	op = op + 8;
	x(i)=(1 - lambda)*xi(i) + lambda*(200-x(i-50)-x(i-1)-x(i+1))/3;
	
	end
	i=n;
	
	op = op + 5;
	x(i)=((1 - lambda)*xi(i) + lambda*(300-x(i-1)));
	

	dif = max(abs(x - xi));	
	op = op + 100;

	[passo, x]


	xi = x;


end

	op

