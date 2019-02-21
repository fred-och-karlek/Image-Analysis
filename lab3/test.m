clc
clear


addpath(genpath('/home/miralce/Documents/Image_Analysis/lab3/stuff_for_lab_3'))

img = read_image('examples/mona.png');
A = [0.88 -0.48; 0.48 0.88];
t = [100;-100];
target_size = size(img);
warped = affine_warp(target_size, img, A, t);
imagesc(warped);
axis image;