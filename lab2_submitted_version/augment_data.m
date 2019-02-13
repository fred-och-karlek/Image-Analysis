function [examples_train_aug,labels_train_aug] = augment_data(examples_train,labels_train,M)
    examples_train_aug = {};
    j = 0;
    r = randi([-20 20],1,M*size(examples_train,2));
    for i = 1:length(examples_train)*M
        j = j + 1;
        if j > length(examples_train)
           j = j - length(examples_train);
        end
        I = examples_train{j};
        I = imrotate(I,r(i),'bilinear');
        examples_train_aug{i} = I(1:35,1:35,:);
        labels_train_aug(i) = labels_train(j);
    end
 
end

