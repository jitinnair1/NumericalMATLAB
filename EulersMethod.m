% Direct Computation
clear EulersMethod;
N=50;
m=68.1;
c=0.25;
g=9.81;
t=1:N;
v=zeros(1,N);
for i=1:N
    v(i)=sqrt(g*m/c)*tanh(sqrt(g*c/m)*i);
end

%Eulers Method
dt=2;
v_euler=zeros(1,N);
diff_v=zeros(1,N);
v_euler(1)=0;
diff_v(1)=g;
for j=2:N
    diff_v(j)=g-((c/m)*(v_euler(j-1))^2);
    v_euler(j)=v_euler(j-1)+diff_v(j)*dt;
end
plot (t, v, t, v_euler)
