close all;
clear;
clc;

beetle = imread("beetle.pgm");

subplot(1,3,1);
imshow(beetle);

beetleComplement = imcomplement(beetle);
bw = imbinarize(beetle);
beetleSkeleton = bwskel(bw);
subplot(1,3,2);
imshow(labeloverlay(beetle,beetleSkeleton,"Transparency",0));

beetleSkeleton2 = bwskel(bw,'MinBranchLength',15);
subplot(1,3,3);
imshow(labeloverlay(beetle,beetleSkeleton2,"Transparency",0));

figure;
for i = 0:5:20
    beetleSkeletoni = bwskel(bw,'MinBranchLength',i);
    subplot(1,5,i/5+1);
    imshow(labeloverlay(beetle,beetleSkeleton2,"Transparency",0));
    title("MinBranchLength = "+i);
end