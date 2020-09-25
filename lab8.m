%lab8
% %forma patratica
% 
% f=@(x,y) 1.5*x.^2+2*x.*y+3*y.^2-2*x+8*y;
% %axele
% x=linspace(-4,6,40);
% y=linspace(-6,4,40);
% 
% [X,Y]=meshgrid(x,y);
% %surface
% surf(X,Y,f(X,Y));
% %alta figura
% figure 
% 
% contour(X,Y,f(X,Y));
% A=[3 2;2 6];
% b=[2;-8];
% m=A\b
% 
% hold on 
% %ploteaza 3 axe
% plot3(m(1),m(2),f(m(1),m(2)),'*')
% 
% [px,py]=gradient(f(X,Y))
% quiver(X,Y,px,py)

%alg
f=@(x,y) 1.5*x.^2+2*x.*y+3*y.^2-2*x+8*y;
x=linspace(-4,6,40);
y=linspace(-6,4,40);

%fig 1 batista
[X,Y]=meshgrid(x,y);
surf(X,Y,f(X,Y));

%fig 2 sagetele
figure 
contour(X,Y,f(X,Y));

A=[3 2;2 6];
b=[2;-8];
m=A\b

hold on
plot3(m(1),m(2),f(m(1),m(2)),'*')


x0=[-2;-2];
eps=10^(-5);

xaprox=PasDescendent(A,b,x0,eps,f);

plot3(xaprox(1),xaprox(2),f(xaprox(1),xaprox(2)),'*');

[px,py]=gradient(f(X,Y))
quiver(X,Y,px,py)

function [xaprox]=PasDescendent(A,b,x0,eps,f)
    V=b-A*x0;
    alfa=(V'*V)/(V'*A*V);
    x1=x0+alfa*V;
    plot3([x0(1),x1(1)],[x0(2),x1(2)],[f(x0(1),x0(2)),f(x1(1),x1(2))],'-K*');
        
    while norm((x1-x0)/x0) >= eps
        x0=x1;
        V=b-A*x0;
        alfa=(V'*V)/(V'*A*V);
        x1=x0+alfa*V;
        plot3([x0(1),x1(1)],[x0(2),x1(2)],[f(x0(1),x0(2)),f(x1(1),x1(2))],'-K*');
        
    end
    xaprox=x1;

end

