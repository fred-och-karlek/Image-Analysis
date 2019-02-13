clc


[imgs, labels] = digitTrain4DArrayData;
layers =  better_basic_cnn_classifier();
options = trainingOptions('sgdm');
net = trainNetwork(imgs, labels, layers, options);

pred = []
[t_imgs, t_labels] = digitTest4DArrayData;
for i = 1:size(t_imgs,4)
    target = t_imgs(:,:,:,i);
    pred(i) = net.classify(target);
end

count = 0;
mistake = [];
%percent =
for i = 1:size(t_labels,1)
        real = double(t_labels(i));
    if  pred(i)==real %guess{i} == manual_labels{i}
        count = count + 1;
    else
        mistake = [mistake,i]; 
    end
end
percent = count/size(t_labels,1)

%label
l = double(t_labels);
% l1 = length(find(l==1)); 
% l2 = length(find(l==2)); 
% l3 = length(find(l==3)); 
% l4 = length(find(l==4)); 
% l5 = length(find(l==5)); 
% l6 = length(find(l==6)); 
% l7 = length(find(l==7)); 
% l8 = length(find(l==8)); 
% l9 = length(find(l==9)); 
% l10 = length(find(l==10)); 
% 
% %c classfy as
% c1 = length(find(pred==1)); 
% c2 = length(find(pred==2)); 
% c3 = length(find(pred==3)); 
% c4 = length(find(pred==4)); 
% c5 = length(find(pred==5)); 
% c6 = length(find(pred==6)); 
% c7 = length(find(pred==7)); 
% c8 = length(find(pred==8)); 
% c9 = length(find(pred==9)); 
% c10 = length(find(pred==10)); 
% %mistake
% m1 = length(find(l(mistake)==1)); 
% m2 = length(find(l(mistake)==2)); 
% m3 = length(find(l(mistake)==3)); 
% m4 = length(find(l(mistake)==4)); 
% m5 = length(find(l(mistake)==5)); 
% m6 = length(find(l(mistake)==6)); 
% m7 = length(find(l(mistake)==7)); 
% m8 = length(find(l(mistake)==8)); 
% m9 = length(find(l(mistake)==9)); 
% m10 = length(find(l(mistake)==10)); 
% %p
% p1 = (l1-m1)/c1;
% p2 = (l2-m2)/c2; 
% p3 = (l3-m3)/c3;
% p4 = (l4-m4)/c4;
% p5 = (l5-m5)/c5;
% p6 = (l6-m6)/c6;
% p7 = (l7-m7)/c7;
% p8 = (l8-m8)/c8;
% p9 = (l9-m9)/c9;
% p10 = (l10-m10)/c10;
% 
% %r
% r1 = (l1-m1)/l1;
% r2 = (l2-m2)/l2; 
% r3 = (l3-m3)/l3;
% r4 = (l4-m4)/l4;
% r5 = (l5-m5)/l5;
% r6 = (l6-m6)/l6;
% r7 = (l7-m7)/l7;
% r8 = (l8-m8)/l8;
% r9 = (l9-m9)/l9;
% r10 = (l10-m10)/l10;

label = [];
c = [];
m = [];
p = [];
r = [];
for i = 1:10
    label(i) = length(find(l==i)); 
    c(i) = length(find(pred==i));
    m(i) = length(find(l(mistake)==i));
    p(i) = (label(i)-m(i))/c(i);
    r(i) = (label(i)-m(i))/label(i);
end
p
r
