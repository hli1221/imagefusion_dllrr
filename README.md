# Multi-focus Image Fusion using dictionary learning and Low-Rank Representation

"[Hui Li, Xiao-Jun Wu. Multi-focus Image Fusion using dictionary learning and Low-Rank Representation.](https://link.springer.com/chapter/10.1007/978-3-319-71607-7_59)"

ICIG2017(oral)

## The framework for fusion method
<b>Dictionary learning</b>
![](https://github.com/exceptionLi/imagefusion_dllrr/blob/master/framework/dictionary_learning.png)

<b>Reconstructure</b>
![](https://github.com/exceptionLi/imagefusion_dllrr/blob/master/framework/reconstructure.png)


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

## LRR parts
The LRR method is proposed by Guangcan Liu in 2010.

"Liu G, Lin Z, Yu Y. Robust Subspace Segmentation by Low-Rank Representation[C]// International Conference on Machine Learning. DBLP, 2010:663-670."

And we just use this method in our paper without change.


# Citation
```
@misc{li2017imagefusion_dllrr,
    author = {Hui Li},
    title = {CODE:Multi-focus Image Fusion using dictionary learning and Low-Rank Representation},
    year = {2017},
    publisher = {GitHub},
    journal = {GitHub repository},
    howpublished = {\url{https://github.com/exceptionLi/imagefusion_dllrr}}
  }
```
