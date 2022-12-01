clear;
close all;
clc;

fly = imread('fly.pgm');
subplot(3,3,1);
imshow(fly);
title("Fly original image");

SE = strel("disk",3);
SE2 = strel('square',3);

% Erosion
erodeFly = imerode(fly,SE);
subplot(3,3,2);
imshow(erodeFly);
title("Fly after erosion");

erodeFly2 = imerode(erodeFly,SE2); 
boundaryErode = erodeFly - erodeFly2;
subplot(3,3,3);
imshow(boundaryErode);
title("Erosion boundary");

