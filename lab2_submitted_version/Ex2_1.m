clc
clear

load cell_data.mat
%fg positive; bg positive

examples = [cell_data.bg_patches,cell_data.fg_patches];
%examples = cell(examples1);
labels = [zeros(1,200),ones(1,200)];
%labels = cell(labels)


%randperm function gives us random number without repetition
r_train = randperm(400,300); %75percent of data is used to train

%imshow(cell_data.fg_patches{1,185})

examples_train = examples(r_train);
labels_train = labels(r_train);

%shoule I consider test set? 
index = randperm(400,400);
%stable keep random all the time 
r_val = setdiff(index,r_train,'stable');
examples_val = examples(r_val) ;
labels_val = labels(r_val);
