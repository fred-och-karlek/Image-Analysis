clc
clear

%test image
img = imread('paper_with_digits.png');

position = [700 900];
radius = 60;

region_centres = place_regions(position,radius)

plot_squares(img, region_centres, radius)    