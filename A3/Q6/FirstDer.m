close all;
clear;
clc;

house = firstDer('House.pgm');
bridge = firstDer('Bridge.pgm');
woman = firstDer('woman_darkhair.tif');

function im2 = firstDer(im)
figure;
img = imread(im);
subplot(1,2,1);
imshow(img);
title("Original image");

edgeImg = edge(img,"sobel");
im2 = edgeImg;
subplot(1,2,2);
imshow(im2);
title("Edge by 1st derivatives");

end