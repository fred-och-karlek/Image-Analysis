clc
clear

%consider church1.jpg as a test image
img = imread('church1.jpg');
imagesc(img);
axis image
hold on 
[grad_x,grad_y] = gaussian_gradients(img,3);
quiver(grad_x,grad_y)