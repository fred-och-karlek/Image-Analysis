function value = sample_image_at(img,position)
   % img = mean(img,3);
    position = round(position); 
    [row, col] = size(img);
    if (position(1) >row || position(2) > col || position(1) < 1 || position(2) < 1) 
        value = 1;
    else 
        value = img(position(2),position(1));
        %value = ceil(value);
    end
end