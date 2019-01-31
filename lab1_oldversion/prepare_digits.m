clc
clear

load digits.mat

position = [20 20];
radius = 6;

%img = digits_training(63).image;

region_centres = place_regions(position,radius);
%place_regions(img,position,radius);

%plot_squares(img,region_centres,radius)

[dimension iteration] = size(digits_training);
for i = 1:iteration
    img = digits_training(i).image;
    digits_training(i).descriptor = gradient_descriptor(img, position, radius);
end

