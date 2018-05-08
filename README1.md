### Graph Cut Seam Carving:
To improve the performance of seam carving to videos, we implemented the graph cut method proposed in the Rubinstein et al paper.
To find the optimal seam, we need to construct a directed graph to represent the image. Using vertical seams as an example, we first add a source node S to every pixel in the leftmost column with infinity weight and then add a sink node T to every pixel in the rightmost column of the image. For forward edges, we add the edges along with their weight as shown in Figure 

<img src="misc/graghcut.png" width="100" height="100">
<figcaption>Fig10. Forward Energy graph connections for vertical seam</figcaption>
