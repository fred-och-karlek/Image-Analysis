%ransac test

clc

addpath(genpath('/home/miralce/Documents/Image_Analysis/lab4'))
load sequence.mat

threshold = 5;
Us = [];

for i = 1:32183
    
    Ps = triangulation_examples(i).Ps;
    us = triangulation_examples(i).xs; 
    i
    [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold);
    Us = [U,Us];
    
end
figure
scatter3(Us(1,:),Us(2,:),Us(3,:),'.')
axis equal
axis([-20 -10 1 7 0 8])
Uc = clean_for_plot(Us)
figure
scatter3(Uc(1,:),Uc(2,:),Uc(3,:),'.')
axis equal