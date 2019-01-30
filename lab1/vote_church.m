clc
clear

load church_data.mat
load manual_labels.mat

files_path = 'church_test/church';
%img_list = dir(strcat(files_path,'*.jpg'));
guess = [];
for img_nbr = 1:10
    
    address = strcat(files_path,num2str(img_nbr),'.jpg');
    object = imread(address);
    [label, name] = classify_church(object,feature_collection);
    guess = [guess,name];
   
end

count = 0;
%percent =
for i = 1:10
    if strcmp(guess{i},manual_labels{i})  %guess{i} == manual_labels{i}
        count = count + 1;
    end
end
percent = count/10

% image = imread('church_test/church4.jpg');
% % 
% % for image_nbr = 1:10
% %     image_name = '/church_test/church+'num2str(image_nbr)'.jpg';
% %     'hello'
% % end
% 
% 
% I1 = rgb2gray(image);
% I1 = double(I1);
% %classify_church(image,feature_collection)
% [coords,f1] = extractSIFT(I1);
% f2 = feature_collection.descriptors;
% indexPairs = matchFeatures(f1',f2');
% 
% f2_index = indexPairs(:,2)
% 
% l = feature_collection.labels(f2_index)
% mode(l)
