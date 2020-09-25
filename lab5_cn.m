%lab5

%ex1
A=[1 2 3;2 5 8;3 8 14];
b=[-5;-14;-25];
[x,L]= FactCholesky(A,b);
x
L

%ex2
A=[3 1 1;21 3 1;1 1 3];
eps=10^(-4);
rez=Jacobi(A,eps);




function[x]=subsDes(A,b)
    n=length(A);
    x=zeros(n,1);
    x(n)=b(n)/A(n,n);
    
    for i=n-1:-1:1
        sum=A(i,i+1:n)*x(i+1:n);
        x(i)=(b(i)-sum)/A(i,i);
    end
end

function[x]=subsAsc(A,b)
    n=length(A);
    x=zeros(n,1); %vector cu n linii si 1 coloana
    x(1)=(1/A(1,1))*b(1);
    for k=2:n
        sum=A(k,1:k-1)*x(1:k-1);
        x(k)=(1/A(k,k))*(b(k)-sum);
    end
end

function [x,L] = FactCholesky(A,b)
    n=length(A);
    alfa=A(1,1);
    if alfa <= 0
        fprintf('Matricea nu este pozitiv definita');
        return;
    end
    L(1,1)=sqrt(A(1,1));
    
    for i=2:n
        L(i,1)=A(i,1)/L(1,1);
    end
    
    for k=2:n
        %nu merge inmultit vector linie cu vector linie;
        %deci al doilea vector trebuie facut coloana cu transpus '
        sum=L(k,1:k-1)*L(k,1:k-1)';
        alfa=A(k,k)-sum;
        if alfa<=0
            fprintf('Matricea nu este pozitiv definita');
            return ;
        end
        L(k,k)=sqrt(alfa);
        
        for i=k+1:n
            sum=L(i,1:k-1)*L(k,1:k-1)';
            L(i,k)=(1/L(k,k))*(A(i,k)-sum);
        end
    end
    
    y=subsAsc(L,b);
    x=subsDes(L',y);
     

end

function [rez]=Jacobi(A,eps)
    
    n=length(A);
    rez=1:n;
    M=A-diag(diag(A)); %matricea A diagonala principala 0
    modulA=sqrt(sumsqr(M));
    while modulA >=eps
        valmax=max(abs(M(:));
        [p,q]=find(abs(M)==valmax,1,'first');
        if A(p,p)==A(q,q)
            fi=pi/4;
        else
            fi=1/2*arctg(2*A(p,q)/A(q,q)-A(p,p));
        end
        c=cos(fi);
        s=sin(fi);
        for j=1:n
            if j~=p && j~=q
                u=A(p,j)*c-A(q,j)*s;
                v=A(p,j)*s+A(q,j)*c;
                A(p,j)=u;
                A(q,j)=v;
                A(j,p)=u;
                A(j,q)=v;
            end
        end
        u=c^2*A(p,p)-2*c*A(p,q)+s^2*A(q,q);
        v=s^2*A(p,p)-2*c*A(p,q)+c^2*A(q,q);
        A(p,p)=u;
        A(q,q)=v;
        A(p,q)=0;
        A(q,p)=0;
        
    end
    for i=1:n
        rez(i)=A(i,i);
    end
        
end

%T1 60 min;2 probleme;
%1.ec neliniare:bisectiei,NR,secanta,poz falsa; verif
%conditii(interval)+implementare
%2.metoda gauss:gauss,GPP,GPT,rang
%3. factorizari:LU,Cholesky