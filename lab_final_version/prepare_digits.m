clc
clear

load digits.mat

%choose suitable position and radius
position = [20 20];
radius = 6;

region_centres = place_regions(position,radius);

[dimension iteration] = size(digits_training);

%calculate the descriptor for each training data
for i = 1:iteration
    img = digits_training(i).image;
    digits_training(i).descriptor = gradient_descriptor(img, position, radius);
end


