function gray_image = read_as_grayscale(path_to_file)
    raw_image = read_image(path_to_file);
    raw_image = im2double(raw_image);
    gray_image = mean(raw_image,3);
    %imshow(gray_image)
end