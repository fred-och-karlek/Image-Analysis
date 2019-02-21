clc
clear 

addpath(genpath('/home/miralce/Documents/Image_Analysis/lab3/stuff_for_lab_3'))

img = read_as_grayscale('source_16x16.tif');

% 
% warped = [];
%     [row col] = size(img);
%     for i = 1:row
%         for j = 1:col
%             position = [i j];
%             value = sample_image_at(img,position);
%             pos_tilde = transform_coordinates(position);
%             pos_tilde = ceil(pos_tilde);
%             warped(pos_tilde(1),pos_tilde(2)) = value;      
%         end
%     end

warped = warp_1616(img);
imagesc(warped)
