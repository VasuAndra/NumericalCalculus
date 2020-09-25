%Titlu:Lab1
%Autor:Vasu Andra
% x=15;
% 
% v=[1 2 3 4];
% w=[1;2;3;4];
% v*w;
% 
% %w' este transpusa
% v.*w';
% %v. ^2 ia element cu element si apoi ridici la a doua
% v.^2;
% %clear %curata workspace
% 
% %clc %curata command window
% 
% a=1:100; %vector de la 1 la 100
% a=1:2:100; %de la 1 din 2 in 2 pana la 100
% a=linspace(0,1,100); %de la 0 la 1 si cate nr sunt intre capete
% 
% % %ex1 
% f=@(x) x.^3-7*x.^2+14*x-6;
% interval=linspace(-10,10,100);
% f(1);
% f(3.2);
% g=@(x) 3*x.^2-14*x+14;
% and=roots(g)
% 
% %deseneaza toata functia(pe tot domeniul dat)
% f(interval);
% plot(interval,f(interval))

%b
f=@(x) x.^2+2*x-1;
hold on
eps=10^(-5);
xaprox1=metbisectie(f,0,1,eps);
plot(xaprox1,f(xaprox1),'*')
% hold on
% xaprox2=metbisectie(f,1,3.2,eps);
% plot(xaprox2,f(xaprox2),'*')
% hold on
% xaprox3=metbisectie(f,3.2,4,eps);
% plot(xaprox3,f(xaprox3),'*')


% %ex2
% y1=@(x) exp(x)-2;
% y2=@(x) cos(exp(x)-2);
% y3=@(x) exp(x)-2-cos(exp(x)-2);
% %a
% %functia pe tot domeniul
% interval=linspace(0.5,1.5,100);
% plot(interval,y1(interval));
% hold on
% interval=linspace(0.5,1.5,100);
% plot(interval,y2(interval));
% hold on
% interval=linspace(0.5,1.5,100);
% plot(interval,y3(interval));
% %b
% eps=10^(-5);
% xaprox1=metbisectie(y3,0.5,1.5,eps);
% plot(xaprox1,y3(xaprox1),'*');

%ex3 in lab2

%a
%floor mai mic;ceil mai mare
function[xaprox]=metbisectie(f,a,b,eps)
    azero=a;bzero=b;xzero=(azero+bzero)/2;
    fprintf('a:');
    azero
    fprintf('b:');
    bzero
    fprintf('x:');
    xzero
    N=floor(log2((b-a)/eps)-1)+1;
    for k=1:N
        if f(xzero)==0
            x1=xzero;
            break;
        elseif f(xzero)*f(azero)<0
            a1=azero;b1=xzero;x1=(a1+b1)/2;
        elseif f(xzero)*f(azero)>0
            a1=xzero;b1=bzero;x1=(a1+b1)/2;
        end
        azero=a1;bzero=b1;xzero=x1;
        
    fprintf('a:');
    azero
    fprintf('b:');
    bzero
    fprintf('x:');
    xzero
    end
    xaprox=x1;
end
    
