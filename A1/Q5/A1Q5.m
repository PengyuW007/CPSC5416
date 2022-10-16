f = imread('lena_gray_256.tif');
% d, density of salt&pepper
d1 = 0.05;
d2 = 0.10;
d3 = 0.20;
f1 = imnoise(f, 'salt & pepper', d1);
f2 = imnoise(f, 'salt & pepper', d2);
f3 = imnoise(f, 'salt & pepper', d3);

%%%%%%%%%%%%%%%%%
% Median filter %
%%%%%%%%%%%%%%%%%
%%%%% 3 * 3 %%%%%
median3by3_1 = medfilt2(f1,[3,3]);
median3by3_2 = medfilt2(f2,[3,3]);
median3by3_3 = medfilt2(f3,[3,3]);

%%%%% 5 * 5 %%%%%
median5by5_1 = medfilt2(f1,[5,5]);
median5by5_2 = medfilt2(f2,[5,5]);
median5by5_3 = medfilt2(f3,[5,5]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Smoothing average filter %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% 3 * 3 %%%%%
avg3by3_1 = filter2(fspecial("average",3),f1)/255;
avg3by3_2 = filter2(fspecial("average",3),f2)/255;
avg3by3_3 = filter2(fspecial("average",3),f3)/255;

%%%%% 5 * 5 %%%%%
avg5by5_1 = filter2(fspecial("average",5),f1)/255;
avg5by5_2 = filter2(fspecial("average",5),f2)/255;
avg5by5_3 = filter2(fspecial("average",5),f3)/255;

%%%%%%%%%%%%%%%%%%%%%
% Results of images %
%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,1);
imshow(f1);
title('Image 5%')
subplot(5,3,2);
imshow(f2);
title('Image 10%');
subplot(5,3,3);
imshow(f3);
title('Image 20%');

subplot(5,3,4);
imshow(median3by3_1);
title('Median filter 3x3 5%');
subplot(5,3,5);
imshow(median3by3_2);
title('Median filter 3x3 10%');
subplot(5,3,6);
imshow(median3by3_3);
title('Median filter 3x3 20%');

subplot(5,3,7);
imshow(avg3by3_1);
title('Average filter 3x3 5%');
subplot(5,3,8);
imshow(avg3by3_2);
title('Average filter 3x3 10%');
subplot(5,3,9);
imshow(avg3by3_3);
title('Average filter 3x3 20%');

subplot(5,3,10);
imshow(median5by5_1);
title('Median filter 5x5 5%');
subplot(5,3,11);
imshow(median5by5_2);
title('Median filter 5x5 10%');
subplot(5,3,12);
imshow(median5by5_3);
title('Median filter 5x5 20%');

subplot(5,3,13);
imshow(avg5by5_1);
title('Average filter 5x5 5%');
subplot(5,3,14);
imshow(avg5by5_2);
title('Average filter 5x5 10%');
subplot(5,3,15);
imshow(avg5by5_3);
title('Average filter 5x5 20%');


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comparison by densities %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5% %
figure;
subplot(5,1,1);
imshow(f1);
title('Image 5%')
subplot(5,1,2);
imshow(median3by3_1);
title('Median filter 3x3 5%');
subplot(5,1,3);
imshow(avg3by3_1);
title('Average filter 3x3 5%');
subplot(5,1,4);
imshow(avg3by3_1);
title('Average filter 3x3 5%');
subplot(5,1,5);
imshow(avg5by5_1);
title('Average filter 5x5 5%');

% 10% %
figure;
subplot(5,1,1);
imshow(f2);
title('Image 10%');
subplot(5,1,2);
imshow(median3by3_2);
title('Median filter 3x3 10%');
subplot(5,1,3);
imshow(avg3by3_2);
title('Average filter 3x3 10%');
subplot(5,1,4);
imshow(median5by5_2);
title('Median filter 5x5 10%');
subplot(5,1,5);
imshow(avg5by5_2);
title('Average filter 5x5 10%');

% 20% %
figure;
subplot(5,1,1);
imshow(f3);
title('Image 20%');
subplot(5,1,2);
imshow(median3by3_3);
title('Median filter 3x3 20%');
subplot(5,1,3);
imshow(avg3by3_3);
title('Average filter 3x3 20%');
subplot(5,1,4);
imshow(avg3by3_3);
title('Average filter 3x3 20%');
subplot(5,1,5);
imshow(avg5by5_3);
title('Average filter 5x5 20%');