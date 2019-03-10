function E = essentialMatrix(P1,P2)
    E = [];
    
    R1 = P1(:,1:3);
    R2 = P2(:,1:3);
    t1 = P1(:,end);
    t2 = P2(:,end);
    
%     I1 = kR1\kt1;
%     I2 = kR2\kt2;
%     
%     [U1 S1 V1] = svd(I1);
%     [U2 S2 V2] = svd(I2);
%     
%     E = V1(:,end);
%     E = [E V2(:,end)]

    R = R1./R2;
    t = t2 - R*t1;
    t_x = [0 -t(3) t(2);t(3) 0 -t(1);-t(2) t(1) 0];
    E = t_x*R;

end
