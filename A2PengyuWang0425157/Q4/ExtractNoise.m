clc;
close all;
clear;

boat = imread("boat_noisy1.tif");
boat = im2double(boat);
imshow(boat);

[r,c] = size(boat);
r2 = 2*r;
c2 = 2*c;

ft = fftshift(fft2(boat,r2,c2));
figure;
imshow(mat2gray(log(1+abs(ft))));
u = -c:c-1;
v = -r:r-1;

[U,V] = meshgrid(u,v);
