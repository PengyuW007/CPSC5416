close all;
clear;
clc;

butterfly = imread("butterfly.pgm");

%%%%%%%%%%%%
% Skeleton %
%%%%%%%%%%%%
subplot(1,3,1);
imshow(butterfly);
title("Beetle");

butterflyComplement = imcomplement(butterfly);
bw = imbinarize(butterfly);
butterflySkeleton = bwskel(bw);
subplot(1,3,2);
imshow(labeloverlay(butterfly,butterflySkeleton,"Transparency",0));
title("Beetle skeleton");

butterflySkeleton2 = bwskel(bw,'MinBranchLength',15);
subplot(1,3,3);
imshow(labeloverlay(butterfly,butterflySkeleton2,"Transparency",0));
title("Beetle skeleton with MinBranchLength = 15");

for i=0:5:20
    butterflySkeletoni = bwskel(bw,'MinBranchLength',i);
    figure;
    imshow(labeloverlay(butterfly,butterflySkeletoni,"Transparency",0));
    title("MinBranchLength = "+i);
end

%%%%%%%%%%%%%%%
% Convex Hull %
%%%%%%%%%%%%%%%
figure;
butterflyCH = bwconvhull(bw);
imshow(butterflyCH);
title("Convex Hull of Butterfly");