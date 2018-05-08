% Couple:
img = imread('~/Dropbox/CS766/Programs/images/Couple.png');
mask = imread('~/Dropbox/CS766/Programs/images/Couple_mask1.png');
protect=imread('~/Dropbox/CS766/Programs/images/Couple_protect.png');

img0=img;
for i=1:size(mask,1)
    for j=1:size(mask,2)
       if(mask(i,j)==1)
          img0(i,j,2)=255; 
       elseif(protect(i,j)==1)
          img0(i,j,1)=255; 
       end
    end
end
imwrite(img0, 'images/Couple_protect_mask.png');


% create mask:
mask = roipoly(img);
imwrite(mask, 'images/Couple_mask1.png');

protect = roipoly(img);
imwrite(protect, 'images/Couple_protect.png');

% insert seams back to original size or not:
seaminsert=1;
img_objrm =object_removal(img,mask,protect,seaminsert);
imwrite(img_objrm,'images/Couple_objrm2.png');

% Beach:
img = imread('~/Dropbox/CS766/Programs/images/Beach.png');
mask = imread('~/Dropbox/CS766/Programs/images/Beach_pigeon_mask.png');
% create mask:
mask = roipoly(img);
imwrite(mask, 'images/Beach_pigeon_mask.png');
seaminsert=0;
img_objrm =object_removal(img,mask,protect,seaminsert);
imwrite(img_objrm, 'images/Beach_pigeon_removed.png');

img = imread('~/Dropbox/CS766/Programs/images/Beach.png');
mask = imread('~/Dropbox/CS766/Programs/images/Beach_pigeon_mask.png');
% create mask:
mask = roipoly(img);
imwrite(mask, 'images/Beach_girl_mask.png');
mask=imread('~/Dropbox/CS766/Programs/images/Beach_girl_mask.png');
seaminsert=0;
img_objrm =object_removal(img,mask,protect,seaminsert);
imwrite(img_objrm, 'images/Beach_girl_removed.png');
imwrite(I, 'images/Beach_girl_removed_resized.png');
