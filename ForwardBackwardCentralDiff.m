clear ForwardBackwardCentralDiff;
% Step size and x
x=0.5;
h=0.25;
a=x+h;
b=x-h;

%function to evaluate the polynomial
f = @(x) -0.1*x^4 - 0.15*x^3 - 0.5*x^2 - 0.25*x + 1.2;

%Calculation formulae
forward_diff=(f(a)-f(x))/h;
backward_diff=(f(b)-f(x))/h;
central_diff=(f(a)-f(b))/(2*h);

fprintf('The forward difference is %f ', forward_diff );
fprintf('\n The backward difference is %f ', backward_diff );
fprintf('\n The central difference is %f \n ', central_diff );