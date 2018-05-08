function E = imenergy(I,method )
% method 0:  e = |dI/dx| + |dI/dy|
% method 1:  sobel convolution
dim = size(I);

if method==0
    if length(dim) ==3
        E=e1(I(:, :, 1)) + e1(I(:, :, 2)) + e1(I(:, :, 3));
    else
        E=e1(I);
    end
elseif method==1
    if length(dim) ==3
        E=esobel(I(:, :, 1)) + esobel(I(:, :, 2)) + esobel(I(:, :, 3));
    else
        E=esobel(I);
    end
end

E=normalize(im2double(E));

% energy function
    function energy = e1(I)
        Ix = imfilter(I, [-1,0,1], 'replicate');
        Iy = imfilter(I, [-1;0;1], 'replicate');
        energy=abs(Ix)+abs(Iy);
    end

    function energy = esobel(I)
        H = fspecial('sobel');
        % Perform convolution
        Ix = imfilter(I, H, 'replicate'); % horizontal
        Iy = imfilter(I, H', 'replicate'); % vertical
        energy=abs(Ix)+abs(Iy);
    end

end