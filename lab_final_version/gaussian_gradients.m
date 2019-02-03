function [grad_x,grad_y] = gaussian_gradients(img,std)
    %obtain gray scale image
    img_size = size(img);
    if numel(img_size)>2
        img = rgb2gray(img);
    end
    
    img = double(img);
    img = gaussian_filter(img,std);
    [grad_x,grad_y] = gradient(img); 
    

end