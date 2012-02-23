function x = Gaussian_Elimination(A,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if(size(A,1)~=size(A,2))
        disp('A is not a square matrix');
        exit;
    end
    if(det(A)==0)
        disp('A is singular');
        exit;
    end
    dim=size(A,1);
    A_b=[A b];
    for i=1:dim
        if(A_b(i,i)==0)
            disp('need pivoting');
            [value,index]=max(abs(A_b(i+1:dim,i)));
            tmp=A_b(i+index,:);
            A_b(i+index,:)=A_b(i,:);
            A_b(i,:)=tmp;
        end
        multiple=A_b(i+1:dim,i)./A_b(i,i);
        tt=bsxfun(@times,A_b(i,:),multiple);
        A_b(i+1:dim,:)=A_b(i+1:dim,:)-tt;
        
    end
  x=Solve_BackSub(A_b(:,1:dim),A_b(:,dim+1));
%     x=A_b(:,1:dim)\A_b(:,dim+1);
    

end

function x=Solve_BackSub(A,b)

    dim=size(A,1);
    x=zeros(dim,1);
    for i=dim:-1:1
        sum=0;
        if(i~=dim)
            sum=A(i,i+1:dim)*x(i+1:dim);
            
        end
        x(i)=(b(i)-sum)./A(i,i);
              
    end
end

