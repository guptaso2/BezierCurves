function [ L,U ] = LU_Factorization( a )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    delta=zeros(size(a,1)+1,1);
    delta(1)=1;
    delta(2)=a(1,1);
    for k=3:size(delta,1)
        
       delta(k)=a(k-1,k-1)*delta(k-1)-a(k-1,k-2)*a(k-2,k-1)*delta(k-2);
    end
    L=eye(size(a));
    U=zeros(size(a));
    for k=2:size(L,1)
        
       L(k,k-1)=a(k,k-1)*delta(k-1)./delta(k); 
    end
    for k=1:size(U,1)
       
      
        U(k,k)=delta(k+1)./delta(k);
        if(k~=size(U,1))
            U(k,k+1)=a(k,k+1);
        end
        
        
    end

end

