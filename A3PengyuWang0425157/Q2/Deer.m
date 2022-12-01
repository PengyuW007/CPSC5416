clear;
close all;
clc;

deer = imread("deer.pgm");
subplot(1,3,1);
imshow(deer);
title("Deer input image");

% based on the result of Q1, use radius = 5, and closing
closeSE = strel("disk",5);
closeDeer = imclose(deer,closeSE);
subplot(1,3,2);
imshow(closeDeer);
title("Deer after closing");

% Erosion
erodeSE = strel("square",3);
erodeDeer = imerode(closeDeer,erodeSE);
% Boundary
boundary = closeDeer - erodeDeer;
subplot(1,3,3);
imshow(boundary);
title("Deer boundary");

figure;
imshow(boundary)
title("Deer boundary");