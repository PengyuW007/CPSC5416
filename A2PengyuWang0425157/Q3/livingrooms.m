clc;
close all;
clear;
workspace;

livingroom = imread('livingroom_noisy.tif');
livingroom = im2double(livingroom);
subplot(1,4,1);
imshow(livingroom);
title('Original image');

[r,c] = size(livingroom);

ft = fftshift(fft2(livingroom));
subplot(1,4,2)
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
subplot(1,4,3);
imshow(Filter);

% Filter transfer function
G = Filter.*ft;

% Inverse of DFT
ig = ifft2(fftshift(G));
ig = real(ig);
subplot(1,4,4);
imshow(ig);