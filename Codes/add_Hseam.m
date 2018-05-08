function I1 =add_Hseam(I,S)
% add horizontal seam S
n=size(I,1);
m=size(I,2);
I1=zeros(n,m+1,size(I,3));
for j=1:m
    I1(1:S(j),:,:)=I(1:S(j),:,:);
    I1(S(j)+1,:,:)=I(S(j),:,:);
    I1(S(j)+2:end,:,:)=I(S(j)+1:end,:,:);
end