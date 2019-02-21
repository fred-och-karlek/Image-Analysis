clc 
clear

%test sift and ransac

addpath(genpath('/home/miralce/Documents/Image_Analysis/lab3/stuff_for_lab_3'))
addpath(genpath('/home/miralce/Documents/Image_Analysis/lab1'))

source = read_image('vermeer_source.png');
target = read_image('vermeer_target.png');
% 
% source = read_image('CT_1.jpg');        
% target = read_image('CT_2.jpg');

% %A = [0.88 -0.48; 0.48 0.88];
% A = eye(2,2);
% %t = [100;-100];
% t = 0*[100;-100];
%target_size = size(source);
% % warped = affine_warp(target_size, img, A, t);
% % imagesc(warped);
% % axis image;
% %[pts, pts_tilde, A_true, t_true] = affine_test_case
% 
%threshold = 3;%for CT image
threshold = 4;%for vermeer image
upright = false;
warped = align_images(source,target,threshold,upright);
%warped = modi_align_images(source,target,threshold,upright);

switch_plot(warped,target)
axis image;


 

