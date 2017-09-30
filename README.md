# Multi-focus Image Fusion using dictionary learning and Low-Rank Representation


## Abstract
Among the representation learning, the low-rank representation (LRR) is one of the hot research topics in many fields, especially in image processing and pattern recognition. 

Although LRR can capture the global structure, the ability of local structure preservation is limited because LRR lacks dictionary learning. In this paper, we propose a novel multi-focus image fusion method based on dictionary learning and LRR to get a better performance in both global and local structure. 

Firstly, the source images are divided into several patches by sliding window technique. Then, the patches are classified according to the Histogram of Oriented Gradient (HOG) features. And the sub-dictionaries of each class are learned by K-singular value decomposition (K-SVD) algorithm. Secondly, a global dictionary is constructed by combining these sub-dictionaries. 

Then, we use the global dictionary in LRR to obtain the LRR coefficients vector for each patch. Finally, the l_1-norm and choose-max fuse strategy for each coefficients vector is adopted to reconstruct fused image from the fused LRR coefficients and the global dictionary. 

Experimental results demonstrate that the proposed method can obtain state-of-the-art performance in both qualitative and quantitative evaluations compared with serval classical methods and novel methods.
