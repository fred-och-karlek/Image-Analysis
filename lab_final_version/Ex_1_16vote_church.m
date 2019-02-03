clc
clear

load church_data.mat
load manual_labels.mat

files_path = 'church_test/church';

guess = [];
for img_nbr = 1:10
    
    address = strcat(files_path,num2str(img_nbr),'.jpg');
    %address
    object = imread(address);
    [label, name] = classify_church(object,feature_collection);
    guess = [guess,name]
   
end

count = 0;
%percent =
for i = 1:10
    if strcmp(guess{i},manual_labels{i})  %guess{i} == manual_labels{i}
        count = count + 1;
    end
end
percent = count/10

