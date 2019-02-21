clc
clear 

addpath(genpath('/home/miralce/Documents/Image_Analysis/lab3/stuff_for_lab_3'))
addpath(genpath('/home/miralce/Documents/Image_Analysis/lab1'))

threshold = 0.8;
upright = true;
inlier_index = [];

% source = read_image('CT_1.jpg');
% target = read_image('CT_2.jpg');

source = read_image('vermeer_source.png');
target = read_image('vermeer_target.png');

    [coords1,descs1] = extractSIFT(mean(source,3),upright);
    [coords2,descs2] = extractSIFT(mean(target,3),upright);
    
    indexPairs = matchFeatures(descs1', descs2', 'MaxRatio', 0.8, 'MatchThreshold', 100);
    
    s_index = indexPairs(:,1);
    t_index = indexPairs(:,2);
    
    pts1 = coords1(:,s_index);
    pts2 = coords2(:,t_index);
    
  % [A,t] = ransac_fit_affine(pts1, pts2, threshold);
    
    count = 0;
    inliers = 0; 
    k = 0;
    A_best = [];
    t_best = [];
    p1 = 0.8;  % probability of missing correct model 
    n_pts = 3; %minimal solver
    m = size(pts1,2); %m data points
    inlier_ratio = 0.85;
    k_max = log(p1)/log(1-inlier_ratio^(n_pts));
    k_max = ceil(k_max);
    while k < k_max
        n = randperm(m,3);
        esti_p = pts1(:,n); %randomly pick n points
        esti_p_tilde = pts2(:,n);
        [A_k,t_k] = estimate_affine(esti_p, esti_p_tilde); 
        residual = residual_lgths(A_k, t_k, pts1, pts2);
        for i = 1:length(residual)
            if residual(i) < threshold
               inlier_index = [inlier_index, i];
                count = count + 1;
            end
        end    
        if count > inliers %update as following
             inliers = count;
             A_best = A_k;
             t_best = t_k;
             inlier_ratio = inliers/m;
             k_max = log(p1)/log(1-inlier_ratio^(n_pts));
             k_max = ceil(k_max);
        end
        k = k + 1;
    end
   
    A = [-0.39 -0.0729;0.09 -0.3145];
    t = [897;787];

    
    pts1 = pts1(:,inlier_index);
    pts2 = pts2(:,inlier_index);
    %[A,t] = least_squares_affine(pts1,pts2);
     %A = A_best;
     %t = t_best; 
    
    %target_size = size(target);
    %warped = affine_warp(target_size, source, A, t);
    warped = align_images(source,target,threshold,upright);
    switch_plot(warped,target);
    axis image;
