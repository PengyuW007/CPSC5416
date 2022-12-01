clear;
close all;
clc;

deer = imread("deer.pgm");
subplot(1,3,1);
imshow(deer);
title("Deer input image");

SE = strel("disk",3);
closeDeer = imclose(deer,SE);
subplot(1,3,2);
imshow(closeDeer);
title("Deer after closing");
