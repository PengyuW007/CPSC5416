clc;
close all;
clear;
workspace;

pirate = imread('pirate_noisy3.tif');
pirate = im2double(pirate);
subplot(1,6,1);
imshow(pirate);
title('Original image');

[r,c] = size(pirate);

medianImg = medfilt2(pirate);
subplot(1,6,2);
imshow(medianImg);
title('Image after median filter')

ft = fftshift(fft2(medianImg));
subplot(1,6,3)
specturmImg = mat2gray(log(1+abs(ft)));
imshow(specturmImg);
title('Fourier Transform Spectrum');

% Get the size of the spectrum
[M,N] = size(specturmImg);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Track all the gray values, which are black(noise) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create stacks, R, C
R = [];
C = [];
num_R =1;
num_C =1;
for i = 1: M
    for j = 1:N
        % Filter the noise gray values, and set threshold as 0.7
        grayVal = specturmImg(i,j);
        iRange = i>(round(M/2)-5)&&i<(round(M/2)+5);
        jRange= j>(round(N/2)-5)&&j<(round(N/2)+5);
        if(round(grayVal,1)==0.7&&~iRange&&~jRange)
            % Push values into Stacks
            R(num_R)= i;
            C(num_C)=j;

            num_R=num_R+1;
            num_C=num_C+1;
        end
    end
end

% Put all the noise coordinates into Rows and Cols stacks
R =unique(R);
C = unique(C);
[rRow,RSize]=size(R);
[cRow,CSize] =size(C);

% Implement Filter by the values map from stacks
Filter = ones(M,N);
for i=1:RSize
    for j = 1:N
        Filter(R(i),j)=0;
    end
end
for i=1:M
    for j = 1:CSize
        Filter(i,C(j))=0;
    end
end
subplot(1,6,4);
imshow(Filter);
title('Filter of the noise')

% Filter transfer function
G = Filter.*ft;

% Inverse of DFT
ig = ifft2(fftshift(G));
ig = real(ig);
subplot(1,6,5);
imshow(ig);
title('Cleaned image after self-design Filter');

noiseImg = pirate-ig;
subplot(1,6,6);
imshow(noiseImg);
title('Noise pattern');

figure;
imshow(specturmImg);
title('Fourier Transform Spectrum');
figure;
imshow(ig);
title('Cleaned image after self-design Filter');
figure;
imshow(noiseImg);
title('Noise pattern');