clc;
close all;
clear;
workspace;

pirate = imread('pirate_noisy3.tif');
pirate = im2double(pirate);

imshow(pirate);
title('Original image');

[r,c] = size(pirate);
r2 = 2*r;
c2 = 2*c;

ft = fftshift(fft2(pirate,r2,c2));

u = -c:c-1;
v = -r:r-1;

[U,V] = meshgrid(u,v);
