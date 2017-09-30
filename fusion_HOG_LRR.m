
function fusion_HOG_LRR

%addpath(genpath('./image_vector'));
%addpath(genpath('./dictionary'));
addpath(genpath('./image_vector_new'));
addpath(genpath('./dictionary_new'));

for num=1:10
num

lambda = 100;
% lambda = 4.5;

% path1 = ['./made_images/image',num2str(num),'_left.png'];
% path2 = ['./made_images/image',num2str(num),'_right.png'];
% fuse_path = ['./fused_images/fused_',num2str(num),'_HogLrr.png'];
% fuse_path = ['./fused_images/fused_',num2str(num),'_',num2str(lambda),'_HogLrr.png'];

path1 = ['./made_images_new/image_new_',num2str(num),'_left.png'];
path2 = ['./made_images_new/image_new_',num2str(num),'_right.png'];
fuse_path = ['./fused_images_new/fused_new_',num2str(num),'_256_HogLrr.png'];

image1 = imread(path1);
image2 = imread(path2);
I1 = im2double(image1);
I2 = im2double(image2);

h = HOG(I1, 6);

Th = 0.25;
classNum = 7;%classNum-1
unit = 8; % 
[m,n] = size(image1);

% if num==1
%     load Vi1_new_1.dat -mat;
%     load Vi2_new_1.dat -mat;
% 
%     load D0_new_1.dat -mat;
%     load D1_new_1.dat -mat;
%     load D2_new_1.dat -mat;
%     load D3_new_1.dat -mat;
%     load D4_new_1.dat -mat;
%     load D5_new_1.dat -mat;
%     load D6_new_1.dat -mat;
% elseif num==2
%     load Vi1_new_2.dat -mat;
%     load Vi2_new_2.dat -mat;
% 
%     load D0_new_2.dat -mat;
%     load D1_new_2.dat -mat;
%     load D2_new_2.dat -mat;
%     load D3_new_2.dat -mat;
%     load D4_new_2.dat -mat;
%     load D5_new_2.dat -mat;
%     load D6_new_2.dat -mat;
% elseif num==3
%     load Vi1_new_3.dat -mat;
%     load Vi2_new_3.dat -mat;
%     
%     load D0_new_3.dat -mat;
%     load D1_new_3.dat -mat;
%     load D2_new_3.dat -mat;
%     load D3_new_3.dat -mat;
%     load D4_new_3.dat -mat;
%     load D5_new_3.dat -mat;
%     load D6_new_3.dat -mat;
% elseif num==4
%     load Vi1_new_4.dat -mat;
%     load Vi2_new_4.dat -mat;
%     
%     load D0_new_4.dat -mat;
%     load D1_new_4.dat -mat;
%     load D2_new_4.dat -mat;
%     load D3_new_4.dat -mat;
%     load D4_new_4.dat -mat;
%     load D5_new_4.dat -mat;
%     load D6_new_4.dat -mat;
% elseif num==5
%     load Vi1_new_5.dat -mat;
%     load Vi2_new_5.dat -mat;
%     
%     load D0_new_5.dat -mat;
%     load D1_new_5.dat -mat;
%     load D2_new_5.dat -mat;
%     load D3_new_5.dat -mat;
%     load D4_new_5.dat -mat;
%     load D5_new_5.dat -mat;
%     load D6_new_5.dat -mat;
% end
% 
% if num==6
%     load Vi1_new_6.dat -mat;
%     load Vi2_new_6.dat -mat;
% 
%     load D0_new_6.dat -mat;
%     load D1_new_6.dat -mat;
%     load D2_new_6.dat -mat;
%     load D3_new_6.dat -mat;
%     load D4_new_6.dat -mat;
%     load D5_new_6.dat -mat;
%     load D6_new_6.dat -mat;
% elseif num==7
%     load Vi1_new_7.dat -mat;
%     load Vi2_new_7.dat -mat;
% 
%     load D0_new_7.dat -mat;
%     load D1_new_7.dat -mat;
%     load D2_new_7.dat -mat;
%     load D3_new_7.dat -mat;
%     load D4_new_7.dat -mat;
%     load D5_new_7.dat -mat;
%     load D6_new_7.dat -mat;
% elseif num==8
%     load Vi1_new_8.dat -mat;
%     load Vi2_new_8.dat -mat;
%     
%     load D0_new_8.dat -mat;
%     load D1_new_8.dat -mat;
%     load D2_new_8.dat -mat;
%     load D3_new_8.dat -mat;
%     load D4_new_8.dat -mat;
%     load D5_new_8.dat -mat;
%     load D6_new_8.dat -mat;
% elseif num==9
%     load Vi1_new_9.dat -mat;
%     load Vi2_new_9.dat -mat;
%     
%     load D0_new_9.dat -mat;
%     load D1_new_9.dat -mat;
%     load D2_new_9.dat -mat;
%     load D3_new_9.dat -mat;
%     load D4_new_9.dat -mat;
%     load D5_new_9.dat -mat;
%     load D6_new_9.dat -mat;
% elseif num==10
%     load Vi1_new_10.dat -mat;
%     load Vi2_new_10.dat -mat;
%     
%     load D0_new_10.dat -mat;
%     load D1_new_10.dat -mat;
%     load D2_new_10.dat -mat;
%     load D3_new_10.dat -mat;
%     load D4_new_10.dat -mat;
%     load D5_new_10.dat -mat;
%     load D6_new_10.dat -mat;
% end

