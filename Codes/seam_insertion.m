function img=seam_insertion(I,colsrm)

    if (hdiam <= vdiam)
        for k=colsrm:-1:1
            S=seams(:,k);
            nn=size(I,1);
            mm=size(I,2);
            I1=zeros(nn,mm+1,3);
            for j=1:nn
                I1(j,1:S(j)-1,:)=I(j,1:S(j)-1,:);
                I1(j,S(j),:)=mean(I(j,S(j)-1:S(j)+1,:));
                I1(j,S(j)+1:end,:)=I(j,S(j):end,:);
            end
            I=I1;
        end
    else
        for k=colsrm:-1:1
            S=seams(k,:);
            nn=size(I,1);
            mm=size(I,2);
            I1=zeros(nn+1,mm,3);
            for j=1:mm
                I1(1:S(j)-1,j,:)=I(1:S(j)-1,j,:);
                I1(S(j),j,:)=mean(I(S(j)-1:S(j)+1,j,:));
                I1(S(j)+1:end,j,:)=I(S(j):end,j,:);
            end
            I=I1;
        end
    end    
    img_objrm=I;
    
    
%% 100% enlarging (50% twice)
cols_add=colsrm;
I_new=I;
I_dup=I;
[h,w,~] = size(I);
NewMask = false(h,w);
S_matrix = zeros(h, cols_add); % for storing cols_add seams

% remove vertical seams; here avoid adding the same seam to the img repeatedly
for c=1:cols_add
    E = imenergy(I_dup,energyMethod);
    S=Vseam(E);
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


% remove h seams; here avoid adding the same seam to the img repeatedly
S_matrix = zeros(cols_add,w);
for c=1:cols_add
    E = imenergy(I_dup,energyMethod);
    S=Hseam(E);
    NewMask=addHSeamToImg(NewMask,S);
    I_dup=rm_Hseam(I_dup,S);
    S_matrix(c,:) = S;
end

% adjust seams's frame of reference: credit to ...
% {github.com/rodrigo-pena/seam-carving/blob/master/find_k_seams.m}
S_matrix=S_matrix';
for c = cols_add:-1:2
    S_matrix(:,c:cols_add) = S_matrix(:,c:cols_add) + ...
        (S_matrix(:, c:cols_add) >= repmat(S_matrix(:, c - 1), [1, cols_add - c + 1]));
end

% apply adjust S_matrix to orig img
for c = 1:cols_add
    %I = add_Hseam(I,S_matrix(c,:));
    S=S_matrix(c,:);
    nn=size(I,1);
    mm=size(I,2);
    I1=zeros(nn+1,mm,size(I,3));
    for j=1:mm
        if S(j)==1
            I1(1,j,:)=mean(I(1:3,j,:));
            I1(2:nn+1,j,:)=I(1:nn,j,:);
            continue;
        end
        if S(j)==mm
            I1(1:nn,j,:)=I(1:nn,j,:);
            I1(nn+1,j,:)=mean(I(nn-2:nn,j,:));
            continue;
        end
        I1(1:S(j)-1,j,:)=I(1:S(j)-1,j,:);
        I1(S(j),j,:)=mean(I(S(j)-1:S(j)+1,j,:));
        I1(S(j)+1:nn+1,j,:)=I(S(j):end,j,:);
    end
    I=I1;
end

I_new(NewMask) = 1;



    
