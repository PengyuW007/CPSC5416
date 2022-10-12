%%%%%%%%%%%%%%%
% LIVING ROOM %
%%%%%%%%%%%%%%%
%%%% Histeq %%%
lrHisteqRead = imread('livingroom.tif');
uint8Livingroom = im2uint8(lrHisteqRead);
lrHisteq = histeq(uint8Livingroom);
% images
subplot(2,2,1);
imshow(uint8Livingroom);
title('Livingroom Histeq-input-image');
subplot(2,2,2);
imshow(lrHisteq);
title('Livingroom Histeq-output-image');
% Histograms
subplot(2,2,3);
imhist(uint8Livingroom,255);
title('Livingroom Histeq-input-histogram');
subplot(2,2,4);
imhist(lrHisteq,255);
title('Livingroom Histeq-output-histogram');

%%%% Equalize %%%%%
figure;
subplot(2,2,1);
imshow(uint8Livingroom);
title('Livingroom Equalize-input-image');
subplot(2,2,2);
lrEqual = equalize('livingroom.tif');
imshow(lrEqual);
title('Livingroom Equalize-output-image');
% Histograms
subplot(2,2,3);
imhist(uint8Livingroom,255);
title('Livingroom Equalize-input-histogram');
subplot(2,2,4);
%uint8lrEqual = im2uint8(lrEqual);
imhist(lrEqual,255);
title('Livingroom Equalize-output-histogram');

%%%%%%%%%%%%%%%%%%
% WOMAN_DARKHAIR %
%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%
% FUNCTIONS %
%%%%%%%%%%%%%
function im2 = equalize(im)

img = imread(im);

[r,c] = size(img);

% get total number of pixels, N
N =r*c;

% step 0 processing
output = uint8(zeros(r,c));
freq = zeros(1,256);

% attributes
for i =1:r
    for j = 1:c
        value = img(i,j);
        freq(value+1) =freq(value+1)+1;
    end
end

% Applying transforamtion
t = zeros(1,256);
t(1)=freq(1);
for i = 2:256
    t(i)=freq(i)+t(i-1);
    %fprintf("i: %d, %d\n",i-1,t(i));
end

s = zeros(1,256);
map = zeros(1,256);
for i=1:256
    p = t(i)/N;
    index = round(p*255);
    map(i)=index;
    s(index+1)=s(index+1)+1;
end

% Output image processing
for i=1:r
    for j=1:c
        output(i,j)=map(img(i,j)+1);
    end
end

im2 = im2double(output);

end