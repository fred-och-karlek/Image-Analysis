function [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold)

    %triangulation using ransac
    
    count = 0;
    nbr_inliers = 0; 
    k = 0;
    p1 = 0.01;  % probability of missing correct model 
    n_pts = 2; %minimal solver
    num = size(us,2); %number of data points
    inlier_ratio = 1/num;
    k_max = log(p1)/log(1-inlier_ratio^(n_pts));
    k_max = ceil(k_max);
    us_best = [];
    ps_best = [];
    
    while k < k_max
        n = randperm(num,2);
        pick_us = us(:,n); %randomly pick n points
        pick_ps = Ps(:,n);
       
        U = minimal_triangulation(pick_ps, pick_us);
        errors = reprojection_errors(Ps, us, U);
        
        for i = 1:length(errors)
            if errors(i) < threshold
               count = count + 1;
            end
        end    
        if count > nbr_inliers %update as following
             nbr_inliers = count;
             us_best = pick_us;
             ps_best = pick_ps;
             inlier_ratio = nbr_inliers/num;
             if (inlier_ratio == 1)
                 break
             end
             k_max = log(p1)/log(1-inlier_ratio^(n_pts));
             k_max = ceil(k_max);
        end
        k = k + 1;
        count = 0;
    end
    P = ps_best;
    u = us_best;
%     P = pick_ps;
%         u = pick_us;
%         b = -[P{1}(:,4);P{2}(:,4)];
%           A = [P{1}(1,1:3) -u(1,1) 0;
%               P{1}(2,1:3) -u(2,1) 0;
%               P{1}(3,1:3) -1 0;
%               P{2}(1,1:3) 0 -u(1,2);
%               P{2}(2,1:3) 0 -u(2,2);
%               P{2}(3,1:3) 0 -1];
%           X = A\b;
%           U = X(1:3);
     U = minimal_triangulation(P, u);

end