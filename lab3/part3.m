clc
%run dbg first
num = size(pts1,2);
ls_A = [ones(num,1),pts1'];
Y = pts2';
b = (ls_A'*ls_A)\ls_A'*Y;
   