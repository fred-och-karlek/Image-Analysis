function [wgrad w0grad] = partial_gradient(w,w0,examples_train,labels_train)

posi_sum_w = 0;
nega_sum_w = 0;

posi_sum_w0 = 0;
nega_sum_w0 = 0;

   for i = 1:length(examples_train)
       train_data = cell2mat(examples_train(i)); 
       y = train_data*w + w0;
       p = exp(y)/(1+y);
       if  labels_train(i) == 1   
         posi_sum_w =  posi_sum_w + (train_data-p.*train_data);
         posi_sum_w0 = posi_sum_w0 + 1 - p; 
       else
         nega_sum_w = nega_sum_w + p.*train_data;
         nega_sum_w0 = nega_sum_w0 + p;
       end
   end
   wgrad = -posi_sum + nega_sum_w;
   w0 = -posi_sum_w0 + nega_sum_w0;
end