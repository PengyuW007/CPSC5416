clear;
close all;
clc;

device = imread("device.pgm");
subplot(1,3,1);
imshow(device);
title("Device input image");

closeSE = strel("disk",10);
closeDevice = imclose(device,closeSE);
subplot(1,3,2);
imshow(closeDevice);
title("Device after closing");

% Boundary
erodeSE = strel("square",3);
erodeDevice = imerode(closeDevice,erodeSE);
boundary = closeDevice - erodeDevice;
subplot(1,3,3);
imshow(boundary);
title("Device boundary");

figure;
imshow(boundary);
title("Device boundary");