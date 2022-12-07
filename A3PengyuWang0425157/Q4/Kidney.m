close all;
clear;
clc;

kidney = imread("kidney_original.tif");
kidney = im2double(kidney);

% Got gradient magnitude and direction
figure;
[Gmag,Gdir] = imgradient(kidney,'sobel');
subplot(4,2,1);
imshow(Gmag);
title("Gradient magnitude");
subplot(4,2,2);
imhist(Gmag);
subplot(4,2,3);
imshow(Gdir);
title("Gradient direction");
subplot(4,2,4);
imhist(Gdir);

[Gx,Gy] = imgradientxy(kidney);
subplot(4,2,5);
imshow(Gx);
title("Gx");
subplot(4,2,6);
imhist(Gx);
subplot(4,2,7);
imshow(Gy);
title("Gy");
subplot(4,2,8);
imhist(Gy);

figure;
subplot(1,2,1);
imshow(kidney);
title("Original kidney");
subplot(1,2,2);
imshow(Gmag);
title("Filtered kidney");

figure;
% Choosing threshold
for i = 0:0.01:0.09
    T = i;
    Edgei = max(Gmag,T);
    Edgei(Edgei==round(T))=0;

    Edgei = imbinarize(Edgei);
    subplot(2,5,i*100+1);
    imshow(Edgei);
    title("T = "+T);
end