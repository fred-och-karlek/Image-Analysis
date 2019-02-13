clc

s = 0.01;
w = s * randn(35,35);
w0 = 0;


for i = 1:15
    [w,w0] = process_epoch(w,w0,0.01,examples_train,labels_train);  
end

% train_data = cell2mat(examples_train(r)); 
% y = train_data.*w + w0;
% y = sum(y(:));
% p = exp(y)/(1+exp(y));

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


%validation
predicted_labels = classify(examples_val,w,w0);

count = 0;
for i = 1:length(labels_val)
    if labels_val(i)==predicted_labels(i) %guess{i} == manual_labels{i}
        count = count + 1;
    end
end
val_percent = count/length(labels_val)


%training
predict = classify(examples_train,w,w0);

count = 0;
for i = 1:length(labels_train)
    if labels_train(i)==predict(i) %guess{i} == manual_labels{i}
        count = count + 1;
    end
end
train_percent = count/length(labels_train)




