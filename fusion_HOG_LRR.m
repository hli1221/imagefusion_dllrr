function fusion_HOG_LRR

addpath(genpath('./images_vectors'));
addpath(genpath('./dictionaries'));

for num=1:20
disp(num2str(num));
lambda = 100;

path1 = ['./MF_images/image',num2str(num),'_left.png'];
path2 = ['./MF_images/image',num2str(num),'_right.png'];
fuse_path = ['./fused_mf/fused',num2str(num),'_HogLrr.png'];

image1 = imread(path1);
image2 = imread(path2);
I1 = im2double(image1);
I2 = im2double(image2);

h = HOG(I1, 6);

Th = 0.25;
classNum = 7;% 0 - 6
unit = 8; % window szie
[m,n] = size(image1);

% load image vectors and dictionary
matName = strcat('Vi1_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');
matName = strcat('Vi2_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');

matName = strcat('D0_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');
matName = strcat('D1_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');
matName = strcat('D2_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');
matName = strcat('D3_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');
matName = strcat('D4_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');
matName = strcat('D5_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');
matName = strcat('D6_',num2str(num));
matName = strcat(matName, '.dat');
load(matName, '-mat');

%% get global dictionary
dic_size = 128;
D = zeros(unit*unit,classNum*dic_size);
for i=1:classNum
    tmp_d = eval(['D',num2str(i-1) ]);
    D(:,((i-1)*dic_size+1):dic_size*i) = tmp_d;
end

%% LRR
[vn,vm] = size(Vi1);
disp(strcat('LRR-start'));
tic
[Z1,E1] = solve_lrr(Vi1(2:vn,:),D,lambda,0,1);
[Z2,E2] = solve_lrr(Vi2(2:vn,:),D,lambda,0,1);
toc
disp(strcat('LRR-done'));

%% Fusion
fusion = zeros(m,n);
disp(strcat('fusion-start'));
for i=1:(m-unit+1)
    if rem(i,50)==0
        disp(num2str(i));
    end
    for j=1:(n-unit+1)
        % vector
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
        % reconstructure
        fb = (fv_block+temp)/2;
        fusion(i:(i+7),j:(j+7)) = fb;
    end
end
disp(strcat('fusion-done'));

% figure;imshow(I1);
% figure;imshow(I2);
% figure;imshow(fusion);
imwrite(fusion,fuse_path,'png');

end

end


