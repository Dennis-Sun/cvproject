function Eglobal=videoEnergy(video)
n=size(video(1).cdata,1);
m=size(video(1).cdata,2);
dim = size(video(1).cdata);
Esall=zeros(n,m,length(video));
Etall=zeros(n,m,length(video)-1);

for v=1:length(video)
    I=im2double(video(v).cdata);
    [FX, FY] = gradient(I);
    if length(dim) ==3
        %Es=e1(I(:, :, 1)) + e1(I(:, :, 2)) + e1(I(:, :, 3));
        Es=abs(FX(:,:,1))+abs(FX(:,:,2))+abs(FX(:,:,3))+abs(FY(:,:,1))+abs(FY(:,:,2))+abs(FY(:,:,3));
    else
        Es=abs(FX)+abs(FY);
    end
    Esall(:,:,v)=Es;
end

for v=2:length(video)
    img1=im2double(video(v-1).cdata);
    img2=im2double(video(v).cdata);
    Et=zeros(size(n,m));
    if length(dim) ==3
        % add up red green blue channels
        for b=1:3
            imgt=zeros(n,m,2);
            imgt(:,:,1)=img1(:,:,b);
            imgt(:,:,2)=img2(:,:,b);
            [FX,FY,FZ]=gradient(imgt);
            Et=Et+abs(FZ(:,:,1))+abs(FZ(:,:,2));
        end
    else
        imgt=zeros(n,m,2);
        imgt(:,:,1)=img1;
        imgt(:,:,2)=img2;
        [FX,FY,FZ]=gradient(imgt);
        Et=abs(FZ(:,:,1))+abs(FZ(:,:,2));
    end
    Etall(:,:,v-1)=Et;
end
    
    
Espat=max(Esall,[],3);
Etemp=max(Etall,[],3);
   
Eglobal=0.3*Espat+0.7*Etemp;

    
