function [A, t] = estimate_affine(pts, pts_tilde)

%      %add Uniformly distributed random noise
%      pts = pts + 0.01*rand(2,10);

     M = [pts(1) pts(2) 0 0 1 0;
          0 0 pts(1) pts(2) 0 1;
          pts(3) pts(4) 0 0 1 0;
          0 0 pts(3) pts(4) 0 1;
          pts(5) pts(6) 0 0 1 0;
          0 0 pts(5) pts(6) 0 1];
      
     B = [pts_tilde(1);
          pts_tilde(2);
          pts_tilde(3);
          pts_tilde(4);
          pts_tilde(5);
          pts_tilde(6)];
     
     x = M\B;
     
     a = x(1);
     b = x(2);
     c = x(3);
     d = x(4);
     
     t_x = x(5);
     t_y = x(6);
     
     A = [a b;c d];
     t = [t_x;t_y];
end
