function histogram = gradient_histogram(grad_x,grad_y)
    bin = linspace(-pi,pi,8);
    value = atan2(grad_x,grad_y);
    length = sqrt(grad_x^2+grad_y^2);
    region = 0; 
    for i=1:8
        if  value > bin(i) && value < bin(i+1)
            region = i;
        end
    end
            
    
end