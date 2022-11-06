clear;
close all;
clc;

% Spatial domain filters that is based on Sobel operators
[X,map] = imread("goldhill.bmp");
goldhill = ind2rgb(X,map);
subplot(3,2,1);
imshow(goldhill);
title('Original image');
subplot(3,2,2);
imshow(goldhill);
title('Original image');

[r,c,color] = size(goldhill);
fprintf("%d,%d",r,c);
% Sobel operator matrix horizontal/ vertical
MHor = [-1 -2 -1;0 0 0;1 2 1];
MVer = [-1 0 1;-2 0 2;-1 0 1];
M = zeros(r,c);
for i=2:(r-1)
    for j =2:(c-1)
        mh = (-1)*goldhill(j-1,i-1)+(-2)*goldhill(j,i-1)+(-1)*goldhill(j+1,i-1)+1*goldhill(j-1,i+1)+2*goldhill(j,i+1)+1*goldhill(j+1,i+1);
        mv = (-1)*goldhill(j-1,i-1)+1*goldhill(j+1,i-1)+(-2)*goldhill(j-1,i)+2*goldhill(j+1,i)+(-1)*goldhill(j-1,i+1)+1*goldhill(j+1,i+1);
        M(j+1,i+1) = sqrt(mh.^2+mh.^2);
    end
end

M =double(M);
subplot(3,2,3);
imshow(M);
title('Filtered image');
subplot(3,2,4);
imshow(M,[]);
title('Filtered image, []');

M =im2bw(M);
subplot(3,2,5);
imshow(M);
title('Edge Enhancement image');
subplot(3,2,6);
imshow(M,[]);
title('Edge Enhancement image, []');

