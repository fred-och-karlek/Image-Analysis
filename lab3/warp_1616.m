function warped = warp_1616(source)
    warped = [];
    [row, col] = size(source);
    for i = 1:row
        for j = 1:col
            position = [j i];
            
            pos_tilde = transform_coordinates(position);
            
            value = sample_image_at(source,pos_tilde);
            
%            pos_tilde = round(pos_tilde);
            if pos_tilde(1) < 1 || pos_tilde(2) < 1 
            
            else
                %pos_tilde = round(pos_tilde);
                warped(i,j) = value;              
            end
        end
    end

end