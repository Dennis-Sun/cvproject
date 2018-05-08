%% Preparation
% load img
img = imread('~/Dropbox/CS766/Programs/dolphin.png');
% img = imread('~/Dropbox/CS766/Programs/desert.jpg','jpg');
% img = imread('~/Dropbox/CS766/Programs/Fuji.png');
% img = imread('~/Dropbox/CS766/Programs/edo.png');
addpath('~/Dropbox/CS766/Seam-Carving-Matlab-master/')

% set parameters
energyMethod = 0;           % energy function
% rows_add = 0;     % number of rows to add

%% 50% enlarging
I = normalize(img);
[h,w,~] = size(I);
cols_add = uint8(w/2); % number of columns to add
% cols_add = 153; % for 'edo.jpg' only
I_new=I;
I_dup=I;
NewMask = false(h,w);
S_matrix = zeros(h, cols_add); % for storing cols_add seams

% remove vertical seams; here avoid adding the same seam to the img repeatedly
for c=1:cols_add
    E = imenergy(I_dup,energyMethod);
%     [S,~,~]=Vseam(E);
    [S,~]=Vseam2(E,I_dup);
    NewMask=addVSeamToImg(NewMask,S);
    I_dup=rm_Vseam(I_dup,S);
    S_matrix(:,c) = S;
end

% adjust seams's frame of reference: credit to ...
% {github.com/rodrigo-pena/seam-carving/blob/master/find_k_seams.m}
for c = cols_add:-1:2
    S_matrix(:,c:cols_add) = S_matrix(:,c:cols_add) + ...
        (S_matrix(:, c:cols_add) >= repmat(S_matrix(:, c - 1), [1, cols_add - c + 1]));
end

% apply adjust S_matrix to orig img
for c = 1:cols_add
    I = add_Vseam(I,S_matrix(:,c));
end

I_new(NewMask) = 1;

imshow(I_new)
% imwrite(I_new,'./dolphin_add_50percentcols_Vseams.png');
% imwrite(I,'./dolphin_add_50percentcols.png');
imwrite(I_new,'./dolphin2_add_50percentcols_Vseams.png');
imwrite(I,'./dolphin2_add_50percentcols.png');
% imwrite(I_new,'./Fuji_add_50percentcols_Vseams.png');
% imwrite(I,'./Fuji_add_50percentcols.png');
% imwrite(I_new,'./edo_add_50percentcols_Vseams.png');
% imwrite(I,'./edo_add_50percentcols.png');

% imwrite(I_new,'./desert_add_50percentcols_Vseams.png');
% imwrite(I,'./desert_add_50percentcols.png');

%% 100% enlarging (50% twice)
I_new=I;
I_dup=I;
[h,w,~] = size(I);
NewMask = false(h,w);
S_matrix = zeros(h, cols_add); % for storing cols_add seams

% remove vertical seams; here avoid adding the same seam to the img repeatedly
for c=1:cols_add
    E = imenergy(I_dup,energyMethod);
%     [S,~,~]=Vseam(E);
    [S,~]=Vseam2(E,I_dup);
    NewMask=addVSeamToImg(NewMask,S);
    I_dup=rm_Vseam(I_dup,S);
    S_matrix(:,c) = S;
end

% adjust seams's frame of reference: credit to ...
% {github.com/rodrigo-pena/seam-carving/blob/master/find_k_seams.m}
for c = cols_add:-1:2
    S_matrix(:,c:cols_add) = S_matrix(:,c:cols_add) + ...
        (S_matrix(:, c:cols_add) >= repmat(S_matrix(:, c - 1), [1, cols_add - c + 1]));
end

% apply adjust S_matrix to orig img
for c = 1:cols_add
    I = add_Vseam(I,S_matrix(:,c));
end

I_new(NewMask) = 1;
    
imshow(I_new)
imwrite(I_new,'./dolphin_add_100percentcols_Vseams.png');
imwrite(I,'./dolphin_add_100percentcols.png');