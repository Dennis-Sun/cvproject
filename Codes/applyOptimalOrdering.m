img = imread('~/Dropbox/CS766/Programs/charles_original.png');
addpath('~/Dropbox/CS766/Seam-Carving-Matlab-master/');

energyMethod = 0;           % energy function
cols_rm = 100; % number of columns to remove
rows_rm = 100;     % number of rows to remove

% optimal ordering
I = normalize(img);
I_new = I;
% NewMask = false(size(I,1), size(I,2));

ops = optimalOrdering(I, rows_rm, cols_rm, energyMethod);
len = size(ops,1);
for i=1:len
    if ops(i,1)==1 % vertical seam
        fprintf('Remove vertical seam\n');
        E = imenergy(I,energyMethod);
        S = Vseam(E);
%         NewMask = addVSeamToImg(NewMask,S);
        I = rm_Vseam(I,S);
    else % horizontal seam
        fprintf('Remove horizontal seam\n');
        E = imenergy(I,energyMethod);
        S = Hseam(E);
%         NewMask = addHSeamToImg(NewMask,S);
        I = rm_Hseam(I,S);
    end
end

% I_new(NewMask) = 1;

% imshow(I_new);
% imwrite(I_new, './charles_optimal.png');
imwrite(I, './charles_optimal_100cols100rows.png');