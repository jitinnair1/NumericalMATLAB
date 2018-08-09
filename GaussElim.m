clear all;
format short


%% Generate System

% Define Size of A matrix
num_col=3;

% Generate A from random no. combination
row=zeros(num_col, num_col);
for i=1:num_col
row(i,:)=randperm(15,num_col);
end

% Generate b from random no. combination
A = row;
b=randperm(15,num_col);
nstep=num_col-1;

%% Solution by Gauss Elmination

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
x(i, 1)=(Ab(i,num_col+1)-sum)/Ab(i, i);
if(i>1)
sum=sum + Ab(i-1, i)*x(i,1);
end
end

disp([A b'])
disp(x)