clc

s = 0.01;
w = s * randn(35,35);
w0 = 0;


% for i = 1:5
%     [w,w0] = process_epoch(w,w0,0.8,examples_train,labels_train);
%     figure(i)
%     imagesc(w);
%     %imshow(w);
%    
% end

r = randi([1 300],1)

train_data = cell2mat(examples_train(r)); 
y = train_data.*w + w0;
y = sum(y(:));
p = exp(y)/(1+exp(y));