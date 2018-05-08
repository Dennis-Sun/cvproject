function Mask = addVSeamToImg(mask,seam)

% = false(size(I,1),size(I,2));
n = size(mask,1);
% add seam to original image, so need to shift  
for i=1:n
    % number of columns has been removed
    shift = sum(mask(i,1:seam(i)));
    mask(i,seam(i)+shift) = 1;
end
Mask=mask;