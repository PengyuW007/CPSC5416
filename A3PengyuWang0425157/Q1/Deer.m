clear;
close all;
clc;

deer = imread("deer.pgm");
for i=1:5
    subplot(5,4,4*i-3);
    imshow(deer);
    title('Deer input image')

    SE = strel('disk',i);
    eroseDeer = imerode(deer,SE);
    subplot(5,4,4*i-2);
    imshow(eroseDeer);
    title("Deer after erosion, size = "+i);

    openDeer = imopen(deer,SE);
    subplot(5,4,4*i-1);
    imshow(openDeer);
    title("Deer after opening, size = "+i);

    closeDeer = imclose(deer,SE);
    subplot(5,4,4*i);
    imshow(closeDeer);
    title("Deer after closing, size ="+i);
end