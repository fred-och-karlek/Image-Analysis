function label = classify_digit(digit_image,digits_training)
    
    position = [20 20];
    radius = 6;
    D = Inf;
    des_1 = gradient_descriptor(digit_image, position, radius);
    for i = 1:100
        des_2 = digits_training(i).descriptor;
        v = des_1 - des_2;        
        d = sqrt(v'*v);
        if d < D
           D = d;
           expected = digits_training(i).label;
        end
    end
    label = expected;
    disp(['the most similar one is ' num2str(label) ])
end