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

% Based on the specturm got, 
% then made the inverse of the spectrum
inewFt = ifft2(fftshift(S));

% Multiply the real part operation
res = real(inewFt).*0.4;
subplot(1,3,3);
imshow(res);
title('Recovered image');