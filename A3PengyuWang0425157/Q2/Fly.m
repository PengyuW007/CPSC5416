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

erodeFly1 = imerode(erodeFly,SE2); 
boundaryErode = erodeFly - erodeFly1;
subplot(3,3,3);
imshow(boundaryErode);
title("Erosion boundary");

% Opening
subplot(3,3,4);
imshow(fly);
title("Fly original image");
openFly = imopen(fly,SE);
subplot(3,3,5);
imshow(openFly);
title("Fly after opening");

erodeFly2 = imerode(openFly,SE2);
boundaryOpen = openFly - erodeFly2;
subplot(3,3,6);
imshow(boundaryOpen);
title("Opening boundary");

% Closing
subplot(3,3,7);
imshow(fly);
title("Fly original image");
closeFly = imclose(fly,SE);
subplot(3,3,8);
imshow(closeFly);
title("Fly after closing");

erodeFly3 = imerode(closeFly,SE2);
boundaryClose = closeFly - erodeFly3;
subplot(3,3,9);
imshow(boundaryClose);
title("Closing boundary");

figure;
imshow(boundaryErode);
title("Erosion boundary");

figure;
imshow(boundaryOpen);
title("Opening boundary");

figure;
imshow(boundaryClose);
title("Closing boundary");