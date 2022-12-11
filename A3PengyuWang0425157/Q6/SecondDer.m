close all;
clear;
clc;

house = secondDer('House.pgm');
bridge = secondDer('Bridge.pgm');
woman = secondDer('woman_darkhair.tif');

function im2 = secondDer(im)
figure;
img = imread(im);
subplot(1,2,1);
imshow(img);
title("Original image");

edgeImg = edge(img,"log");
im2 = edgeImg;
subplot(1,2,2);
imshow(im2);
title("Edge by 2nd derivatives");

end