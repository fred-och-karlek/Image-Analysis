clc
clear

img = imread('paper_with_digits.png');

%img = double(img);
img = gaussian_filter(img,3);

position = [800 600];
radius = 30;
%region_centres = place_regions(position,radius);

%center = region_centres(:,1);
% locate = [];
% for i = 1:9
%     center = region_centres(:,i);
%     x = center(1);
%     y = center(2);
%     %locate = [locate,get_patch(img,x,y,2)]
%     patch = getpatch(img,x,y,radius);
%     
% 

%desc = gradient_descriptor(image, position, radius)

%plot_squares(img, region_centres, radius)    
%region_centres = place_regions(position,radius);
%[grad_x,grad_y] = gradient(img); 
    
    %region_centres = place_regions(position,radius);
    
% x = position(1);
% y = position(2);
% window = get_patch(img,x,y,3*radius);
% window = double(window);
% [grad_x,grad_y] = gradient(window); 
%     
% histogram = gradient_histogram(grad_x,grad_y);

h = gradient_descriptor(img, position, radius);