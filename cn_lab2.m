%Vasu Andra
%lab 2

%ex1
% f=@(x) x.^3-7*x.^2+14*x-6;
% f(2);
% interval=linspace(0,4,100);
% 
% f(interval);
% plot(interval,f(interval))
% 
% syms arg
% df=matlabFunction(diff(f(arg)));
% 
% eps=10^(-3);
% 
% hold on
% xaprox1=metNr(f,df,0.3,eps);
% plot(xaprox1,f(xaprox1),'*')
% 
% hold on
% xaprox2=metNr(f,df,2.5,eps);
% plot(xaprox2,f(xaprox2),'*')
% 
% hold on
% xaprox3=metNr(f,df,3.6,eps);
% plot(xaprox3,f(xaprox3),'*')

% %ex3 met secantei
% f2=@(x) x.^3-18*x-10;
% 
% interval=linspace(-5,5,100);
% f2(interval);
% plot(interval,f2(interval))
% 
% %calculez f2 derivata de ord 1
% f2deriv=@(x) 2*x.^2-18;
% %[x1,x2]=solve(f2deriv) ??? pot sa le retin cumva
% 
% 
% %aleg 3 intervale astfel
% %I1=[-5;prima sol a f2deriv]
% %I2=[prima sol a f2deriv;a 2a sol a f2deriv]
% %I3=(a 2a sol a f2deriv;5]
% 
% eps=10^(-5);
% 
% hold on
% xaprox1=MetSecantei(f2,-5,5,-5,-3,eps);
% plot(xaprox1,f2(xaprox1),'*')
% hold on
% xaprox2=MetSecantei(f2,-5,5,-3,3,eps);
% plot(xaprox2,f2(xaprox2),'*')
% hold on
% xaprox3=MetSecantei(f2,-5,5,3,5,eps);
% plot(xaprox3,f2(xaprox3),'*')


%ex3 met poz false
% calculez f2 derivata de ord 2
% f2derivderiv=@(x) 4*x;
% solve(f2derivderiv)
% 
% hold on
% xaprox1=MetPozFalse(f2,-5,-3,eps);
% plot(xaprox1,f2(xaprox1),'*')
% hold on
% xaprox2=MetPozFalse(f2,-3,0,eps);
% plot(xaprox2,f2(xaprox2),'*')
% hold on
% xaprox3=MetPozFalse(f2,3,5,eps);
% plot(xaprox3,f2(xaprox3),'*')




function[xaprox]=metNr(f,df,x0,eps)
    x1=x0-(f(x0)/df(x0))
    while (abs(x1-x0)/abs(x0))>=eps
        x0=x1;
        x1=x0-(f(x0)/df(x0))
    end
    xaprox=x1;
end

function[xaprox] = MetSecantei(f,a,b,x0,x1,eps) 
    
    while abs(x1-x0)/abs(x0) >= eps
        x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
        if x2 < a || x2>b
            fprintf('Introduceti alte valori pt x0 si x1');
            return;
        end
        x0=x1;
        x1=x2;
        
    end
    xaprox=x2;
end

function [xaprox] = MetPozFalse(f,a,b,eps)
   
   a0=a;
   b0=b;
   x0=(a0*f(b0)-b0*f(a0))/(f(b0)-f(a0));
   
   if f(x0)==0
       x1=x0;
       return;
   elseif f(a0)*f(x0)<0
       a1=a0;
       b1=x0;
       x1=(a1*f(b1)-b1*f(a1))/(f(b1)-f(a1));
   elseif f(a0)*f(x0)>0
       a1=x0;
       b1=b0;
        x1=(a1*f(b1)-b1*f(a1))/(f(b1)-f(a1));
   end
   
   while abs(x1-x0)/x0 >= eps
       %reactualizarea dupa k
       x0=x1;
       a0=a1;
       b0=b1;
       
       if f(x0)==0
       x1=x0;
       return;
       elseif f(a0)*f(x0)<0
           a1=a0;
           b1=x0;
           x1=(a1*f(b1)-b1*f(a1))/(f(b1)-f(a1));
       elseif f(a0)*f(x0)>0
           a1=x0;
           b1=b0;
           x1=(a1*f(b1)-b1*f(a1))/(f(b1)-f(a1));
       end
   end
   xaprox=x1;
       
end


