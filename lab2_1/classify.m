function predicted_labels = classify(examples_val,w,w0)

    predicted_labels = [];
    for i = 1:length(examples_val)
        I = cell2mat(examples_val(i));
        value = I.*w + w0;
        value = sum(value(:));
        if value > 0 
           predicted_labels(i) = 1;
        else
           predicted_labels(i) = 0;
        end
    end
           
end