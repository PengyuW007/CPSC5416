close all;
clear;
clc;

%%%%%%%%%
% House %
%%%%%%%%%
house = imread("House.pgm");
subplot(3,5,3);
imshow(house);
title("House");

bwhouse = imbinarize(house);
subplot(3,5,6);
imshow(bwhouse);
title("Binarized house");
for i = 0.1:0.1:0.9
    [houseEdge,threshOutHouse] = edge(bwhouse,"canny",i);
    subplot(3,5,i*10+6);
    imshow(houseEdge);
    title("Edge by Canny, threshold = "+threshOutHouse);
end

%%%%%%%%%%
% Bridge %
%%%%%%%%%%
figure;
bridge =imread("Bridge.pgm");
subplot(353);
imshow(bridge);
title("Bridge");

bwbridge = imbinarize(bridge);
subplot(3,5,6);
imshow(bwbridge);
title("Binarized house");
for i = 0.1:0.1:0.9
    [bridgeEdge,threshOutBridge] = edge(bwbridge,"canny",i);
    subplot(3,5,i*10+6);
    imshow(bridgeEdge);
    title("Edge by Canny, threshold = "+threshOutBridge);
end

%%%%%%%%%%%%%%%%%%%
% Woman dark hair %
%%%%%%%%%%%%%%%%%%%
figure;
woman =imread("woman_darkhair.tif");
subplot(353);
imshow(woman);
title("Woman dark hair");

bwWoman = imbinarize(woman);
subplot(3,5,6);
imshow(bwWoman);
title("Binarized Woman dark hair");
for i = 0.1:0.1:0.9
    [womanEdge,threshOutWoman] = edge(bwWoman,"canny",i);
    subplot(3,5,i*10+6);
    imshow(womanEdge);
    title("Edge by Canny, threshold = "+threshOutWoman);
end