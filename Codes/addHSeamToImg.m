function Mask = addHSeamToImg(mask,seam)

% = false(size(I,1),size(I,2));
m = size(mask,2);
% add seam to original image, so need to shift  
for j=1:m
    % number of columns has been removed
    shift = sum(mask(1:seam(j),j));
    mask(seam(j)+shift,j) = 1;
end
Mask=mask;

