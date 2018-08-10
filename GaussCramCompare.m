N=10;
table_calc=zeros(N, 2);
for i=3:N
   [table_calc(i, 1), table_calc(i, 2) ] = StepCounter(i, N);
end
%plot(table_calc, '*')
hold on
x=3:N;
%gauss_analytical=2/3*x.^3+3/2*x.^2 - x./2;
gauss_analytical=x.^3;
cramer_analytical=factorial(x);
semilogy(gauss_analytical, 'r*')
hold on
semilogy(cramer_analytical, 'b*')
