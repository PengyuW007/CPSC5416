clear;
close all;
clc;

deer = imread("deer.pgm");
for i=1:5
    subplot(5,3,3*i-2);
    imshow(deer);
    title('Deer input image')

    SE = strel('disk',5);
    eroseDeer = imerode(deer,SE);
    subplot(5,3,3*i-1);
    imshow(eroseDeer);
    title("Deer after erosion, size = "+i);

    closeDeer = imclose(deer,SE);
    subplot(5,3,3*i);
    imshow(closeDeer);
    title("Deer after closing, size ="+i);
end