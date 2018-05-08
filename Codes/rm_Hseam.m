function I1 =rm_Hseam(I,S)
% remove horizontal seam S
n=size(I,1);
m=size(I,2);
I1=I(1:(n-1),:,:);
for j=1:m
    I1(S(j):n-1,j,:)=I(S(j)+1:n,j,:);
end
