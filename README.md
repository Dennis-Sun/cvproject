# Implementation of Seam Carving
Project for CS766 (Computer Vision), Spring 2018 UW-Madison

## Team Members
- Shuo Sun, ssun99@wisc.edu
- Shilu Zhang, szhang256@wisc.edu

## Project Proposal
[Link to Google Doc](https://docs.google.com/document/d/1z0z4b6yVGYcPRXuUE_9kr-a2so3J8vSAw8htgIIx6CU/edit?usp=sharing)


## Results
1. Aspect ratio change

![Original Input](Images/christmas_original.jpg "Original Input")
![Original Input with vertial seams](Images/christmas_rm_100cols_Vseams.png)
![Seam Carving](Images/christmas_rm_100cols.png)

2. Retargeting with Optimal Seams-Order

![Original Input](Images/charles_original.png)

![(A) Remove horizontal seams first and then remove vertical seams](Images/charles_rm100rows_rm100cols.png)
![(B) Remove vertical seams first and then remove horizontal seams](Images/charles_rm100cols_rm100rows.png)
![(C) Alternate between horizontal and vertical seams](Images/charles_rm100rows_100cols_altern.png)
![(D) Optimal order retargeting](Images/charles_optimal_100cols100rows.png)

3. Image Enlarging

![Original Input](Images/desert.jpg)
![Original Input with vertial seams](Images/desert_add_50percentcols_Vseams.png)
![Seam Carving](Images/desert_add_50percentcols.png)

4. Content Amplification

![Original Input](Images/arch_original.png)
![Resizing](Images/arch_magnified.png)
![Seam Carving](Images/arch_retarget.png)

5. Object Removal

![Original Input](Images/Couple.png)
![Mask](Images/Couple_protect_mask.png)
![Object Removed](Images/Couple_objrm.png)

6. Object Removal and Resize

![Original Input](Images/Beach.png)
![Girl Removed](Images/Beach_girl_removed.png)
![Girl Removed and Resized](Images/Beach_girl_removed_resized.png)


7. Forward Energy vs Backward Energy

![Original Input](Images/bench3.png)

![BackWard Energy](Images/bench_rmVseams_be.png)
![ForWard Energy](Images/bench_rmVseams2_fe.png)

![BackWard Energy](Images/bench_rm_be.png)
![ForWard Energy](Images/bench_rm2_fe.png)


8. Simple Video Seam Carving
