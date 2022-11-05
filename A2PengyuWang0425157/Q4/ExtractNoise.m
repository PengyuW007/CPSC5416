clc;
close all;
clear;

boat = imread("boat_noisy1.tif");
boat = im2double(boat);
subplot(1,4,1);
imshow(boat);

[r,c] = size(boat);

ft = fftshift(fft2(boat));
spectrumImg = mat2gray(log(1+abs(ft)));
subplot(1,4,2);
imshow(spectrumImg);

% A region of interest (ROI) is a portion of an image that
% you want to filter or operate on in some way.
CBlack = [334 365 365 334];
RBlack = [316 316 347 347];
polyPatternBlack = roipoly(boat,CBlack,RBlack);
subplot(1,4,3);
imshow(polyPatternBlack);

XBlack = min(RBlack):max(RBlack);
YBlack = min(CBlack):max(CBlack);
roiBlack = boat(XBlack,YBlack);
subplot(1,4,4);
imshow(roiBlack);
[y,x]=size(roiBlack);
N = x*y;
freqBlack = zeros(1,256);
for i = 1:y
    for j = 1:x
        value = roiBlack(i,j);
        freqBlack(round(value*256)+1)=freqBlack(round(value*256)+1)+1;
    end
end
figure;
bar(freqBlack);
title('Gaussian/Erlang noise frequency histogram');