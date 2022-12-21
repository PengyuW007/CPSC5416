clear;
close all;
clc;

device = imread("device.pgm");

for i = 1:5
    subplot(5,3,3*i-2);
    imshow(device);
    title('Device input image')

    SE = strel('disk',i*10);
    eroseDevice = imerode(device,SE);
    subplot(5,3,3*i-1);
    imshow(eroseDevice);
    title("Device after erosion, size = "+i*10);

    closeDevice = imclose(device,SE);
    subplot(5,3,3*i);
    imshow(closeDevice);
    title("Device after closing, size = "+i*10);
end