function I1 =add_Vseam(I,S)
% add vertical seam S
n=size(I,1);
m=size(I,2);
I1=zeros(n,m+1,size(I,3));
for i=1:n
    if S(i)==1
        I1(i,1,:)=mean(I(i,1:3,:));
        I1(i,2:m+1,:)=I(i,1:m,:);
    elseif S(i)==m
        I1(i,1:m,:)=I(i,1:m,:);
        I1(i,m+1,:)=mean(I(i,m-2:m,:));
    else
        I1(i,1:S(i)-1,:)=I(i,1:S(i)-1,:);
        I1(i,S(i),:)=mean(I(i,S(i)-1:S(i)+1,:));
        I1(i,S(i)+1:end,:)=I(i,S(i):end,:);
    end
end