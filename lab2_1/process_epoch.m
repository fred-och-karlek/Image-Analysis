function [w,w0] = process_epoch(w,w0,lrate,examples_train,labels_train)

% for i = 1:lrate
%     [wgrad w0grad] = partial_gradient(w,w0,examples_train,labels_train);
%     figure(i)
%     imagesc(wgrad)
% end
% 
% w = wgrad;
% w0 = w0grad;
idx = randperm(size(examples_train),2)
for i = 1:size(examples_train,2)
    %[wgrad w0grad] = partial_gradient(w,w0,examples_train,labels_train);
    [wgrad w0grad] = partial_gradient(w,w0,examples_train{idx(i)},labels_train(idx(i)));
    w = w - lrate*wgrad;
    w0 = w0 - lrate*w0grad; 
end

end