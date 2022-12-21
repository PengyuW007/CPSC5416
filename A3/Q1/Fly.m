clear;
close all;
clc;

fly = imread('fly.pgm');

for i = 1:5
    subplot(5,4,4*i-3);
    imshow(fly);
    title('Fly input image')

    SE = strel('disk',i);
    eroseFly = imerode(fly,SE);
    subplot(5,4,4*i-2);
    imshow(eroseFly);
    title("Fly after erosion, size = "+i);

    openFly = imopen(fly,SE);
    subplot(5,4,4*i-1);
    imshow(openFly);
    title("Fly after opening, size = "+i);

    closeFly = imclose(fly,SE);
    subplot(5,4,4*i);
    imshow(closeFly);
    title("Fly after closing, size = "+i);
end