clear;
close all;
clc;

fly = imread('fly.pgm');
subplot(1,2,1);
imshow(fly);
title('Fly input image')

SE = strel('disk',5);
eroseFly = imerode(fly,SE);
subplot(1,2,2);
imshow(eroseFly);
title('Fly after closing')