% Graph Cut Seam Carving

img = imread('~/Dropbox/CS766/Programs/waterfall.png');
img = imread('~/Dropbox/CS766/Programs/christmas_original.jpg');
nrow=size(img,1);
ncol=size(img,2);

cols_rm = 50;     % number of columns to remove

NewMask = false(nrow,ncol);
    
% remove vertical seams
for c=1:cols_rm
    fprintf('Remove vertical seam: %d\n',c);
    % construct image graph:
    graph=GraphcutVerticalSeam(img);
    s = 1;
    t = size(graph.Nodes,1);
    
    %A minimum cut partitions the digraph nodes into two sets CS and CT
    [MF,GF,CS,CT] = maxflow(graph,s,t);
    CS=CS(2:end)-1;
    % get row and column index;
    jcol=floor(CS/nrow)+1;
    irow=mod(CS,nrow);
    id=find(irow==0);
    irow(id)=nrow;
    jcol(id)=CS(id)/nrow;
    [~,index]=sort(irow);
    S=jcol(index);
%     for i=1:length(irow)
%         id=find(irow==i);
%         S(i)=jcol(id(1));
%     end
    NewMask=addVSeamToImg(NewMask,S);
    img=rm_Vseam(img,S);
end

I_rmVseam(NewMask) = 1;
    
imshow(I_rmVseam)
imwrite(I_rmVseam,'./waterfall_rm_50cols_Vseams_GC.png');
imwrite(img,'./waterfall_rm_50cols_GC.png');
