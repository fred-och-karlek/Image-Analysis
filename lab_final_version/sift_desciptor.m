clc
clear

test_image = imread('test_i.jpg');
% size(test_image)
% x = 500;
% y = 300;
% patch_radius = 10;
% patch = get_patch(test_image,x,y,patch_radius);
% imshow(patch)


%test_image = reshape((11:100), 10, 9)
%get_patch(test_image,1,8,2);
%result = gaussian_filter(test_image,3);
%imshow(result);

%t = rgb2gray(test_image)
%imshow(t)

%1.6 plot
%[grad_x,grad_y] = gaussian_gradients(test_image)
%imagesc(test_image)
%imshow(test_image)
%axis image
%hold on
%quiver(grad_x, grad_y)
% 
% x = linspace(1,10,50);
% y = sin(x);
%[coords, descriptors] = extractSIFT(test_image);
%load  test_i.jpg
% I = vl_impattern('roofs1');
% image(I) 
% I = single(rgb2gray(I)); 
% [f,d] = vl_sift(I) ;
% 
%test_image = double(test_image);
%I = vl_impattern(test_image);
%[coords, descriptors] = extractSIFT(test_image)