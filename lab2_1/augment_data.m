function [examples_train_aug,labels_train_aug] = augment_data(examples_train,labels_train,M)
    examples_train_aug = [];
    for i = 1:length(examples_train)
        I = cell2mat(examples_train(i));
        I = imrotate(I,M);
     %   examples_train_aug = [examples_train_aug,mat2cell(I,[35],[35])];
     %   examples_train_aug(i) = mat2cell(I,35,35);
        examples_train_aug = [examples_train_aug, I];
        labels_train_aug(i) = labels_train(i);
    end
    examples_train_aug = mat2cell
end