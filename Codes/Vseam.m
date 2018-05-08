function [S,Senerge,Crm] = Vseam(E)
% M(i, j) = E(i, j) + min(M(i - 1, j - 1), M(i - 1, j), M(i - 1, j + 1))
% The first step is to traverse the image from the second row to the last row
n=size(E,1);
m=size(E,2);
M=zeros(size(E));
M(1,:)=E(1,:);
B=zeros(size(E));
for i=2:n
    for j=1:m
        if j==1
            [minM,id]=min([M(i-1,j), M(i-1,j+1)]);
            B(i,j)=j+id-1;
        elseif j==m
            [minM,id]=min([M(i-1,j-1), M(i-1,j)]);
            B(i,j)=j+id-2;
        else
            [minM,id]=min([M(i-1,j-1), M(i-1,j), M(i-1,j+1)]);
            B(i,j)=j+id-2;
        end
        M(i,j)=E(i,j)+minM;
    end
end


% Find minimum value in last row: minj M(n, j)
[minM,index]=min(M(n, :));
% minj=find(M(n, :) == minM);
Crm=index;
% traceback to get seam:
j=index;
S=zeros(n,1);
S(n)=j;
Senerge=E(n,index);
for i=n:-1:2
    j=B(i,j);
    S(i-1)=j;
    Senerge=Senerge+E(i-1,j);
end





