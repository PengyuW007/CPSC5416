close all;
clear;
clc;

%%%%%%%%%
% House %
%%%%%%%%%
house = imread("House.pgm");
subplot(1,4,1);
imshow(house);
title("House");

bwhouse = imbinarize(house);
subplot(1,4,2);
imshow(bwhouse);
title("Binarized house");

houseLoG = edge(bwhouse,'log');
subplot(1,4,3);
imshow(houseLoG);
title("Edge by LOG ");

houseZerocrossing= edge(houseLoG,"zerocross");
subplot(1,4,4);
imshow(houseZerocrossing);
title("Edge by zerocross ");

%%%%%%%%%%
% Bridge %
%%%%%%%%%%
figure;
bridge =imread("Bridge.pgm");
subplot(1,4,1);
imshow(bridge);
title("Bridge");

bwbridge = imbinarize(bridge);
subplot(1,4,2);
imshow(bwbridge);
title("Binarized house");

bridgeLoG = edge(bwbridge,'log');
subplot(1,4,3);
imshow(bridgeLoG);
title("Edge by LOG ");

bridgeZerocross= edge(bridgeLoG,"zerocross");
subplot(1,4,4);
imshow(bridgeZerocross);
title("Edge by Zerocross");


%%%%%%%%%%%%%%%%%%%
% Woman dark hair %
%%%%%%%%%%%%%%%%%%%
figure;
woman =imread("woman_darkhair.tif");
subplot(141);
imshow(woman);
title("Woman dark hair");

bwWoman = imbinarize(woman);
subplot(142);
imshow(bwWoman);
title("Binarized Woman dark hair");

womanLoG = edge(bwWoman,'log');
subplot(143);
imshow(womanLoG);
title("Edge by LOG ");

womanZerocross= edge(womanLoG,"zerocross");
subplot(144);
imshow(womanZerocross);
title("Edge by Zerocross ");
