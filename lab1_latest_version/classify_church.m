function [label,name] = classify_church(image,feature_collection)

    I1 = rgb2gray(image);I1 = double(I1);
    
    [coords,f1] = extractSIFT(I1);
    
    f2 = feature_collection.descriptors;
    
    f1 = normalize(f1);
    f2 = normalize(f2);
    
    indexPairs = matchFeatures(f2',f1','MatchThreshold',80,'MaxRatio',0.45);
    
    f2_index = indexPairs(:,1);

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