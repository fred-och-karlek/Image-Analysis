clc 
clear

%test sift and ransac

addpath(genpath('/home/miralce/Documents/Image_Analysis/lab3/stuff_for_lab_3'))
addpath(genpath('/home/miralce/Documents/Image_Analysis/lab1'))



source = read_as_grayscale('tissue_brightfield.tif'); 
target = read_as_grayscale('tissue_fluorescent.tif');

target = 1 - target;


threshold = 0.7;
upright = false;
warped = align_images(source,target,threshold,upright);

switch_plot(warped,target)
axis image;