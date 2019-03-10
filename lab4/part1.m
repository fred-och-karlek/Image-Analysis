clc 

addpath(genpath('/home/miralce/Documents/Image_Analysis/lab4'))

noise = 0.01;
[Ps, us, U_true] = triangulation_test_case(noise);

U = minimal_triangulation(Ps, us);

load sequence.mat


%       b = -[Ps{1}(:,4);Ps{2}(1:2,4)];
%       A = [Ps{1}(1,1:3) -1 0;
%           Ps{1}(2,1:3) -1 0;
%           Ps{1}(3,1:3) -1 0;
%           Ps{2}(1,1:3) 0 -1;
%           Ps{2}(2,1:3) 0 -1]
%           %Ps{2}(3,1:3) 0 -1]
%       X = A\b;
%       U = X(1:3)