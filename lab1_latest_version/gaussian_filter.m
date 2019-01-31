function result = gaussian_filter(img,std)

    h = fspecial('gaussian',6,std);
    result = imfilter(img,h,'symmetric');

end