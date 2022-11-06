clc;
clear;
close all;

%%%%%%%%%%%%%
% Cameraman %
%%%%%%%%%%%%%
cameraman = imread("cameraman_noisy.tif");
cameraman = im2double(cameraman);
for i=1:2:12
    subplot(6,2,i)
    imshow(cameraman);
    title('Cameraman original');
end
cameramanDe = [];
thresholdRule = ["Hard" "Soft"];
for i =1:3
    for j =1:2
        cameramanDe = wdenoise2(cameraman,i,'Wavelet','haar','NoiseEstimate','LevelDependent','DenoisingMethod','Bayes','ThresholdRule',thresholdRule(j),'NoiseDirection',["h","v","d"]);
    end
end

for i =2:2:12
    subplot(6,2,i);
    imshow(cameramanDe(i));
    if(mod(i/2,2)~=0)
        title("Denoised image with level = "+round(i/2)+","+thresholdRule(1));
    else
        title("Denoised image with level = "+round(i/2)+","+thresholdRule(2));
    end
end

%%%%%%%%%%
% Pirate %
%%%%%%%%%%
figure;
pirate = imread("pirate_noisy1.tif");
pirate = im2double(pirate);
for i=1:2:12
    subplot(6,2,i)
    imshow(pirate);
    title('Pirate original');
end
pirateDe = [];
for i =1:3
    for j =1:2
        pirateDe = wdenoise2(pirate,i,'Wavelet','haar','NoiseEstimate','LevelDependent','DenoisingMethod','Bayes','ThresholdRule',thresholdRule(j),'NoiseDirection',["h","v","d"]);
    end
end

for i =2:2:12
    subplot(6,2,i);
    imshow(pirateDe(i));
    if(mod(i/2,2)~=0)
        title("Denoised image with level = "+round(i/2)+","+thresholdRule(1));
    else
        title("Denoised image with level = "+round(i/2)+","+thresholdRule(2));
    end
end

%%%%%%%%%%
% Pepper %
%%%%%%%%%%
figure;
peppers = imread("peppers_noisy.tif");
peppers = im2double(peppers);
for i=1:2:12
    subplot(6,2,i)
    imshow(peppers);
    title('Peppers original');
end
pirateDe = [];
for i =1:3
    for j =1:2
        pepperDe = wdenoise2(peppers,i,'Wavelet','haar','NoiseEstimate','LevelDependent','DenoisingMethod','Bayes','ThresholdRule',thresholdRule(j),'NoiseDirection',["h","v","d"]);
    end
end

for i =2:2:12
    subplot(6,2,i);
    imshow(pepperDe(i));
    if(mod(i/2,2)~=0)
        title("Denoised image with level = "+round(i/2)+","+thresholdRule(1));
    else
        title("Denoised image with level = "+round(i/2)+","+thresholdRule(2));
    end
end

%%%%%%%%%%%%%
% Lena gray %
%%%%%%%%%%%%%
figure;
lena = imread("lena_gray_noisy.tif");
lena = im2double(lena);
for i=1:2:12
    subplot(6,2,i)
    imshow(lena);
    title('Lena gray original');
end
pirateDe = [];
for i =1:3
    for j =1:2
        lenaDe = wdenoise2(lena,i,'Wavelet','haar','NoiseEstimate','LevelDependent','DenoisingMethod','Bayes','ThresholdRule',thresholdRule(j),'NoiseDirection',["h","v","d"]);
    end
end

for i =2:2:12
    subplot(6,2,i);
    imshow(lenaDe(i));
    if(mod(i/2,2)~=0)
        title("Denoised image with level = "+round(i/2)+","+thresholdRule(1));
    else
        title("Denoised image with level = "+round(i/2)+","+thresholdRule(2));
    end
end