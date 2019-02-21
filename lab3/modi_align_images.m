function warped = modi_align_images(source,target,threshold,upright)
    

    %threshold = 0.8;
    inlier_index = [];
    
    [coords1,descs1] = extractSIFT(mean(source,3),upright);
    [coords2,descs2] = extractSIFT(mean(target,3),upright); 

    
    indexPairs = matchFeatures(descs1', descs2', 'MaxRatio', 0.8, 'MatchThreshold', 100);
    
    s_index = indexPairs(:,1);
    t_index = indexPairs(:,2);
    
    pts1 = coords1(:,s_index);
    pts2 = coords2(:,t_index);size(pts1)
    
    [A,t] = ransac_fit_affine(pts2, pts1, threshold);%the order is weird.
    
    residual = residual_lgths(A, t, pts2, pts1);%order?! compute the residual of all data
    for i = 1:length(residual)
        if residual(i) < threshold    
           inlier_index = [inlier_index,i];
        end
    end    
    
    
    %Least squares
    pts1 = pts1(:,inlier_index);
    pts2 = pts2(:,inlier_index);
    size(pts1)
    [A,t] = least_squares_affine(pts2,pts1);
    
    target_size = size(target);
    
    warped = affine_warp(target_size, source, A, t);

end