clc;
close all;
clear;

boat = imread("boat_noisy1.tif");
boat = im2double(boat);
imshow(boat);

[r,c] = size(boat);

ft = fftshift(fft2(boat));
figure;
spectrumImg = mat2gray(log(1+abs(ft)));
imshow(spectrumImg);

% A region of interest (ROI) is a portion of an image that 
% you want to filter or operate on in some way. 

C = [486 508 508 486];
R = [322 322 368 368];
polyPattern = roipoly(boat,C,R);
figure;
imshow(polyPattern);