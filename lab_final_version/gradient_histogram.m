function histogram = gradient_histogram(grad_x,grad_y)
    %get the orientation of each gradient
    direction = atan2(grad_y,grad_x);
    
    [n m] = size(grad_x);
    
    length = sqrt(grad_x.^2+grad_y.^2);
    
    %initialize x 
    x = zeros(8,1);
   
    %each gradient is classified according to orientation
    %and its length is added to corrsponding histogram bin
    for i = 1:n*m
        if direction(i)>-pi && direction(i)<-3*pi/4
            x(8) = length(i) + x(8);
        end
        if direction(i)>-3*pi/4 && direction(i)<-pi/2
            x(7) = length(i) + x(7);
        end
        if direction(i)>-pi/2 && direction(i)<-pi/4
            x(6) = length(i) + x(6);
        end
        
        if direction(i)>-pi/4 && direction(i)<0
            x(5) = length(i) + x(5);
        end
        if direction(i)>0 && direction(i)<pi/4
            x(4) = length(i) + x(4);
        end
        if direction(i)>pi/4 && direction(i)<pi/2
            x(3) = length(i) + x(3);
        end
        if direction(i)>pi/2 && direction(i)<3*pi/4
            x(2) = length(i) + x(2);
        end
        if direction(i)>3*pi/4 && direction(i)<pi
            x(1) = length(i) + x(1);
        end
    end
    histogram = x;
end
