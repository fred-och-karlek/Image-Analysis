function [wgrad w0grad] = partial_gradient(w,w0,examples_train,labels_train)

       r_order = randperm(300,300);
       examples_train = examples_train(r_order);
       labels_train = labels_train(r_order);
       r = randi([1 300],1);

       train_data = cell2mat(examples_train(r)); 
       y = train_data.*w ;
       y = sum(y(:)) + w0;
       p = exp(y)/(1+exp(y));
       if  labels_train(r) == 1   
         wgrad = -train_data + p*train_data;
         w0grad = p - 1;
       else
         wgrad = p*train_data;
         w0grad = p;
       end
end