clc;
clear;
close all;

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

for i =1:2:12
    subplot(6,2,i+1);
    imshow(cameramanDe(i));
    if(mod(i,2)~=0)
        title("Denoised image with level = "+(round(i/2)+1)+","+thresholdRule(1));
    else
        title("Denoised image with level = "+(round(i/2)+1)+","+thresholdRule(2));
    end
end
