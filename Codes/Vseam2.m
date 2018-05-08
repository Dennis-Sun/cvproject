function [S, Senergy] = Vseam2(E, I)
%% forward energy in dynamic programming
% vertical: M(i,j)=E(i,j)+min(M(i-1,j-1)+Cl, M(i-1,j)+Cu, M(i-1,j+1)+Cr)
n=size(E,1); % n = nrows
m=size(E,2); % m = ncols
M=zeros(size(E));
M(1,:)=E(1,:);
B=zeros(size(E)); % next index
Cl = CL(I); Cu = CU(I); Cr = CR(I);

for i=2:n
    for j=1:m
        if j==1
            [minM,id]=min([M(i-1,j)+Cu(i,j),...
                           M(i-1,j+1)+Cr(i,j)]);
            B(i,j)=j+id-1;
        elseif j==m
            [minM,id]=min([M(i-1,j-1)+Cl(i,j),...
                           M(i-1,j)+Cu(i,j)]);
            B(i,j)=j+id-2;
        else
            [minM,id]=min([M(i-1,j-1)+Cl(i,j),...
                           M(i-1,j)+Cu(i,j),...
                           M(i-1,j+1)+Cr(i,j)]);
            B(i,j)=j+id-2;
        end
        M(i,j)=E(i,j)+minM;
    end
end
% find the minimum value in the first row
[~, index]=min(M(1,:));
% trace forward to get seam
j=index;
S=zeros(n,1);
S(1)=j;
Senergy=M(i,j);
for i=2:n
    if j==1
        [minM,id]=min([M(i,1),M(i,2)]);
        S(i)=id;
    elseif j==m
        [minM,id]=min([M(i,m-1),M(i,m)]);
        S(i)=id+m-2;
    else
        [minM,id]=min([M(i,j-1),M(i,j),M(i,j+1)]);
        S(i)=id+j-2;
    end
    Senergy=Senergy+M(i,j);
end