N=20;
table_calc=zeros(N-2, 2);
for i=3:N
   [table_calc(i, 1), table_calc(i, 2) ] = StepCounter(i, N);
end
subplot(1, 2, 1)
plot(table_calc, '*')
set(gca, 'YScale', 'log')
pbaspect([1 1 1])
title('Results from code')
ylabel('No. of computations')
xlabel('System Size')
legend('Gauss', 'Cramer')
hold on
x=3:N;
gauss_analytical=2/3*x.^3+3/2*x.^2 - x./2;
cramer_analytical=factorial(x);
subplot(1, 2, 2)
plot(x, gauss_analytical, '*')
set(gca, 'YScale', 'log')
pbaspect([1 1 1])
hold on
subplot(1, 2, 2)
plot(x, cramer_analytical, '*')
set(gca, 'YScale', 'log')
pbaspect([1 1 1])
title('Results from analytical solution')
ylabel('No. of computations') 
xlabel('System Size')
legend('Gauss', 'Cramer')
