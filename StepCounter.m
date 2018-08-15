function [gauss_total, cram_multiply] = StepCounter(num_col, N)

%% Initialization
format short
gauss_add=0;
gauss_multiply=0;
cram_multiply=0;

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
        gauss_add=gauss_add+1;
        gauss_multiply=gauss_multiply+2;
    end
end

x = zeros(num_col, 1);

sum=0;
for i=num_col:-1:1
    j=i:num_col;
    x(i, 1)=(Ab(i,num_col+1)-sum)/Ab(i, i);
    gauss_add=gauss_add+1;
    gauss_multiply=gauss_multiply+1;
    if(i>1)
        sum=0;
        for p=1:numel(j)
            sum=sum+x(j(p))*Ab(i-1,j(p));
            gauss_add=gauss_add+1;
            gauss_multiply=gauss_multiply+1;
        end
    end
end

gauss_total=gauss_add+gauss_multiply;

%% Solution of Ax = b by Cramer's Rule

% Available info from matrix generation: A, b, num_col

dA=det(A);

y=zeros(1, num_col);
for i=2:num_col-1
    R=[A(:, 1:i-1) b' A(:, i+1:num_col)];
    y(i)=det(R)/dA;
    cram_multiply=cram_multiply+1;
    cram_multiply=cram_multiply+num_col*factorial(num_col);
end

R1=[b' A(:, 2:num_col)];
R_end=[A(:, 1:num_col-1) b'];
y(1)=det(R1)/dA;
y(num_col)=det(R_end)/dA;
cram_multiply=cram_multiply+2;
cram_multiply=cram_multiply+3*num_col*factorial(num_col);

end


