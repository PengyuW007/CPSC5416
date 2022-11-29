clear;
close all;
clc;

device = imread("device.pgm");
subplot(1,3,1);
imshow(device);
title('Device input image')

SE = strel('disk',10);
eroseDevice = imerode(device,SE);
subplot(1,3,2);
imshow(eroseDevice);
title('Device after erosion')

closeDevice = imclose(device,SE);
subplot(1,3,3);
imshow(closeDevice);
title('Device after closing')