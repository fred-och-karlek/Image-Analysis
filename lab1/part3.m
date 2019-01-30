clear
clc

img1 = imread('church1.jpg');
img2 = imread('church2.jpg');

img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

img1 = double(img1);
img2 = double(img2);

[coords_1, descs_1] = extractSIFT(img1);
[coords_2, descs_2] = extractSIFT(img2);
% 
% corrs = matchFeatures(descs_1, descs_2, 'MatchThreshold', 100, 'MaxRatio', 0.7);
% imshow(corrs)
%%
img1 = imread('church1.jpg');
img1 = rgb2gray(img1);
points1 = detectSURFFeatures(img1);
[f1,vpts1] = extractFeatures(img1,points1);

