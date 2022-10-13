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
avg3by3_1 = filter2(fspecial("average",3),f1);
avg3by3_2 = filter2(fspecial("average",3),f2);
avg3by3_3 = filter2(fspecial("average",3),f3);

%%%%% 5 * 5 %%%%%
avg5by5_1 = filter2(fspecial("average",5),f1);
avg5by5_2 = filter2(fspecial("average",5),f2);
avg5by5_3 = filter2(fspecial("average",5),f3);

subplot(4,3,1);
imshow(f1);
title('Image 5%')
subplot(4,3,2);
imshow(f2);
title('Image 10%');
subplot(4,3,3);
imshow(f3);
title('Image 20%');

subplot(4,3,4);
imshow()
