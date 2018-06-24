clear RoundoffErrorVariation;
N=11;
central_diff=zeros(1, N);
true_diff=zeros(1, N);
h=zeros(1, N);

% Step size and x
x=0.5;
h(1)=1;    %Starting value of h

%function to evaluate the polynomial
f = @(x) -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25.*x + 1.2;
df = @(x) -0.4*x.^3 - 0.45*x.^2 - x - 0.25;

%Calculation of central_diff
for j=2:N
    h(j)=h(j-1)/10;
    central_diff(j)=(f(x+h(j))-f(x-h(j)))/(2*h(j));
    true_diff(j)=df(x);
end

%Calculation of error
err=abs(true_diff-central_diff);

%Output
L=[h' central_diff' err'];
fprintf('     step_size      central_difference_values      error\n')
disp(L);

%Plotting
loglog(h, err), xlabel('Step Size'), ylabel('Error') %%plot log-log plot
title('Plot of error with varying time steps')