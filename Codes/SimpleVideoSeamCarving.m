function video_out=SimpleVideoSeamCarving(video,targetsize)

% reduce size of videos:
n = size(video(1).cdata,1);
m = size(video(1).cdata,2);

rows_rm = n-targetsize(1);
cols_rm = m-targetsize(2);

total = rows_rm + cols_rm;


for i=1:total
    energy = videoEnergy(video);
    img = video(1).cdata;
    if cols_rm>0
        S=Vseam(energy);
        img = rm_Vseam(img,S);
        %create mask 
        new_mask = zeros(size(energy));
        for j=1:length(S)
            new_mask(j, S(j)) = 1;
        end
        new_mask = ~logical(new_mask);
        
        % remove seam from each frame in the video:
        for v=1:length(video)
            newimg = zeros(size(video(v).cdata,1),size(video(v).cdata,2)-1, size(video(v).cdata,3),'uint8');
            for r=1:size(video(v).cdata,1)
                newimg(r,:,1) = video(v).cdata(r,new_mask(r,:),1);
                newimg(r,:,2) = video(v).cdata(r,new_mask(r,:),2);
                newimg(r,:,3) = video(v).cdata(r,new_mask(r,:),3);
            end
            video(v).cdata = newimg;
        end
        cols_rm=cols_rm-1;
    else
        % remove horizontal seams:
        S=Hseam(energy);
        img = rm_Hseam(img,S);
        % create mask 
        new_mask = zeros(size(energy));
        for j=1:length(S)
            new_mask(S(j),j) = 1;
        end
        new_mask = ~logical(new_mask);
        
        % remove seam from each frame in the video:
        for v=1:length(video)
            newimg = zeros(size(video(v).cdata,1)-1,size(video(v).cdata,2), size(video(v).cdata,3),'uint8');
            for c=1:size(video(v).cdata,1)
                newimg(:,c,1) = video(v).cdata(new_mask(:,c),c,1);
                newimg(:,c,2) = video(v).cdata(new_mask(:,c),c,2);
                newimg(:,c,3) = video(v).cdata(new_mask(:,c),c,3);
            end
            video(v).cdata = newimg;
        end
        rows_rm=rows_rm-1;
    end
end
            
video_out=video;
    