format short
clear all;
num_col=3;
nstep=num_col-1;

% Input Matrices
A = [6,4,2;5,7,1;2,1,9];
b = [2,1,3];

% Get augmented matrix
Ab = [A b'];

% Get lower triangular augmented matrix
for m=1:nstep
    for n=1:m
        alpha = -Ab(m+1,n)/Ab(n, n);
        Ab(m+1,:)=Ab(m+1,:)+alpha*Ab(n,:);
    end
end

x = zeros(num_col, 1);

sum=0;
for i=num_col:-1:1
    j=i:num_col;
    x(i, 1)=(Ab(i,num_col+1)-sum)/Ab(i, i);
    if(i>1)
        sum=0;
        for p=1:numel(j)
            sum=sum+x(j(p))*Ab(i-1,j(p));
        end
    end
end

fprintf('\nAugmented matrix:\n')
disp([A b'])
fprintf('Solution:\n')
disp(x)
