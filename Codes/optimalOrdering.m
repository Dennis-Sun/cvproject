function ops = optimalOrdering(img, nrows_removed, ncols_removed, energyMethod)
    addpath('~/Dropbox/CS766/Seam-Carving-Matlab-master/');
    % corner case
    if nrows_removed >= size(img,1) || ncols_removed >= size(img,2)
        error('Improper parameters for number of rows/cols removed');
    end
    
    % compute transport map T(rxc), which holds the minimal cost needed to
    % obtain an image of size (n-r)x(m-c)
    % starts with T(1,1) = 0, we need to fill each entry and get to T(r,c)
    r = nrows_removed+1;
    c = ncols_removed+1;
    T = zeros(r,c);
    bitmap = false(r,c);
    
    % fill the first col of T
    I = img;
    for i=2:r
        E = imenergy(I, energyMethod);
        [S,Senergy] = Vseam(E);
        I = rm_Vseam(I, S);
        T(i,1) = T(i-1,1) + Senergy;
    end
    
    % fill the first row of T
    I = img;
    for i=2:c
        % get the cost for a vertical seam removal
        E = imenergy(I, energyMethod);
        [S,Senergy] = Hseam(E);
        I = rm_Hseam(I, S);
        T(1,i) = T(1,i-1) + Senergy;
        bitmap(1,i) = 1;
    end
    
    % apply the dynamic programming process
    I = img;
    E = imenergy(I, energyMethod);
    [S,~] = Vseam(E);
    I1 = rm_Vseam(I, S);
    E1 = imenergy(I1, energyMethod);
    [S,~] = Hseam(E);
    I2 = rm_Hseam(I, S);
    E2 = imenergy(I2, energyMethod);
    for i=2:r
        I_1 = I1;
        I_2 = I2;
        for j=2:c
            fprintf('iteration: i=%d, j=%d\n',i,j);
            % a/E1: horizontal seam
            [Sh,Senergyh] = Hseam(E1);
            I3 = rm_Hseam(I1, Sh);
            a = T(i-1,j) + Senergyh;
            % b/E2: vertical seam
            [Sv,Senergyv] = Vseam(E2);
            I4 = rm_Vseam(I2, Sv);
            b = T(i,j-1) + Senergyv;
            % decide & iterate E2
            if a < b
                T(i,j) = a;
                bitmap(i,j) = 0;
                E2 = imenergy(I3, energyMethod);
            else
                T(i,j) = b;
                bitmap(i,j) = 1;
                E2 = imenergy(I4, energyMethod);
            end
            % iterate E1
            [S,~] = Vseam(E1);
            I1 = rm_Vseam(I1, S);
            E1 = imenergy(I1, energyMethod);
        end
        I_1 = rm_Hseam(I_1, S);
        I1 = I_1;
        E1 = imenergy(I1, energyMethod);
        I_2 = rm_Hseam(I_2, S);
        I2 = I_2;
        E2 = imenergy(I2, energyMethod);
    end
    
    % recover the seam removal operations
    ops = false(r+c-2,1);
    i = r; j = c;
    while i > 1 || j > 1
        if bitmap(i,j) == 0
            ops(i+j-2,1) = 0; % 0 for horizontal seam removal
            i = i-1;
        else
            ops(i+j-2,1) = 1; % 1 for vertical seam removal
            j = j-1;
        end
    end
    if j > 1 % when i==1
        ops(1:j,1) = 1;
    end
end