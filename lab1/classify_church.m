function [label,name] = classify_church(image,feature_collection)

    I1 = rgb2gray(image);I1 = double(I1);
    
    [coords,f1] = extractSIFT(I1);
    
    f2 = feature_collection.descriptors;
    
    indexPairs = matchFeatures(f1',f2');
    
    f2_index = indexPairs(:,2);

    %find label value in dataset
    l = feature_collection.labels(f2_index);

    %Most frequent values in array
    label = mode(l);
    
    if isnan(label) 
        %disp('cannot match');
        label = 'unknown';
        name = 'unknown';
    else
        name = feature_collection.names(label);
    end
end