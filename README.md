# Multi-focus Image Fusion using dictionary learning and Low-Rank Representation

ICIG2017(oral)

## Abstract
We propose a novel multi-focus image fusion method based on dictionary learning and LRR to get a better performance in both global and local structure. 

Firstly, the source images are divided into several patches by sliding window technique. Then, the patches are classified according to the Histogram of Oriented Gradient (HOG) features. And the sub-dictionaries of each class are learned by K-singular value decomposition (K-SVD) algorithm. Secondly, a global dictionary is constructed by combining these sub-dictionaries. 

Then, we use the global dictionary in LRR to obtain the LRR coefficients vector for each patch. Finally, the l_1-norm and choose-max fuse strategy for each coefficients vector is adopted to reconstruct fused image from the fused LRR coefficients and the global dictionary. 


## Figures and data
1 made_images and made_images_new are the source images which contain different focus region.

2 image_vector and image_vector_new are the image patches matrices and each column is an imape patch which divided by sliding window technique.

3 dictionary and dictionary_new are the su-dictionaries from image_vector and image_vector_new.


## Source code
1 Hog.m---extract the HOG features of image patch.

2 The code of LRR

	solve_lrr.m

	solve_l1l2.m

	inexact_alm_lrr_l1l2.m, inexact_alm_lrr_l1.m

	exact_alm_lrr_l1l2.m, exact_alm_lrr_l1.m
	

3 getClassLabel.m ---- set class label for each patch.

4 fusion_HOG_LRR.m ---- main file.


