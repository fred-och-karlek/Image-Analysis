function [w,w0] = process_epoch(w,w0,lrate,examples_train,labels_train)

index = randperm(size(examples_train,2))
for i = 1:size(examples_train,2)
    [wgrad w0grad] = partial_gradient(w,w0,examples_train(index(i)),labels_train(index(i)));
    w = w - lrate*wgrad;
    w0 = w0 - lrate*w0grad; 
end

%in sequence

% for i = 1:size(examples_train,2)
%     [wgrad w0grad] = partial_gradient(w,w0,examples_train(i),labels_train(i));
%     w = w - lrate*wgrad;
%     w0 = w0 - lrate*w0grad; 
% end

end