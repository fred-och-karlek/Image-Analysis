clc
clear

test_image = reshape((11:100),10,9);
patch = get_patch(test_image,4,5,3)