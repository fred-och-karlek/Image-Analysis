function desc = gradient_descriptor(img, position, radius)
    
    %obtain gray scale image
    img_size = size(img);
    if numel(img_size)>2
        img = rgb2gray(img);
    end
    
    img = double(img);
    
    %use gaussian filter to process image 
    img = gaussian_filter(img,3);
    
    region_centres = place_regions(position,radius);

    h = [];
    for i = 1:9        
        center = region_centres(:,i);
        x = center(1);
        y = center(2);        
        patch = get_patch(img,x,y,radius);
        %computer gradient
        [grad_x,grad_y] = gradient(patch); 
        h = [h,gradient_histogram(grad_x,grad_y)];
    end
    
    %stack the histograms into a 72 vector
    h = reshape(h,[72,1]);
    %normalize
    desc = normalize(h);
    
end