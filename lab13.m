%lab13 ex  4 din lab 12
% %MetEulerExplicita
f=@(t,x) x*cos(t)+x^2*cos(t);
[t,sol_num]=MetEulerExplicita(f,0,asin(log(2))-0.1,1,100);

sol_ex=-(exp(sin(t))./(exp(sin(t))-2));

%fig 1
plot(t,sol_ex);
hold on
plot(t,sol_num);

%fig 2
figure
plot(t,abs(sol_num-sol_ex)/abs(sol_ex));

%MetTaylor2
% f=@(t,x) x*cos(t)+x^2*cos(t);
% 
% syms arg1 arg2
% dfdt=matlabFunction(diff(f(arg1,arg2),arg1));
% dfdx=matlabFunction(diff(f(arg1,arg2),arg2));
% Df=@(t,x) dfdt(t,x)+dfdx(t,x)*f(t,x);
% 
% [t1,sol_num]=MetTaylor2(f,0,asin(log(2))-0.01,1,100,Df);
% 
% sol_ex=-(exp(sin(t1))./(exp(sin(t1))-2));
% 
% %fig 1
% plot(t1,sol_ex);
% hold on
% plot(t1,sol_num);
% 
% %fig 2
% figure
% plot(t1,abs(sol_num-sol_ex)/abs(sol_ex));

function [t,x]=MetEulerExplicita(f,t0,tf,x0,N)
    x=1:N;
    t=linspace(t0,tf,N+1);
    
    t(1)=t0;
    h=(tf-t0)/N;
    
    x(1)=x0;
    for i=1:N
        x(i+1)=x(i)+h*f(t(i),x(i));
    end
end

function [t,x]=MetTaylor2(f,t0,tf,x0,N,Df)
    x=1:N;
    t=linspace(t0,tf,N+1);
    
    t(1)=t0;
    h=(tf-t0)/N;
    
    x(1)=x0;
    for i=1:N
        x(i+1)=x(i)+h*f(t(i),x(i))+(h^2/2)*Df(t(i),x(i));
    end
end