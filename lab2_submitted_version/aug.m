%augment
clc

s = 0.01;
w = s * randn(35,35);
w0 = 0;


M = 10;
[examples_train_aug,labels_train_aug] = augment_data(examples_train,labels_train,M);
examples_train_new = [examples_train,examples_train_aug];
labels_train_new = [labels_train,labels_train_aug];

for i = 1:15
    [w,w0] = process_epoch(w,w0,0.01,examples_train_new,labels_train_new);
end




predict_aug_val = classify(examples_val,w,w0);

count = 0;
%percent =
for i = 1:length(labels_val)
    if labels_val(i)==predict_aug_val(i) %guess{i} == manual_labels{i}
        count = count + 1;
    end
end
val_percent_aug = count/length(labels_val)

predict_aug_train = classify(examples_train_new,w,w0);
count = 0;
%percent =
for i = 1:length(labels_train_new)
    if labels_train_new(i)==predict_aug_train(i) %guess{i} == manual_labels{i}
        count = count + 1;
    end
end
train_percent_aug = count/length(labels_train_new)
