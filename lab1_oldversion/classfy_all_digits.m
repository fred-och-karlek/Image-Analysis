clc
clear

load digits.mat

prepare_digits
count = 0;

[di ite] = size(digits_validation);
guess = [];
for i = 1:ite
    img = digits_validation(i).image;
    label = classify_digit(img,digits_training);
    guess = [guess,label];    
end


for i = 1:50
    if guess(i)==digits_validation(i).label  %guess{i} == manual_labels{i}
        count = count + 1;
    end
end
percent = count/50

% img = digits_validation(11).image;
% label = classify_digit(img,digits_training);