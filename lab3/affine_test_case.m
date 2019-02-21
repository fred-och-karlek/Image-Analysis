function [pts, pts_tilde, A_true, t_true] = affine_test_case
    
    N = 100;
    outlier_rate = 0.15;
    
    img = read_image('examples/mona.png');

    [row col d] = size(img);
    
    r1 = randi([1 row],1,N-N*outlier_rate);
    r2 = randi([1 col],1,N-N*outlier_rate);

    pts_true = [r1;r2];
    
    A_true = [0.88 0.18; 0.48 0.36];
    t_true = [100;-100];
    
    pts_tilde_true = A_true*pts_true + t_true;
    
    
    %randomly generate outlier
    r3 = randi([1 row],1,N*outlier_rate);
    r4 = randi([1 col],1,N*outlier_rate);
    outlier = [r3;r4];
    
    r5 = randi([1 row],1,N*outlier_rate);
    r6 = randi([1 col],1,N*outlier_rate);
    outlier_tilde = [r5;r6];

    %add outlier and outlier tilde
    pts = [pts_true,outlier];
    pts_tilde = [pts_tilde_true ,outlier_tilde];
   
    %add Uniformly distributed random noise
    pts = pts + 0.01*rand(2,N);
   
    order = randperm(N,N);
    pts = pts(:,order);
    pts_tilde = pts_tilde(:,order);
   

end