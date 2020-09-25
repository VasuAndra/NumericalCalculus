%lab11

%DerivNum

f=@(x) sin(x);

a=0;
b=pi;

m=100;


h=(b-a)/(m-2);
x=linspace(a-h,b+h,m+1);
y=f(x);
dy=DerivNum(x,y,'dfc');
%calc derivata
syms arg
df=matlabFunction(diff(f(arg)));

%fig 1
plot(x(2:m),df(x(2:m)));
hold on
plot(x(2:m),dy(2:m));

%fig 2
figure
plot(x(2:m),abs(df(x(2:m)) - dy(2:m)));


%MetRichardson
% f=@(x) sin(x);
% 
% a=0;
% b=pi;
% n=6; %4,6,8..
% h=(b-a)/(m-2);
% m=100;
% x=linspace(a-h,b+h,m+1);
% for i=2:m
%     %dy(i)=MetRichardson(f,x(i),h,n);
%     %cand fol der 2
%     dy(i)=MetRichardson(f,x(i),h,n-1);
%     
% end
% %calc derivata 1
% syms arg
% df=matlabFunction(diff(f(arg)));
% 
%  
% % %fig 1
% % plot(x(2:m),df(x(2:m)));
% % hold on
% % plot(x(2:m),dy(2:m));
% % 
% % % %fig 2
% % figure
% % plot(x(2:m),abs(df(x(2:m)) - dy(2:m)));
% 
% %calc derivata 2
% syms arg
% ddf=matlabFunction(diff(df(arg)));
% 
% %fig 1
% plot(x(2:m),ddf(x(2:m)));
% hold on
% plot(x(2:m),dy(2:m));
% 
%  % %fig 2
% figure
% plot(x(2:m),abs(ddf(x(2:m)) - dy(2:m)));



function [df]=MetRichardson(f,x,h,n)
    %o=@(x,h)(f(x+h)-f(x))/h;
    o=@(x,h)(f(x+h)-2*f(x)+f(x-h))/h^2;
    for i=1:n
       Q(i,1)=o(x,h/(2^(i-1))); 
    end
    for i=2:n
        for j=2:i
            Q(i,j)=Q(i,j-1)+(1/(2^(j-1)-1))*(Q(i,j-1)-Q(i-1,j-1));
        end
    end
    df=Q(n,n);
end

function [dy]=DerivNum(x,y,metoda)
    m=length(x)-1;
    switch metoda
        case 'dfp'
            for i=2:m
                dy(i)=(y(i+1)-y(i))/(x(i+1)-x(i));
            end
        case 'dfr'
            for i=2:m
                dy(i)=(y(i)-y(i-1))/(x(i)-x(i-1));
            end
        case 'dfc'
            for i=2:m
                dy(i)=(y(i+1)-y(i-1))/(x(i+1)-x(i-1));
            end
    end
end