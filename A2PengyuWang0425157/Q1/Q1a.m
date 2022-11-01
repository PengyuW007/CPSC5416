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

[M,N] = size(S);
S1 = S;

S1(0.75*M:M,0.75*N:N)=0;
P = angle(S);
newFt = abs(S1).*exp(sqrt(-1).*P);

inewFt = ifft2(fftshift(newFt));
res = real(inewFt);
subplot(1,3,3);
imshow(res);
title('Recovered image');