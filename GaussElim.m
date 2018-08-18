%% Initialization
format short
clear all;
num_col=3;
N=20;

%% Populate vectors A and b using Random numbers

% Generate A from random no. combination
row=zeros(num_col, num_col);
for i=1:num_col
    row(i,:)=randperm(N,num_col);
end

% Generate b from random no. combination
A = row;
b=randperm(N,num_col);
nstep=num_col-1;

%% Solution of Ax = b by Gauss Elmination

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

disp([A b'])
