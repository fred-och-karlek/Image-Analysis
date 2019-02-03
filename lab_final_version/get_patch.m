function patch = get_patch(image,x,y,patch_radius)
    
    r = patch_radius;
    msg = 'Patch outside image borders';
    [row,col]= size(image);
    if (x-r)<1 ||(y-r)<1 ||(y+r)>row ||(x+r)>col
        error(msg)
    end   
    %define the patch region
    patch = image(y-r:y+r,x-r:x+r);

end