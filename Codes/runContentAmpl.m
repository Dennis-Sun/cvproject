% load img
img = imread('~/Dropbox/CS766/Programs/arch_original.png');


% set parameters
energyMethod = 0;           % energy function
magnification_rate = 1.14;

% resize to a larger img
I = normalize(img);
I2 = imresize(I,magnification_rate);
I_new = I2;
[h,w,~]=size(I);
[h2,w2,~]=size(I2);

% do seam carving to make it to the orig size
% 1) remove horizontal seams
for c=1:h2-h
    E = imenergy(I_new,energyMethod);
    S=Hseam(E);
    I_new=rm_Hseam(I_new,S);
end
% 2) then remove vertical seams
for c=1:w2-w
    E = imenergy(I_new,energyMethod);
    S=Vseam(E);
    I_new=rm_Vseam(I_new,S);
end

imshow(I2);
imwrite(I2,'./arch_magnified.png');
imshow(I_new);
imwrite(I_new,'./arch_retarget.png');
