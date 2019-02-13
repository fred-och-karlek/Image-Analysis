clc
clear

epoch = 3;
% [imgs, labels] = digitTrain4DArrayData;
% imagesc(imgs(:,:,:,25))%, axis image, colormap gray
% img = imgs(:,:,:,25);
% % layers = [
% % imageInputLayer([35 35 1]);
% % fullyConnectedLayer(1);
% % softmaxLayer();
% % classificationLayer()];
% layers = basic_cnn_classifier();
% 
% options = trainingOptions('sgdm');
% 
% net = trainNetwork(imgs, labels, layers, options);
% net.predict(img)
% Ex 2.14 Work out how many trainable parameters your network contains. (This is a common exam
% question.) Include the answer in your submission. If you explore what the data structure net actually
% contains, you can find the answer there as well. Note that the convolution layer does not use padding so
% the output from the convolution layer is smaller than the input.

[imgs, labels] = digitTrain4DArrayData;
layers = basic_cnn_classifier();

perm = randperm(5000,1000);
imgs_val = imgs(:,:,:,perm);
labels_val = labels(perm);
index = randperm(5000,5000);
r_train = setdiff(index,perm,'stable');
imgs_train = imgs(:,:,:,r_train) ;
labels_train = labels(r_train);
%net = train_classifier(layers, imgs, labels, imgs_val, labels_val)

options = trainingOptions('sgdm');
net = trainNetwork(imgs_train,labels_train, layers, options);

for i = 1:epoch
    net =  train_classifier(net.Layers, imgs_train, labels_train, imgs_val, labels_val);
    
end
