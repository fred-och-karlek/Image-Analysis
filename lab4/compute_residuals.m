function all_residuals = compute_residuals(Ps, us, U)
    
    all_residuals = [];
    N = size(Ps,2);
    
    for i = 1:N
          x_ = (Ps{i}(1,:)*[U;1])/(Ps{i}(3,:)*[U;1]) - us(1,i) ;
          y_ = (Ps{i}(2,:)*[U;1])/(Ps{i}(3,:)*[U;1]) - us(2,i) ;
          r = [x_;y_];
          all_residuals = [all_residuals;r];
    end    

end