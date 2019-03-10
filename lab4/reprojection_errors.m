function errors = reprojection_errors(Ps, us, U)
    errors = [];
    N = size(Ps,2);
    
    positive = check_depths(Ps,U);
    for i = 1:N
        if positive(i)
            x_ = (Ps{i}(1,:)*[U;1])/(Ps{i}(3,:)*[U;1]) - us(1,i) ;
            y_ = (Ps{i}(2,:)*[U;1])/(Ps{i}(3,:)*[U;1]) - us(2,i) ;
            error = sqrt(x_^2+y_^2);
        else
            error = inf;
        end
        errors = [errors; error];
    end
end