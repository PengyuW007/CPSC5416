close all;
clear;
clc;

kidney = imread("kidney_original.tif");
kidney = im2double(kidney);
subplot(1,3,1);
imshow(kidney);
title("Original kidney image");

% Got gradient magnitude and direction
[Gmag,Gdir] = imgradient(kidney,'sobel');
subplot(1,3,2);
imshow(Gmag);
title("Gradient magnitude");
subplot(1,3,3);
imshow(Gdir);
title("Gradient direction");