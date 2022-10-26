img = imread('boat.png');

[r,c] = size(img);

% Getting Fourier Transform of the input image
ft = fft2(double(img));

% Assign different D0 values, 5, 30, 230
d0_1 = 5;
d0_2 = 30;
d0_3 = 230;

