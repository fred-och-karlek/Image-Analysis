function [grad_x,grad_y] = gaussian_gradients(img)
    
    img_size = size(img);
    if numel(img_size)>2
        img = rgb2gray(img);
    end
    %[row col] = size(img);
    img = double(img);
    [grad_x,grad_y] = gradient(img); 


end