% waterfall figure;
img = imread('~/Dropbox/CS766/Programs/waterfall.png');


energyMethod = 0;           % energy function
cols_rm = 100;     % number of columns to remove

I = im2double(img);
I_rmVseam=I;
NewMask = false(size(I,1),size(I,2));
    
% remove vertical seams
for c=1:cols_rm
    E = imenergy(I,energyMethod);
    S=Vseam(E);
    NewMask=addVSeamToImg(NewMask,S);
    I=rm_Vseam(I,S);
end

I_rmVseam(NewMask) = 1;
    
imshow(I_rmVseam)
imwrite(I_rmVseam,'./waterfall_rm_100cols_Vseams.png');
imwrite(I,'./waterfall_rm_100cols.png');
     
    
%% christmas_original figure:
img = imread('~/Dropbox/CS766/Programs/christmas_original.jpg');

energyMethod = 0;           % energy function
cols_rm = 100;     % number of columns to remove

imgscale = imresize(img,[size(img,1) size(img,2)-cols_rm]);
imwrite(imgscale,'./christmas_rm_100cols_scale.png');

igcrop = imcrop(img,[50 1 size(img,2)-cols_rm size(img,1)]);
imwrite(igcrop,'./christmas_rm_100cols_crop.png');

I = im2double(img);
I_rmVseam=I;
NewMask = false(size(I,1),size(I,2));
    
% remove vertical seams
for c=1:cols_rm
    E = imenergy(I,energyMethod);
    [S,Senergy]=Vseam(E);
    NewMask=addVSeamToImg(NewMask,S);
    I=rm_Vseam(I,S);
end

I_rmVseam(NewMask) = 1;
    
imshow(I_rmVseam)
imwrite(I_rmVseam,'./christmas_rm_100cols_Vseams.png');
imwrite(I,'./christmas_rm_100cols.png');



%% christmas_original figure:
img = imread('~/Dropbox/CS766/Programs/christmas_original.jpg');

energyMethod = 0;           % energy function
rows_rm = 100;     % number of columns to remove

I = im2double(img);
I_rmHseam=I;
NewMask = false(size(I,1),size(I,2));
    
% remove vertical seams
for c=1:rows_rm
    E = imenergy(I,energyMethod);
    S=Hseam(E);
    NewMask=addHSeamToImg(NewMask,S);
    I=rm_Hseam(I,S);
end

I_rmHseam(NewMask) = 1;
    
imshow(I_rmHseam)
imwrite(I_rmHseam,'./christmas_rm_100rows_Hseams.png');
imwrite(I,'./christmas_rm_100rows.png');



%% waterfall figure:
img = imread('~/Dropbox/CS766/Programs/waterfall.png');

energyMethod = 0;           % energy function
rows_rm = 100;     % number of columns to remove

I = im2double(img);
I_rmHseam=I;
NewMask = false(size(I,1),size(I,2));
    
% remove vertical seams
for c=1:rows_rm
    E = imenergy(I,energyMethod);
    S=Hseam(E);
    NewMask=addHSeamToImg(NewMask,S);
    I=rm_Hseam(I,S);
end

I_rmHseam(NewMask) = 1;
    
imshow(I_rmHseam)
imwrite(I_rmHseam,'./waterfall_rm_100rows_Hseams.png');
imwrite(I,'./waterfall_rm_100rows.png');




%% 2. Retarget a new size:
%% charles figure:
img = imread('~/Dropbox/CS766/Programs/charles_original.png');

energyMethod = 0;           % energy function
cols_rm = 100; % number of columns to remove
rows_rm = 100;     % number of rows to remove

% 2.1 horizontal first and then vertical:
I = im2double(img);
I_rmHseam=I;
NewMask = false(size(I,1),size(I,2));
    
% remove horizontal seams
for c=1:rows_rm
    E = imenergy(I,energyMethod);
    S=Hseam(E);
    NewMask=addHSeamToImg(NewMask,S);
    I=rm_Hseam(I,S);
end

I_rmHseam(NewMask) = 1;
imwrite(I_rmHseam,'./charles_rm100rows_Hseams.png');
imwrite(I,'./charles_rm100rows.png');

I_rmVseam=I;
NewMask = false(size(I,1),size(I,2));  
% then remove vertical seams
for c=1:cols_rm
    E = imenergy(I,energyMethod);
    [S,Senergy]=Vseam(E);
    NewMask=addVSeamToImg(NewMask,S);
    I=rm_Vseam(I,S);
end

I_rmVseam(NewMask) = 1;
imwrite(I_rmVseam,'./charles_rm100rows_rm100cols_seams.png');
imwrite(I,'./charles_rm100rows_rm100cols.png');



% 2.2 vertical first and then horizontal:
I = im2double(img);
I_rmVseam=I;
NewMask = false(size(I,1),size(I,2));  
% then remove vertical seams
for c=1:cols_rm
    E = imenergy(I,energyMethod);
    [S,Senergy]=Vseam(E);
    NewMask=addVSeamToImg(NewMask,S);
    I=rm_Vseam(I,S);
end

I_rmVseam(NewMask) = 1;
imwrite(I_rmVseam,'./charles_rm100cols_seams.png');
imwrite(I,'./charles_rm100cols.png');

I_rmHseam=I;
NewMask = false(size(I,1),size(I,2));
    
% remove horizontal seams
for c=1:rows_rm
    E = imenergy(I,energyMethod);
    S=Hseam(E);
    NewMask=addHSeamToImg(NewMask,S);
    I=rm_Hseam(I,S);
end

I_rmHseam(NewMask) = 1;
imwrite(I_rmHseam,'./charles_rm100cols_rm100rows_seams.png');
imwrite(I,'./charles_rm100cols_rm100rows.png');



% 2.3 Alternate between horizontal and vertical seams:
I = im2double(img);
I_rmHVseam=I;
%NewMask = false(size(I,1),size(I,2));  
cols_rm = 100; % number of columns to remove
rows_rm = 100;     % number of rows to remove

while cols_rm >0 || rows_rm > 0
    if rows_rm > 0
    % 1) remove one horizontal seam
    fprintf('Remove horizontal seam: %d\n',rows_rm);
    E = imenergy(I,energyMethod);
    [S,Senergy,Rrm]=Hseam(E);
    %NewMask=addHSeamToImg(NewMask,S);
    I=rm_Hseam(I,S);
    rows_rm=rows_rm-1;
    end
    if cols_rm >0
    % 2) remove one vertical seam
    fprintf('Remove horizontal seam: %d\n',cols_rm);
    E = imenergy(I,energyMethod);
    [S,Senergy,Crm]=Vseam(E);
    %NewMask=addVSeamToImg(NewMask,S);
    I=rm_Vseam(I,S);
    cols_rm=cols_rm-1;
    end
end

%I_rmVseam(NewMask) = 1;
%imwrite(I_rmVseam,'./charles_rm100cols_seams.png');
imwrite(I,'./charles_rm100rows_100cols_altern.png');

    

