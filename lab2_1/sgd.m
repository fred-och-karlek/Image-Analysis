function [wgrad w0grad] = partial_gradient(w,w0,examples_train,labels_train)

 
% posi_sum = 0;
% nega_sum = 0;
% r = randi([1 200],1);
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
% loss = -(posi_sum+nega_sum);
% r = randi([1 200],1);
% %r = randi([1 200],1);
% L_i =
% 
% [wgrad w0grad]  


r = randi([1 200],1);
train_data = cell2mat(examples_train(r)); 
y = train_data.*w + w0;
y = sum(y(:));
p = sigmf(y,[1 0]);
w0grad = w0 + (labels_train(1)-p);

r_order = randperm(200,200);
examples_train = examples_train(r_order);
labels_train = labels_train(r_order);

p = [];
x_j = [];
err = [];
update = [];
% for i = 1:200
%     train_data = cell2mat(examples_train(i)); 
%     y = train_data*w + w0;
%     y = sum(y(:));
%     p(i) = sigmf(y,[1 0]);
%     %x_j corresponding to theta j
%     x_j(i) = train_data(i);
% end
for j = 1:1225
    r = randi([1 200],1);
    train_data = cell2mat(examples_train(r)); 
    y = train_data*w + w0;
    y = sum(y(:));
    p = sigmf(y,[1 0]);
    x_j(j) = train_data(j);% col by col
    err(j) = labels_train(r) - p;
    update(j) = x_j(j)*err(j);
    
    %if i > 200 then i = i-200 for 2.7
    %
end
update = reshape(update,[35,35]); % col by col as well
wgrad = w + update;

end