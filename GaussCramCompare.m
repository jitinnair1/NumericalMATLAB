clear all
figure('position', [0, 0, 1000, 800])
N=20;
table_calc=zeros(N-2, 2);
for i=3:N
   [table_calc(i, 1), table_calc(i, 2) ] = StepCounter(i, N);
end
subplot(1, 2, 1)
plot(table_calc, '*')
set(gca, 'YScale', 'log')
pbaspect([1 1 1])
title('Results from code', 'fontsize', 24)
ylabel('No. of computations', 'fontsize', 18)
xlabel('System Size', 'fontsize', 18)
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
title('Results from analytical solution', 'fontsize', 24)
ylabel('No. of computations','fontsize', 18) 
xlabel('System Size','fontsize', 18)
legend('Gauss', 'Cramer')

%% Compare Pairwise

clf;

subplot(1, 2, 1)
plot(x, gauss_analytical','r*', x, table_calc(3:end,1), 'b*')
set(gca, 'YScale', 'log')
pbaspect([1 1 1])
title('Gauss - Analytical vs. Code', 'fontsize', 24)
ylabel('No. of computations', 'fontsize', 18)
xlabel('System Size', 'fontsize', 18)
legend('Analytical', 'Code')
hold on

subplot(1, 2, 2)
plot(x, cramer_analytical','r*', x, table_calc(3:end,2), 'b*')
set(gca, 'YScale', 'log')
pbaspect([1 1 1])
title('Cramer - Analytical vs. Code', 'fontsize', 24)
ylabel('No. of computations','fontsize', 18) 
xlabel('System Size','fontsize', 18)
legend('Analytical', 'Code')
