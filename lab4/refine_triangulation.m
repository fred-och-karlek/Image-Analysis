function U = refine_triangulation(Ps, us, Uhat)

    iteration = 5;
    U = Uhat;
    for i = 1:iteration 
        j = compute_jacobian(Ps, Uhat);
        r = compute_residuals(Ps, us, Uhat);
        U = U - (j'*j)\j'*r;%x = A\b ,x = inv(A)*b
    end
    
end