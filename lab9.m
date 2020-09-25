%lab9 

%metDirecta
% %f=@(x) sin(x);
% f=@(x) exp(-x.^2);
% a=-pi/2;
% b=pi/2;
% %generam setul de date
% %n=3; %gradul polinomului pt fct cu sin
% n=7; %gradul polinomului pt fct cu exp
% X=linspace(a,b,n+1)';
% Y=f(X);
% %facem plot
% xgrafic=linspace(a,b);
% plot(xgrafic,f(xgrafic));
% 
% hold on
% ydirect=zeros(1,100);
% 
% for i=1:100
%     ydirect(i)=MetDirecta(X,Y,xgrafic(i));
% end 
% ydirect
% f(xgrafic) %verificare
% plot(xgrafic,ydirect)


%met Lagrange
f=@(x) sin(x);
a=-pi/2;
b=pi/2;

n=3; %gradul polinomului pt fct cu sin

X=linspace(a,b,n+1)';
Y=f(X);

xgrafic=linspace(a,b);
plot(xgrafic,f(xgrafic));

hold on
ydirect=zeros(1,100);
 
for i=1:100
    ydirect(i)=MetLagrange(X,Y,xgrafic(i));
end 

ydirect
f(xgrafic) %verificare
plot(xgrafic,ydirect)

function[y]=MetDirecta(X,Y,x)
    A=fliplr(vander(X));%flip Left Right %vander(X)
    a=A\Y;
    l=length(X)-1;
    y=0;
    for i=1:l+1
        y=y+(a(i)*x^(i-1));
    end

end

function[y]=MetLagrange(X,Y,x)
	y=0;
    n=length(X)-1;
    for k=1:n+1
        L=1;
        for i=1:n+1
            if i~=k
                L=L*(x-X(i))/(X(k)-X(i)); 
            end
        end
        y=y+L*Y(k);
        
    end

end