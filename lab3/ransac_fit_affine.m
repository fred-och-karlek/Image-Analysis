function [A,t] = ransac_fit_affine(pts, pts_tilde, threshold)
    
    count = 0;
    inliers = 0; 
    k = 0;
    A_best = [];
    t_best = [];
    p1 = 0.9;  % probability of missing correct model 
    n_pts = 3; %minimal solver
    m = size(pts,2); %m data points
    inlier_ratio = 0.8;
    k_max = log(p1)/log(1-inlier_ratio^(n_pts));
    k_max = ceil(k_max);
    while k < k_max
        n = randperm(m,3);
        esti_p = pts(:,n); %randomly pick n points
        esti_p_tilde = pts_tilde(:,n);
        [A_k,t_k] = estimate_affine(esti_p, esti_p_tilde); 
        residual = residual_lgths(A_k, t_k, pts, pts_tilde)%_tilde)%compute the residual of all data
        for i = 1:length(residual)
            if residual(i) < threshold
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
        count = 0;
    end
    A = A_best;
    t = t_best; 
end