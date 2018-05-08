### Graph Cut Seam Carving:
To improve the performance of seam carving to videos, we implemented the graph cut method proposed in the Rubinstein et al paper. To find the optimal seam, we need to construct a directed graph to represent the image. Using vertical seams as an example:

1) We first add a source node S to every pixel in the leftmost column with infinity weight and then add a sink node T to every pixel in the rightmost column of the image. 

2) For forward edges, we add the edges along with their weight as shown in Figure 10, +LR=|I(i,j+1)-I(i,j-1)|, +LU=|I(i-1,j)-I(i,j-1)|, -LU=|I(i+1,j)-I(i,j-1)|.

3) Then, we will apply the min-cut alogrithm to partition the graph into two disjoint subsets S and T. The optimal seam is defined by the optimal cut from S to T. Figure 11 is shown the result after removing 50 pixels from the image.

<img src="misc/graghcut.png" width="100" height="100">
<figcaption>Fig10. Forward Energy graph connections for vertical seam</figcaption>


<html>
<body>
<table class="image">
<tr><td><img src="Images/christmas_original.jpg"></td><td><img src="Images/christmas_rm_50cols_GC.png"></tr>
<tr><td class="caption">Figure 11(a) Original Input</td><td class="caption">(b)Seam Carving Using Graph Cut</td></tr>
</table>
</body>
</html>
