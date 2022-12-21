clc;
close all;
clear;

boat = imread("boat_noisy1.tif");
boat = im2double(boat);
subplot(1,4,1);
imshow(boat);
title('Originial image');

[r,c] = size(boat);

ft = fftshift(fft2(boat));
spectrumImg = mat2gray(log(1+abs(ft)));
subplot(1,4,2);
imshow(spectrumImg);
title('Spectrum of boat noisy');

% A region of interest (ROI) is a portion of an image that
% you want to filter or operate on in some way.
CBlack = [334 365 365 334];
RBlack = [316 316 347 347];
polyPatternBlack = roipoly(boat,CBlack,RBlack);
subplot(1,4,3);
imshow(polyPatternBlack);
title('Cropped parts in original');

XBlack = min(RBlack):max(RBlack);
YBlack = min(CBlack):max(CBlack);
roiBlack = boat(XBlack,YBlack);
subplot(1,4,4);
imshow(roiBlack);
title('Poly cropped image');
[y,x]=size(roiBlack);
N = x*y;
freqBlack = zeros(1,256);
for i = 1:y
    for j = 1:x
        value = roiBlack(i,j);
        freqBlack(round(value*256)+1)=freqBlack(round(value*256)+1)+1;
    end
end

[q,lenFreqBlack] = size(freqBlack);
pro =zeros(1,lenFreqBlack);
for i =1:lenFreqBlack
    pro(i) = freqBlack(i)/N;
end
figure;
bar(1:256,pro);
title('Gaussian(Erlang) noise PDF');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add new noise to blank image %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sum = 0;
count = zeros(1,N);
index = 1;
for i = 1:y
    for j = 1:x
        value = roiBlack(i,j);
        count(index) = round(value*256);
        sum = count(index)+sum;
        index = index+1;
    end
end
mean = round(sum/N,2);
% fprintf("%f",mean);
varSum = 0;
for i = 1:N
    varSum = (count(i) -mean)^2+varSum;
end
var = round(varSum/N,2);
blankImg = ones(32,32);
noisyImg = imnoise(blankImg,"gaussian",mean,var);
figure;
subplot(1,2,1);
imshow(noisyImg);
title("Gaussian noise to blank with mean = " + mean +", var = "+var);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Noisy image 2 histogram %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
noiseArr = zeros(1,N);
index = 1;
for i = 1:y
    for j = 1:x
        valueNoise = noisyImg(i,j);
        noiseArr(index) =round(valueNoise*256);
        inidex = index+1;
    end
end
subplot(1,2,2);
hist(noiseArr,256);
title("Histogram of Gaussian noise to blank with mean = " + mean +", var = "+var);