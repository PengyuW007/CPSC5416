clear;
clc;
close all;

pirate = imread("pirate.tif");
pirate = im2double(pirate);
subplot(1,3,1);
imshow(pirate);
title('Original image');

% Get the spectrum of the image
S = fftshift(fft2(pirate));
subplot(1,3,2);
imshow(mat2gray(log(1+abs(S))));
title('Fourier Transform Spectrum');

% S1 and P, phase operation
P = angle(S);
newFt = abs(S).*exp(-sqrt(-1).*P);

% Based on the specturm I got, 
% then made the inverse of the new spectrum
inewFt = ifft2(fftshift(newFt));
res = real(inewFt);
subplot(1,3,3);
imshow(res);
title('Recovered image');