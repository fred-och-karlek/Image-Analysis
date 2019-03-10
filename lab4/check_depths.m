function positive = check_depths(Ps,U)
   
    depth = [];
    N = size(Ps,2);    
    for i = 1:N
        depth = [depth; Ps{i}(3,:)*[U;1]];
    end
    positive = (depth > 0);
    
end