clear;
close all;
clc;

% Spatial domain filters that is based on Sobel operators
%%%%%%%%%%%%
% Goldhill %
%%%%%%%%%%%%
[X,map] = imread("goldhill.bmp");
goldhill = ind2rgb(X,map);
subplot(3,2,1);
imshow(goldhill);
title('Original image');
subplot(3,2,2);
imshow(goldhill);
title('Original image');

[r,c,color] = size(goldhill);

% Sobel operator matrix horizontal/ vertical
MHor = [-1 -2 -1;0 0 0;1 2 1];
MVer = [-1 0 1;-2 0 2;-1 0 1];
M = zeros(r,c);
for i=2:(r-1)
    for j =2:(c-1)
        mh = (-1)*goldhill(j-1,i-1)+(-2)*goldhill(j,i-1)+(-1)*goldhill(j+1,i-1)+1*goldhill(j-1,i+1)+2*goldhill(j,i+1)+1*goldhill(j+1,i+1);
        mv = (-1)*goldhill(j-1,i-1)+1*goldhill(j+1,i-1)+(-2)*goldhill(j-1,i)+2*goldhill(j+1,i)+(-1)*goldhill(j-1,i+1)+1*goldhill(j+1,i+1);
        M(j+1,i+1) = sqrt(mh.^2+mv.^2);
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


%%%%%%%%%
% US021 %
%%%%%%%%%
figure;
us021 = imread("us021.pgm");
us021 = im2double(us021);
subplot(1,3,1);
imshow(us021);
title('Original image');

[r2,c2] = size(us021);

M2 = zeros(r2,c2);
for i=2:r2-1
    for j =2:c2-1
        %         mh2 = (-1)*us021(j-1,i-1)+(-2)*us021(j,i-1)+(-1)*us021(j+1,i-1)+1*us021(j-1,i+1)+2*us021(j,i+1)+1*us021(j+1,i+1);
        %         mv2 = (-1)*us021(j-1,i-1)+1*us021(j+1,i-1)+(-2)*us021(j-1,i)+2*us021(j+1,i)+(-1)*us021(j-1,i+1)+1*us021(j+1,i+1);
        mh2 = 0;mv2 = 0;
        M2(j+1,i+1) = sqrt(mh2.^2+mv2.^2);
    end
end

M2 = edge(us021,'sobel'); % Built-in function in MATLAB

M2 =double(M2);
subplot(1,3,2);
imshow(M2);
title('Filtered image');


M2=im2bw(M2);
subplot(1,3,3);
imshow(M2);
title('Edge Enhancement image');
