function net = train_classifier(layers, imgs_train, labels_train, imgs_val, labels_val)
   
    
    options = trainingOptions('sgdm');

    net = trainNetwork(imgs_train,labels_train, layers, options);

    YPred = double(net.classify(imgs_val));
    YValidation = double(labels_val);

    accuracy = sum(YPred == YValidation)/numel(YValidation)


end