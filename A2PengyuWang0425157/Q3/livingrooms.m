clc;
close all;
clear;
workspace;

livingroom = imread('livingroom_noisy.tif');
livingroom = im2double(livingroom);

imshow(livingroom);
title('Original image');

[r,c] = size(livingroom);
r2 = 2*r;
c2 = 2*c;

ft = fftshift(fft2(livingroom,r2,c2));
figure;
imshow(mat2gray(log(1+abs(ft))));

u = -c:c-1;
v = -r:r-1;

[U,V] = meshgrid(u,v);
