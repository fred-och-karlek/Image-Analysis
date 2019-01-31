I1 = rgb2gray(imread('church1.jpg'));
I2 = imresize(imrotate(I1,-20),1.2);
%I2 = rgb2gray(imread('church2.jpg'));


I1 = double(I1);
I2 = double(I2);
%points1 = detectSURFFeatures(I1);
%points2 = detectSURFFeatures(I2);

[coords_1, f1] = extractSIFT(I1);
[coords_2, f2] = extractSIFT(I2);

%[f1,vpts1] = extractFeatures(I1,points1);
%[f2,vpts2] = extractFeatures(I2,points2);

coords_1 = coords_1';
coords_2 = coords_2';

coo_11 = coords_1(:,1);
coo_12 = coords_1(:,2);
coo_21 = coords_2(:,1);
coo_22 = coords_2(:,2);

indexPairs = matchFeatures(f1',f2') ;
matchedPoints1 = [coo_11(indexPairs(:,1)),coo_12(indexPairs(:,1))]; 
matchedPoints2 = [coo_21(indexPairs(:,2)),coo_22(indexPairs(:,2))];

figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');

%%
I1 = rgb2gray(imread('church1.jpg'));
I2 = imresize(imrotate(I1,-20),1.2);
%I2 = rgb2gray(imread('church2.jpg'));


points1 = detectSURFFeatures(I1);
points2 = detectSURFFeatures(I2);

[f1,vpts1] = extractFeatures(I1,points1);
[f2,vpts2] = extractFeatures(I2,points2);


indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');

