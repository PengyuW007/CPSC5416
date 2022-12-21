close all;
clear;
clc;

beetle = imread("beetle.pgm");

%%%%%%%%%%%%
% Skeleton %
%%%%%%%%%%%%
subplot(1,3,1);
imshow(beetle);
title("Beetle");

beetleComplement = imcomplement(beetle);
bw = imbinarize(beetle);
beetleSkeleton = bwskel(bw);
subplot(1,3,2);
imshow(labeloverlay(beetle,beetleSkeleton,"Transparency",0));
title("Beetle skeleton");

beetleSkeleton2 = bwskel(bw,'MinBranchLength',15);
subplot(1,3,3);
imshow(labeloverlay(beetle,beetleSkeleton2,"Transparency",0));
title("Beetle skeleton with MinBranchLength = 15");

for i=0:5:20
    beetleSkeletoni = bwskel(bw,'MinBranchLength',i);
    figure;
    imshow(labeloverlay(beetle,beetleSkeletoni,"Transparency",0));
    title("MinBranchLength = "+i);
end

%%%%%%%%%%%%%%%
% Convex Hull %
%%%%%%%%%%%%%%%
figure;
beetleCH = bwconvhull(bw);
imshow(beetleCH);
title("Convex Hull of Beetle");