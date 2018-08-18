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
L=eye(num_col);

% Get lower triangular augmented matrix
for m=1:nstep
    for n=1:m
        alpha = -Ab(m+1,n)/Ab(n, n);
        L(m+1,n)=alpha;
        Ab(m+1,:)=Ab(m+1,:)+alpha*Ab(n,:);
    end
end

U=Ab;
U=U(1:end, 1:end-1);

disp(A)