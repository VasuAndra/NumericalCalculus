%lab 4
%ex1
A=[0 1 -2;1 -1 1;1 0 -1];
b=[4; 6; 2];
tol=10^(-10);
Abar=[A b];

r1=Rang(A,tol);
r2=Rang(Abar,tol);
[m1,n1]=size(A);

if r1==r2 && m1==r1
    fprintf('Sistem compatibil determinat');
elseif r1==r2 && r1<m1
    fprintf('Sistem compatibil nedeterminat');
else
    fprintf('Sistem incompatibil');
end

%ex2
A3=[0 -3 -6 4;-1 -2 -1 3;-2 -3 0 3;1 4 5 -9];
r3=Rang(A3,tol);
r3
A4=[2 -2 0 0;2 1 0 0;-4 4 0 0;4 -1 10^(-20) 10^(-20)];
r4=Rang(A4,tol);
r4 

%ex3
A5=[0 1 1;2 1 5;4 2 1];
[L1,U1,w1]=LU(A5);
%L
%U
%w

%ex4
A4=[0 1 1 ;2 1 5;4 2 1];
b4=[3;5;1];
[L2,U2,w2]=LU(A4);

y=subsAsc(L2,b4(w2));
x=subsDes(U2,y);
x
y

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

function[rang]=Rang(A,tol)
    [m,n]=size(A); %folosim size pt ca nu e matr patratica
    h=1;
    k=1;
    rang=0;
    
    while h<=m && k<=n
        [val,p]=max(abs(A(h:m,k)));
        p=p+h-1;
        
        if val < tol
            k=k+1;
            continue
        end
        
        if p~=h 
            A([p h],:)=A([h p],:);
        end
        
        for l=h+1:m
            mlk=A(l,k)/A(h,k);
            A(l,:)=A(l,:)-mlk*A(h,:);
        end
        
        h=h+1;
        k=k+1;
        rang=rang+1;
    end
        
end

function[L,U,w]=LU(A)
    n=length(A);
    L=eye(n); %1 pe diagonala
    w=[1:n];
    
    for k=1:n-1
        [val,p]=max(abs(A(k:n,k)));
        p=p+k-1;
        
        if val ==0
            fprintf('Nu admite factorizarea LU');
            return 
        end
        
        if p~=k
            A([p k],:)=A([k p],:);
            w([p k])=w([k p]);
            
            if k>1
                L([p k],1:k-1)=L([k p],1:k-1);
            end
        end
    
        
        for l=k+1:n
            L(l,k)=A(l,k)/A(k,k);
            A(l,:)=A(l,:)-L(l,k)*A(k,:);
        end
        
        if A(n,n) ==0
            fprintf('Nu admite factorizarea LU');
            return
        end
    end
        U=A;
                
end
