function warped = align_images(source,target,threshold,upright)
    

    %threshold = 0.8;
    
    [coords1,descs1] = extractSIFT(mean(source,3),upright);
    [coords2,descs2] = extractSIFT(mean(target,3),upright); 

    
    indexPairs = matchFeatures(descs1', descs2', 'MaxRatio', 0.8, 'MatchThreshold', 100);
    
    s_index = indexPairs(:,1);
    t_index = indexPairs(:,2);
    
    pts1 = coords1(:,s_index);
    pts2 = coords2(:,t_index);
    
    [A,t] = ransac_fit_affine(pts2, pts1, threshold)
    
    target_size = size(target);
    
    warped = affine_warp(target_size, source, A, t);

end