if num==1
    load Vi1_new_1.dat -mat;
    load Vi2_new_1.dat -mat;

    load D0_new_256_1.dat -mat;
    load D1_new_256_1.dat -mat;
    load D2_new_256_1.dat -mat;
    load D3_new_256_1.dat -mat;
    load D4_new_256_1.dat -mat;
    load D5_new_256_1.dat -mat;
    load D6_new_256_1.dat -mat;
elseif num==2
    load Vi1_new_2.dat -mat;
    load Vi2_new_2.dat -mat;

    load D0_new_256_2.dat -mat;
    load D1_new_256_2.dat -mat;
    load D2_new_256_2.dat -mat;
    load D3_new_256_2.dat -mat;
    load D4_new_256_2.dat -mat;
    load D5_new_256_2.dat -mat;
    load D6_new_256_2.dat -mat;
elseif num==3
    load Vi1_new_3.dat -mat;
    load Vi2_new_3.dat -mat;
    
    load D0_new_256_3.dat -mat;
    load D1_new_256_3.dat -mat;
    load D2_new_256_3.dat -mat;
    load D3_new_256_3.dat -mat;
    load D4_new_256_3.dat -mat;
    load D5_new_256_3.dat -mat;
    load D6_new_256_3.dat -mat;
elseif num==4
    load Vi1_new_4.dat -mat;
    load Vi2_new_4.dat -mat;
    
    load D0_new_256_4.dat -mat;
    load D1_new_256_4.dat -mat;
    load D2_new_256_4.dat -mat;
    load D3_new_256_4.dat -mat;
    load D4_new_256_4.dat -mat;
    load D5_new_256_4.dat -mat;
    load D6_new_256_4.dat -mat;
elseif num==5
    load Vi1_new_5.dat -mat;
    load Vi2_new_5.dat -mat;
    
    load D0_new_256_5.dat -mat;
    load D1_new_256_5.dat -mat;
    load D2_new_256_5.dat -mat;
    load D3_new_256_5.dat -mat;
    load D4_new_256_5.dat -mat;
    load D5_new_256_5.dat -mat;
    load D6_new_256_5.dat -mat;
end

if num==6
    load Vi1_new_6.dat -mat;
    load Vi2_new_6.dat -mat;

    load D0_new_256_6.dat -mat;
    load D1_new_256_6.dat -mat;
    load D2_new_256_6.dat -mat;
    load D3_new_256_6.dat -mat;
    load D4_new_256_6.dat -mat;
    load D5_new_256_6.dat -mat;
    load D6_new_256_6.dat -mat;
elseif num==7
    load Vi1_new_7.dat -mat;
    load Vi2_new_7.dat -mat;

    load D0_new_256_7.dat -mat;
    load D1_new_256_7.dat -mat;
    load D2_new_256_7.dat -mat;
    load D3_new_256_7.dat -mat;
    load D4_new_256_7.dat -mat;
    load D5_new_256_7.dat -mat;
    load D6_new_256_7.dat -mat;
elseif num==8
    load Vi1_new_8.dat -mat;
    load Vi2_new_8.dat -mat;
    
    load D0_new_256_8.dat -mat;
    load D1_new_256_8.dat -mat;
    load D2_new_256_8.dat -mat;
    load D3_new_256_8.dat -mat;
    load D4_new_256_8.dat -mat;
    load D5_new_256_8.dat -mat;
    load D6_new_256_8.dat -mat;
elseif num==9
    load Vi1_new_9.dat -mat;
    load Vi2_new_9.dat -mat;
    
    load D0_new_256_9.dat -mat;
    load D1_new_256_9.dat -mat;
    load D2_new_256_9.dat -mat;
    load D3_new_256_9.dat -mat;
    load D4_new_256_9.dat -mat;
    load D5_new_256_9.dat -mat;
    load D6_new_256_9.dat -mat;
elseif num==10
    load Vi1_new_10.dat -mat;
    load Vi2_new_10.dat -mat;
    
    load D0_new_256_10.dat -mat;
    load D1_new_256_10.dat -mat;
    load D2_new_256_10.dat -mat;
    load D3_new_256_10.dat -mat;
    load D4_new_256_10.dat -mat;
    load D5_new_256_10.dat -mat;
    load D6_new_256_10.dat -mat;
end

% KSVD
% dic_size = 128;
dic_size = 256;
k = 16;

D = zeros(unit*unit,classNum*dic_size);
for i=1:classNum
    tmp_d = eval(['D',num2str(i-1) ]);
    D(:,((i-1)*dic_size+1):dic_size*i) = tmp_d;
end

[vn,vm] = size(Vi1);

disp(strcat('LRR'));
tic
[Z1,E1] = solve_lrr(Vi1(2:vn,:),D,lambda,0,1);
[Z2,E2] = solve_lrr(Vi2(2:vn,:),D,lambda,0,1);
toc
disp(strcat('LRR'));

fusion = zeros(m,n);
for i=1:(m-unit+1)
    if rem(i,50)==0
        i
    end
    for j=1:(n-unit+1)
        y1 = Z1(:, (i-1)*(n-unit+1)+j);
        y2 = Z2(:, (i-1)*(n-unit+1)+j);
        LRR1 = norm(y1,1);
        LRR2 = norm(y2,1);
        
        % choose-max
        if LRR1>LRR2
            fv = D*y1;
        else
            fv = D*y2;
        end
        
        fv_block = reshape(fv, [8,8]);
        temp = fusion(i:(i+7),j:(j+7));

        fb = (fv_block+temp)/2;
        fusion(i:(i+7),j:(j+7)) = fb;
    end
end

% figure;
% imshow(I1);
% figure;
% imshow(I2);

figure;
imshow(fusion);

imwrite(fusion,fuse_path,'png');

end

end


