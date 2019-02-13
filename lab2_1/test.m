%test file
clc


s = 0.01;
w = s * randn(35,35);
w0 = 0;
% 
% train_data = cell2mat(examples_train(95));
% 
% y = train_data*w + w0;
% y = sum(y(:));
% p = sigmf(y,[1 0])

% posi_sum = 0;
% nega_sum = 0;
% for i = 1:length(examples_train)
%     train_data = cell2mat(examples_train(i)); 
%     y = train_data*w + w0;
%     y = sum(y(:));
%     p = sigmf(y,[1 0]);
%     if  labels_train(i) == 1   
%         posi_sum =  posi_sum + log(p);
%     else
%         nega_sum = nega_sum + log(1-p);
%     end
% end
% loss = -(posi_sum+nega_sum)




for i = 1:5
    [w,w0] = process_epoch(w,w0,0.6,examples_train,labels_train);
    %figure(i)
    %imagesc(w);
    %imshow(w);   
    w0;
    w;
end


predicted_labels = classify(examples_val,w,w0);

count = 0;
%percent =
for i = 1:length(labels_val)
    if labels_val(i)==predicted_labels(i) %guess{i} == manual_labels{i}
        count = count + 1;
    end
end
percent = count/length(labels_val)


% M = 0.2;
% [examples_train_aug,labels_train_aug] = augment_data(examples_train,labels_train,M);
% examples_train_new = [examples_train_aug,examples_train]; 
% [w,w0] = process_epoch(w,w0,15,examples_train_new,labels_train);
% 
% predicted_labels = classify(examples_val,w,w0);
% 
% count = 0;
% %percent =
% for i = 1:length(labels_val)
%     if labels_val(i)==predicted_labels(i) %guess{i} == manual_labels{i}
%         count = count + 1;
%     end
% end
% percent = count/length(labels_val)
% 
