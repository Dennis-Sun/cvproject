img = imread('~/Dropbox/CS766/Programs/bench3.png');
addpath('~/Dropbox/CS766/Seam-Carving-Matlab-master/')

energyMethod = 0;           % energy function

I = normalize( img );
I_rmVseam=I;
NewMask = false(size(I,1),size(I,2));
cols_rm = uint8(size(I,2)/2);     % number of columns to remove

% remove vertical seams
for c=1:cols_rm
    E = imenergy(I,energyMethod);
%     [S,~]=Vseam2(E,I);
    [S,~,~]=Vseam(E);
    NewMask=addVSeamToImg(NewMask,S);
    I=rm_Vseam(I,S);
end

I_rmVseam(NewMask) = 1;
imshow(I_rmVseam)
imwrite(I_rmVseam,'./bench_rmVseams.png');
imwrite(I,'./bench_rm.png');
% imwrite(I_rmVseam,'./bench_rmVseams2.png');
% imwrite(I,'./bench_rm2.png');