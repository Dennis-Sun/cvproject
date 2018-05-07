# Implementation of Seam Carving
Project for CS766 (Computer Vision), Spring 2018 UW-Madison

## Team Members
- Shuo Sun, ssun99@wisc.edu
- Shilu Zhang, szhang256@wisc.edu

## Project Proposal
[Link to Google Doc](https://docs.google.com/document/d/1z0z4b6yVGYcPRXuUE_9kr-a2so3J8vSAw8htgIIx6CU/edit?usp=sharing)


## Results
1. Aspect ratio change

![Original Input](Images/christmas_original.jpg)
![Original Input with vertial seams](https://github.com/Dennis-Sun/cvproject/blob/master/Images/christmas_rm_100cols_Vseams.png)
![Seam Carving](https://github.com/Dennis-Sun/cvproject/blob/master/Images/christmas_rm_100cols.png)

2. Retargeting with Optimal Seams-Order

![Original Input](https://github.com/Dennis-Sun/cvproject/blob/master/Images/charles_original.png)

![(A) Remove horizontal seams first and then remove vertical seams](https://github.com/Dennis-Sun/cvproject/blob/master/Images/charles_rm100rows_rm100cols.png)
![(B) Remove vertical seams first and then remove horizontal seams](https://github.com/Dennis-Sun/cvproject/blob/master/Images/charles_rm100cols_rm100rows.png)
![(C) Alternate between horizontal and vertical seams](https://github.com/Dennis-Sun/cvproject/blob/master/Images/charles_rm100rows_100cols_altern.png)
![(D) Optimal order retargeting](https://github.com/Dennis-Sun/cvproject/blob/master/Images/charles_optimal_100cols100rows.png)

3. Image Enlarging

![Original Input](https://github.com/Dennis-Sun/cvproject/blob/master/Images/desert.jpg)
![Original Input with vertial seams](https://github.com/Dennis-Sun/cvproject/blob/master/Images/desert_add_50percentcols_Vseams.png)
![Seam Carving](https://github.com/Dennis-Sun/cvproject/blob/master/Images/desert_add_50percentcols.png)

4. Content Amplification

![Original Input](https://github.com/Dennis-Sun/cvproject/blob/master/Images/arch_original.png)
![Resizing](https://github.com/Dennis-Sun/cvproject/blob/master/Images/arch_magnified.png)
![Seam Carving](https://github.com/Dennis-Sun/cvproject/blob/master/Images/arch_retarget.png)

5. Object Removal

![Original Input](https://github.com/Dennis-Sun/cvproject/blob/master/Images/Couple.png)
![Mask](https://github.com/Dennis-Sun/cvproject/blob/master/Images/Couple_protect_mask.png)
![Object Removed](https://github.com/Dennis-Sun/cvproject/blob/master/Images/Couple_objrm.png)

6. Object Removal and Resize

![Original Input](https://github.com/Dennis-Sun/cvproject/blob/master/Images/Beach.png)
![Girl Removed](https://github.com/Dennis-Sun/cvproject/blob/master/Images/Beach_girl_removed.png)
![Girl Removed and Resized](https://github.com/Dennis-Sun/cvproject/blob/master/Images/Beach_girl_removed_resized.png)


7. Forward Energy vs Backward Energy

![Original Input](https://github.com/Dennis-Sun/cvproject/blob/master/Images/bench3.png)

![BackWard Energy](https://github.com/Dennis-Sun/cvproject/blob/master/Images/bench_rmVseams_be.png)
![ForWard Energy](https://github.com/Dennis-Sun/cvproject/blob/master/Images/bench_rmVseams2_fe.png)

![BackWard Energy](https://github.com/Dennis-Sun/cvproject/blob/master/Images/bench_rm_be.png)
![ForWard Energy](https://github.com/Dennis-Sun/cvproject/blob/master/Images/bench_rm2_fe.png)


8. Simple Video Seam Carving
