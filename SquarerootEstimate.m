a=2; %a is the input numeber, the square root of which is estimated
x=a;
error=1;
while (error>0.001)
    root=(x + (a/x))/2;
    error = x - root;
    x=root;
end
fprintf('Square root is %f', root);



