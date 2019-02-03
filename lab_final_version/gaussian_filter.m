function result = gaussian_filter(img,std)

    h = fspecial('gaussian',2,std);
    result = imfilter(img,h,'symmetric');

end