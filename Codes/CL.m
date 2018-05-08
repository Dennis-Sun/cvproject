function C = CL(I)
%% C_L cost function for image I
[h,w,~]=size(I);
C = zeros(h,w);
for i=2:h
    C(i,1)=abs(I(i,2))+abs(I(i-1,1));
    for j=2:w-1
        C(i,j) = abs(I(i,j+1)-I(i,j-1))+abs(I(i-1,j)-I(i,j-1));
    end
    C(i,w)=abs(I(i,w-1))+abs(I(i-1,w)-I(i,w-1));
end
end