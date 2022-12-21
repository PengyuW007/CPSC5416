clc;
clear;
close all;

%%%%%%%%%%%%
% Goldhill %
%%%%%%%%%%%%
[X,map] = imread("goldhill.bmp");
goldhill = ind2rgb(X,map);
subplot(1,2,1);
imshow(goldhill);
title('Original image');

goldhillThresh =graythresh(goldhill);
goldhillBW = im2bw(goldhillThresh);
[A,H,V,D] = dwt2(goldhillBW,'haar');
A = zeros(size(A));
invA = idwt2(A,H,V,D,'haar');
subplot(1,2,2);
imshow(invA,[]);


%%%%%%%%%
% US021 %
%%%%%%%%%
figure;
us021 = imread("us021.pgm");
us021 = im2double(us021);
subplot(1,3,1);
imshow(us021);
title('Original image');
us021Thresh = graythresh(us021);
us021BW = im2bw(us021Thresh);
[A2,H,V,D] = dwt2(us021BW,'haar');
A2 = zeros(size(A2));
invA2 = idwt2(A2,H,V,D,'haar');
subplot(1,2,2);
imshow(invA2,[]);