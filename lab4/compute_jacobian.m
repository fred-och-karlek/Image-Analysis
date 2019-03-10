function jacobian = compute_jacobian(Ps, U)
    
    jacobian = [];
    N = size(Ps,2);
   
    for i = 1:N
          P3U_2 =  (Ps{i}(3,:)*[U;1])^2;
          dx1 = (Ps{i}(1,1)*(Ps{i}(3,:)*[U;1]) - (Ps{i}(1,:)*[U;1])*Ps{i}(3,1)) / P3U_2 ;
          dx2 = (Ps{i}(1,2)*(Ps{i}(3,:)*[U;1]) - (Ps{i}(1,:)*[U;1])*Ps{i}(3,2)) / P3U_2 ;
          dx3 = (Ps{i}(1,3)*(Ps{i}(3,:)*[U;1]) - (Ps{i}(1,:)*[U;1])*Ps{i}(3,3)) / P3U_2 ;
          dy1 = (Ps{i}(2,1)*(Ps{i}(3,:)*[U;1]) - (Ps{i}(2,:)*[U;1])*Ps{i}(3,1)) / P3U_2 ;
          dy2 = (Ps{i}(2,2)*(Ps{i}(3,:)*[U;1]) - (Ps{i}(2,:)*[U;1])*Ps{i}(3,2)) / P3U_2 ;
          dy3 = (Ps{i}(2,3)*(Ps{i}(3,:)*[U;1]) - (Ps{i}(2,:)*[U;1])*Ps{i}(3,3)) / P3U_2 ;

          r = [dx1 dx2 dx3 ; dy1 dy2 dy3];
          jacobian = [jacobian;r];
    end    

end