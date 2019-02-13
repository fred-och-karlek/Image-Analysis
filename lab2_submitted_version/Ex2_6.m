%test file
clc

s = 0.01;
w = s * randn(35,35);
w0 = 0;


for i = 1:15
    [w,w0] = process_epoch(w,w0,0.01,examples_train,labels_train);
%     figure(1)
%     subplot(2,3,i);
%     imagesc(w);
%     title(i)
end
% 
figure(1)
imagesc(w)


