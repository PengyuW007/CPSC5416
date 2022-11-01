clear;
clc;
close all;

pirate = imread("pirate.tif");
pirate = im2double(pirate);
subplot(1,3,1);
imshow(pirate);
title('Original image');
[r,c] = size(pirate);

S = fftshift(fft2(pirate));
subplot(1,3,2);
title('Fourier Transform graph');
imshow(mat2gray(log(1+abs(S))));

