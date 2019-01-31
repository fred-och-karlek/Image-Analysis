clc
clear

img = imread('church1.jpg');
imagesc(img)
axis image
%hold on 
[grad_x,grad_y] = gaussian_gradients(img,3);
%quiver(grad_x,grad_y)

% window = get_patch(img,20,20,3)
% 
% direction = atan2(grad_x,grad_y);
% length = sqrt(grad_x.^2+grad_y.^2);
% % histogram = gradient_histogram(grad_x,grad_y);
plot_bouquet(img,3)
% x = zeros(8,1);
% for i = 1:64
%         if direction(i)>-pi && direction(i)<-3*pi/4
%             x(1) = length(i) + x(1);
%         end
%         if direction(i)>-3*pi/4 && direction(i)<-pi/2
%             x(2) = length(i) + x(2);
%         end
%         if direction(i)>-pi/2 && direction(i)<-pi/4
%             x(3) = length(i) + x(3);
%         end
%         
%         if direction(i)>-pi/4 && direction(i)<0
%             x(4) = length(i) + x(4);
%         end
%         if direction(i)>0 && direction(i)<pi/4
%             x(5) = length(i) + x(5);
%         end
%         if direction(i)>pi/4 && direction(i)<pi/2
%             x(6) = length(i) + x(6);
%         end
%         if direction(i)>pi/2 && direction(i)<3*pi/4
%             x(7) = length(i) + x(7);
%         end
%         if direction(i)>3*pi/4 && direction(i)<pi
%             x(8) = length(i) + x(8);
%         end
% end
% xbins = linspace(-pi,pi,8);
% %histogram = histogram(x,xbins)
% figure
% bar(xbins,x)
