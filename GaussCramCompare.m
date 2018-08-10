N=10;
table_calc=zeros(N, 2);
for i=3:N
   [table_calc(i, 1), table_calc(i, 2) ] = StepCounter(i, N);
end
plot(table_calc, '*')