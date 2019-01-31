function region_centres = place_regions(centre,radius)
    x = centre(1); y = centre(2);
    r = radius;
    
    region_centres = [x-2*r,y+2*r;x,y+2*r;x+2*r,y+2*r;x-2*r,y;x,y;x+2*r,y;x-2*r,y-2*r;x,y-2*r;x+2*r,y-2*r]'; 
end

