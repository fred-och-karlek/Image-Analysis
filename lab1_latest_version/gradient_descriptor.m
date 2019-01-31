function desc = gradient_descriptor(img, position, radius)
    

    %img = imread(image);
    img_size = size(img);
    if numel(img_size)>2
        img = rgb2gray(img);
    end
    %[row col] = size(img);
    img = double(img);
    img = gaussian_filter(img,3);
    
    region_centres = place_regions(position,radius);
    %[grad_x,grad_y] = gradient(img); 
    
    %region_centres = place_regions(position,radius);
    h = [];
    for i = 1:9
        
        center = region_centres(:,i);
        x = center(1);
        y = center(2);
        %locate = [locate,get_patch(img,x,y,2)]
        patch = get_patch(img,x,y,radius);
        [grad_x,grad_y] = gradient(patch); 
        h = [h,gradient_histogram(grad_x,grad_y)];
    end
    
    %histogram = gradient_histogram(grad_x,grad_y);
    h = reshape(h,[72,1]);
    desc = normalize(h);
end