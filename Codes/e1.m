function energy = e1(I)
Ix = imfilter(I, [-1,0,1], 'replicate');
Iy = imfilter(I, [-1;0;1], 'replicate');
energy=abs(Ix)+abs(Iy);
end