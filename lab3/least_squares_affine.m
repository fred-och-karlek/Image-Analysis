function [A,t] = least_squares_affine(pts,pts_tilde)
    
    num = size(pts,2);
    ls_A = [ones(num,1),pts'];
    Y = pts_tilde';
    b = (ls_A'*ls_A)\ls_A'*Y;
    A = [b(2) b(3);b(5) b(6)];
    t = [b(1);b(4)];
    
end