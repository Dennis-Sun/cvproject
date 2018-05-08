function graph=GraphcutVerticalSeam(img)
nrow=size(img,1);
ncol=size(img,2);
N=nrow*ncol+2;
% directed graph:
graph = digraph();
% add N nodes:
graph = addnode(graph, N);

% add edges:
weight=100000;
% left:
graph = addedge(graph, ones(1,nrow), 2:nrow+1, ones(1,nrow)*weight);
% right:
graph = addedge(graph, (N-nrow):(N-1), ones(1,nrow)*N, ones(1,nrow)*weight);


for i=1:nrow
    %wlr=sum(abs(img(i,j+1,:)-img(i,j-1,:)));
    %wlu=sum(abs(img(i-1,j,:)-img(i,j-1,:)));
    %wlu1=sum(abs(img(i+1,j,:)-img(i,j-1,:)));
    j=1;
    pi_pj=i+1+(j-1)*nrow;
    pi_pj1=i+1+j*nrow;
    pi1_pj= i+1+(j-1)*nrow+1;
    pi1_pj1= i+1+j*nrow+1;
    wlr=sum(abs(img(i,j+1,:)-img(i,j,:)));
    if  i==1
        wlu=sum(abs(img(i,j,:)-img(i,j,:)));
        wlu1=sum(abs(img(i+1,j,:)-img(i,j,:)));
    elseif i==nrow
        wlu=sum(abs(img(i-1,j,:)-img(i,j,:)));
        wlu1=sum(abs(img(i,j,:)-img(i,j,:)));
    else
        wlu=sum(abs(img(i-1,j,:)-img(i,j,:)));
        wlu1=sum(abs(img(i+1,j,:)-img(i,j,:)));
    end
    
    % LR: pi,j->pi,j+1
    graph = addedge(graph,pi_pj ,pi_pj1, wlr);
    graph = addedge(graph,pi_pj1, pi_pj, weight);
    if i<nrow
        % LU: pi+1,j->pi,j
        graph = addedge(graph, pi1_pj, pi_pj, wlu);
        % -LU: pi,j->pi+1,j
        graph = addedge(graph, pi_pj, pi1_pj, wlu1);
        % pi+1,j+1->pi,j
        graph = addedge(graph,  pi1_pj1,pi_pj, weight);
        % pi,j+1-> pi+1,j
        graph = addedge(graph,  pi_pj1,pi1_pj, weight);
    end
    
    
    j=2:ncol-1;
    pi_pj=i+1+(j-1)*nrow;
    pi_pj1=i+1+j*nrow;
    pi1_pj= i+1+(j-1)*nrow+1;
    pi1_pj1= i+1+j*nrow+1;
    
    if i==1
        wlu=sum(abs(img(i,j,:)-img(i,j-1,:)),3);
        wlu1=sum(abs(img(i+1,j,:)-img(i,j-1,:)),3);
    elseif i==nrow
        wlu=sum(abs(img(i-1,j,:)-img(i,j-1,:)),3);
        wlu1=sum(abs(img(i,j,:)-img(i,j-1,:)),3);
    else
        wlu=sum(abs(img(i-1,j,:)-img(i,j-1,:)),3);
        wlu1=sum(abs(img(i+1,j,:)-img(i,j-1,:)),3);
    end
    
    % LR: pi,j->pi,j+1
    graph = addedge(graph,pi_pj ,pi_pj1, wlr);
    graph = addedge(graph,pi_pj1, pi_pj, weight);
    if i<nrow
        % LU: pi+1,j->pi,j
        graph = addedge(graph, pi1_pj, pi_pj, wlu);
        % -LU: pi,j->pi+1,j
        graph = addedge(graph, pi_pj, pi1_pj, wlu1);
        % pi+1,j+1->pi,j
        graph = addedge(graph,  pi1_pj1,pi_pj, weight);
        % pi,j+1-> pi+1,j
        graph = addedge(graph,  pi_pj1,pi1_pj, weight);
    end
    
    
    
    j=ncol;
    pi_pj=i+1+(j-1)*nrow;
    pi_pj1=i+1+j*nrow;
    pi1_pj= i+1+(j-1)*nrow+1;
    pi1_pj1= i+1+j*nrow+1;
    wlr=sum(abs(img(i,j,:)-img(i,j-1,:)),3);
    if  i==1
        wlu=sum(abs(img(i,j,:)-img(i,j-1,:)),3);
        wlu1=sum(abs(img(i+1,j,:)-img(i,j-1,:)),3);
    elseif i==nrow
        wlu=sum(abs(img(i-1,j,:)-img(i,j-1,:)),3);
        wlu1=sum(abs(img(i,j,:)-img(i,j-1,:)),3);
    else
        wlu=sum(abs(img(i-1,j,:)-img(i,j-1,:)),3);
        wlu1=sum(abs(img(i+1,j,:)-img(i,j-1,:)),3);
    end
    % add neighbors:
    if i<nrow
        % LU: pi+1,j->pi,j
        graph = addedge(graph, pi1_pj, pi_pj, wlu);
        % -LU: pi,j->pi+1,j
        graph = addedge(graph, pi_pj, pi1_pj, wlu1);
    end
end


