function I1 =rm_Vseam(I,S)
% remove vertical seam S
n=size(I,1);
m=size(I,2);
I1=I(:,1:(m-1),:);
for i=1:n
    I1(i,S(i):m-1,:)=I(i,(S(i)+1):m,:);
end
