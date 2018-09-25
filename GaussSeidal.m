clear all
format short

%Change dflag to zero for non-diagonally dominant case
dflag=1;

if (dflag==1)
% Input is diagonally dominant
I = [6,4,2;5,7,1;2,1,9];
b = [2;1;3];
elseif(dflag==0)
I = [5,7,1;2,1,9;6,4,2];
b = [1;3;2];    
end

% Get the augmented matrix
A=[I b];

%Parameters
N=100;
tol=10e-4;
sol=zeros(3, N);
sol(:, 1) = [1;-1;-1]; 
check=0;

%Solution
for i=2:N
    
    %Iterations
    sol(1, i)=(A(1, 4)-A(1,2)*sol(2, i-1)-A(1,3)*sol(3, i-1))/A(1,1);
    sol(2, i)=(A(2, 4)-A(2,1)*sol(1, i)-A(2,3)*sol(3, i-1))/A(2,2);
    sol(3, i)=(A(3, 4)-A(3,1)*sol(1, i)-A(3,2)*sol(2, i))/A(3,3);
    
    %Difference of values in successive iterations
    delx=abs(sol(1, i)-sol(1, i-1));
    dely=abs(sol(2, i)-sol(2, i-1));
    delz=abs(sol(3, i)-sol(3, i-1));
    
    %Check against tolerence
    if(delx<tol && dely<tol && delz<tol)
        % Flag for debug
        check=1;
        
        % Results
        fprintf('Solution is:\n')
        disp(sol(:,i))
        fprintf('\n No. of iterations:\n')
        disp(i)
        break;
    end
end

if(check==0)
    fprintf('Check diagonal dominance of matrix or change tolerance and N\n')
end