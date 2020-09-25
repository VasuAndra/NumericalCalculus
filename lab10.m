%lab10

%splinie liniara

% f=@(x) sin(x);
% a=-pi/2;
% b=pi/2;
% %constr datele
% n=10; %2,4,10,...
% X=linspace(a,b,n+1);
% Y=f(X);
% 
% %interpolarea 
% xgrafic=linspace(a,b,100);
% for i=1:100
%     ygrafic(i)=SplineL(X,Y,xgrafic(i));    
% end
% 
% plot(xgrafic,f(xgrafic));
% hold on
% plot(xgrafic,ygrafic);


%splinie liniara vector

% f=@(x) sin(x);
% a=-pi/2;
% b=pi/2;
% %constr datele
% n=10; %2,4,10,...
% X=linspace(a,b,n+1);
% Y=f(X);
% 
% %interpolarea 
% xgrafic=linspace(a,b,100);
% 
% ygrafic=SplineLVect(X,Y,xgrafic);    
% 
% 
% plot(xgrafic,f(xgrafic));
% hold on
% plot(xgrafic,ygrafic);


%splinie cubica vector

f=@(x) sin(x);
a=-pi/2;
b=pi/2;
%constr datele
n=10; %2,4,10,...
X=linspace(a,b,n+1);
Y=f(X);

%interpolarea 
xgrafic=linspace(a,b,100);

ygrafic=SplineLVect(X,Y,xgrafic);    


plot(xgrafic,f(xgrafic));
hold on
plot(xgrafic,ygrafic);


function[y]=SplineL(X,Y,x)

    n=length(X)-1;
    for j=1:n
        a(j)=Y(j);
        b(j)=(Y(j+1)-Y(j))/(X(j+1)-X(j));
    end
    
    for j=1:n
        if x>= X(j) && x<=X(j+1)
            S=a(j)+b(j)*(x-X(j));
            break;
        end
        
    end
    y=S;

end

function[y]=SplineLVect(X,Y,x)

    n=length(X)-1;
    for j=1:n
        a(j)=Y(j);
        b(j)=(Y(j+1)-Y(j))/(X(j+1)-X(j));
    end
    
    for j=1:n
        index = x >= X(j) & x <= X(j+1)
        S(index)=a(j)+b(j)*(x(index)-X(j));
        
    end
    y=S;

end
function[y]=SplineCVect(X,Y,x)

    n=length(X)-1;
    B=zeros(n+1);
    for i=2:n
        B(i,i)=4;
        B(i,i-1)=1;
        B(i,i+1)=1;
        T(i)=(3/(X(i+1)-X(i)))*(Y(j+1)-Y(j-1));
        
    end
    B(1,1)=1;
    B(n+1,n+1)=1;
    b=B\T;
    
    
    for j=1:n
        a(j)=Y(j);
        c(j)=(3/(X(j+1)-X(j)).^2)*(Y(j+1)-Y(j))-(b(j+1)+2*b(j))/(X(j+1)-X(j));
        d(j)=(-2/(X(j+1)-X(j)).^3)*(Y(j+1)-Y(j))+(1/((X(j+1)-X(j)).^2))*(b(j+1)+b(j));
        
    end
    
    for j=1:n
        index = x >= X(j) & x <= X(j+1)
        S(index)=a(j)+b(j)*(x(index)-X(j))+c(j)*(x(index)-X(j)).^2;
    end
    y=S;

end