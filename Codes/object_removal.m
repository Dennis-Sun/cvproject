function img_objrm =object_removal(img,mask,protect,seaminsert)

pixels_rm=sum(mask(:));
energyMethod = 0;           
n=size(img,1);
m=size(img,2);


%% Calculate the diameters of the target removel region:
vsum = sum(mask,1);
hdiam = length(find(vsum ~= 0));
hsum = sum(mask,2);
vdiam = length(find(hsum ~= 0));

weight=1000000;
colsrm=0;
seams = zeros(n, m);
img_objrm = normalize(img);
threshold=0.001*sum(sum(mask == 1));

if (hdiam <= vdiam)
    % remove vertical seams:
    while pixels_rm>threshold
        if isempty(protect)==0
            E = imenergy(img_objrm,energyMethod)-weight.*(double(mask))+weight.*(double(protect));
        else
            E = imenergy(img_objrm,energyMethod)-weight.*(double(mask));
        end
        S=Vseam(E);
        img_objrm=rm_Vseam(img_objrm,S);
        mask=rm_Vseam(mask,S);
        protect=rm_Vseam(protect,S);
        pixels_rm=sum(mask(:));
        %img_objrm=add_Vseam(img_objrm,S);
        colsrm=colsrm+1;
        seams(:,colsrm) = S;
    end
else
    % remove horizontal seams:    
    while pixels_rm>threshold
        if isempty(protect)==0
            E = imenergy(img_objrm,energyMethod)-weight.*(double(mask))+weight.*(double(protect));
        else
            E = imenergy(img_objrm,energyMethod)-weight.*(double(mask));
        end
        S=Hseam(E);
        img_objrm=rm_Hseam(img_objrm,S);
        mask=rm_Hseam(mask,S);
        protect=rm_Vseam(protect,S);
        pixels_rm=sum(mask(:));
        colsrm=colsrm+1;
        seams(colsrm,:) = S;
    end
end

    
    
% seam insertion back to original size:
if seaminsert==1
    I=img_objrm;
    if (hdiam <= vdiam)
        for k=colsrm:-1:1
            S=seams(:,k);
            nn=size(I,1);
            mm=size(I,2);
            I1=zeros(nn,mm+1,3);
            for j=1:nn
                I1(j,1:S(j)-1,:)=I(j,1:S(j)-1,:);
                js=max(j-1,1);
                je=min(j+1,nn);
                I1(j,S(j),1)=mean2(I(js:je,S(j)-1:S(j)+1,1));
                I1(j,S(j),2)=mean2(I(js:je,S(j)-1:S(j)+1,2));
                I1(j,S(j),3)=mean2(I(js:je,S(j)-1:S(j)+1,3));                
                %I1(j,S(j),:)=mean(I(j,S(j)-1:S(j)+1,:));
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
                js=max(S(j)-1,1);
                je=min(S(j)+1,nn);
                I1(S(j),j,:)=median(I(js:je,j,:));
                I1(S(j)+1:end,j,:)=I(S(j):end,j,:);
            end
            I=I1;
        end
    end    
    img_objrm=I;
end

% imwrite(img_objrm,'images/Couple_objrm1.png');
% imwrite(img_objrm,'images/Beach_objrm.png');



    
