function residual_lgths = residual_lgths(A, t, pts, pts_tilde)

    s = A*pts + t - pts_tilde;
    residual_lgths = sqrt(sum(s.^2));

end
