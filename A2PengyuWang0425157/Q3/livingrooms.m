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

% u = -c:c-1;
% v = -r:r-1;
% 
% [U,V] = meshgrid(u,v);
% D = sqrt(U.^2+V.^2);

% DLow0 = 50;
% HLow = zeros(r2,c2);
% Ones = ones(r2,c2);
% for i = 1:r2
%     for j = 1:c2
%         HLow(i,j)=Ones(i,j)-exp(-0.5.*((D(i,j).^2)-(DLow0.^2))./(D(i,j).*5));
%     end
% end
% GLow = ft.*HLow;
% 
% igLow0=ifft2(fftshift(GLow));
% igLow=igLow0(1:r,1:c);
% igLow = real(igLow);
% 
% figure;
% imshow(igLow);
