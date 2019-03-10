%refine triangulation test

clc

addpath(genpath('/home/miralce/Documents/Image_Analysis/lab4'))

load gauss_newton.mat


figure
scatter3(Uhat(1,:),Uhat(2,:),Uhat(3,:),'.')

U = [];
for i = 1:613 %update 613 uhat
    
    Ps = {P,P_tilde};
    us = [u(:,i), u_tilde(:,i)];
    uhat =  Uhat(:,i);
    %refine triangulation based on 2 corresponding points.
    U_new = refine_triangulation(Ps, us, uhat); 
    U = [U, U_new];
end


figure
scatter3(U(1,:),U(2,:),U(3,:),'.')
