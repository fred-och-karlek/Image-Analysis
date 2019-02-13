function [wgrad w0grad] = partial_gradient(w,w0,examples_train,labels_train)


       train_data = cell2mat(examples_train); 
       y = train_data.*w ;
       y = sum(y(:)) + w0;
       p = exp(y)/(1+exp(y));
       if  labels_train == 1   
         wgrad = -train_data + p*train_data;
         w0grad = p - 1;
       else
         wgrad = p*train_data;
         w0grad = p;
       end
end