%lab 3
%A=zeros(n,m) creeaza o matr cu 0 cu n linii si m coloane
%A=ones(n,m)
%cand se face functia intr-un script separat, trebuie sa 
%aiba acelasi nume ca fct si ambele fisiere sa fie in acelasi 
%fisier

%subDesc
% A=[1 0 1;0 1 2;0 0 -6];
% b=[4;8;-18]; %vector coloana

% x=subsDes(A,b);
% x
%Gauss fara pivotare
% A=[0 1 2;1 0 1;3 2 1];
% b=[8;4;10];
% y=GFP(A,b);
% y
A=[0 1 -2;2 -2 0;1 2 1];
b=[-5;-6;5];
y=GFP(A,b);
y

%Gauss pivotare partiala
% A1=[1 0 1;0 1 2;3 2 1];
% b1=[4;8;10];
% y1=GPP(A1,b1);
% y1

%Gauss pivotare totala
% C=10^20;
% A2=[1 C ;1 1];
% b2=[C;2];
% y2=GPT(A2,b2);
% y2





function[x]=subsAsc(A,b)
    n=length(A);
    x=zeros(n,1); %vector cu n linii si 1 coloana
    x(1)=(1/A(1,1))*b(1);
    for k=2:n
        sum=A(k,1:k-1)*x(1:k-1);
        x(k)=(1/A(k,k))*(b(k)-sum);
    end
end

function[x]=subsDes(A,b)
    n=length(A);
    x=zeros(n,1);
    x(n)=b(n)/A(n,n);
    
    for i=n-1:-1:1
        sum=A(i,i+1:n)*x(i+1:n);
        x(i)=(b(i)-sum)/A(i,i);
    end
end

function[x]=GFP(A,b)
    n=length(A);
    A=[A b]; %matr A i se adauga coloana b
    
    for k=1:n-1
        p=find(A(k:n,k),1,'first'); %de la linia k pana la n; coloana k  ;cate ;al catelea
        if isempty(p)
            fprintf('Sistem incompatibil sau sistem compatibil nedetrm');
            return;
            break;
        else
            p=p+k-1;
        end
        A([p k],:)=A([k p],:);
        for l=k+1:n
            A(l,:)=A(l,:)-A(l,k)/A(k,k)*A(k,:);
        end
    end
    x=subsDes(A(1:n,1:n),A(1:n,n+1));
end

function[x]=GPP(A,b)
    n=length(A);
    A=[A b]; %matr A i se adauga coloana b
    
    for k=1:n-1
        [val,p]=max(abs(A(k:n,k)));
        if isempty(p)
            fprintf('Sistem incompatibil sau sistem compatibil nedetrm');
            break;
        else
            p=p+k-1;
        end
               
        if p~=k
            A([p k],:)=A([k p],:);
        end
        
        for l=k+1:n
            A(l,:)=A(l,:)-A(l,k)/A(k,k)*A(k,:);
        end
    end
    
    if A(n,n)==0
        fprintf('Sistem incompatibil sau sistem compatibil nedetrm');
        return;
    end
        
    x=subsDes(A(1:n,1:n),A(1:n,n+1));
end

function[x]=GPT(A,b)
    n=length(A);
    index=1:n;
    for i=1:n
    index(i)=i;
    end
    A=[A b]; %matr A i se adauga coloana b
    
    for k=1:n-1
        valmax=max(abs(A(:)));
        [p,m]=max(abs(A(k:n,k:n)));
        %[p,m]=find(abs(A)==valmax,1,'first');
        if isempty(p) && isempty(m)
            fprintf('Sistem incompatibil sau sistem compatibil nedetrm');
            break;
        else
            p=p+k-1;
            if valmax==0
                fprintf('Sistem incompatibil sau sistem compatibil nedetrm');
                return;
            end
                
        end
        if p~=k
            A([p k],:)=A([k p],:);
        end
        
        if m~=k
            A([m k],:)=A([k m],:);
            index(m,:)=index(k,:);
        end
        
        for l=k+1:n
            A(l,:)=A(l,:)-A(l,k)/A(k,k)*A(k,:);
        end
    end
    
    if A(n,n)==0
        fprintf('Sistem incompatibil sau sistem compatibil nedetrm');
        return;
    end
        
    y=subsDes(A(:,1:n),A(1:n,n+1));
    
    for i=1:n
    x(index(i))=y(i);
    end
end
            
    
    
        
    