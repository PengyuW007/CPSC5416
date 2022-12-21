close all;
clear;
clc;

geo1 = bgt('geometric_shapes_1.pgm');
geo2 = bgt('geometric_shapes_2.pgm');
books = bgt('books.pgm');

% 1. Select an initial estimate for T (typically the average grey level in
% the image)
% 2. Segment the image using T to produce two groups of pixels: G1
% consisting of pixels with grey levels >T and G2 consisting pixels
% with grey levels ≤ T
% 3. Compute the average grey levels of pixels in G1 to give μ1 and G2
% to give μ2
% 4. Compute a new threshold value:
% 5. Repeat steps 2 – 4 until the difference in T in successive
% iterations is less than a predefined limit T∞

function im2 = bgt(im)
figure;
img = imread(im);
subplot(1,3,1);
imshow(img);
title("Original image");
subplot(1,3,2);
imhist(img);
title("Histogram of image")

[r,c]=size(img);
sumImg = sum(img(:));
avgImg = sumImg/(r*c);
Tinit = round(avgImg,1);

Ti = Tinit;
G1 = [];
G2 = [];
while Ti<Tinit
    for i=1:r
        for j = 1:c
            val = img(i,j);
            if(val>Ti)
                G1(end+1)=val;
            else
                G2(end+1)=val;
            end
        end
    end

    u1 = sum(G1(:));
    u2 = sum(G2(:));
    avg = (u1+u2)/2;
    Ti = round(avg,1);
end

output = zeros(r,c);

for i=1:r
    for j = 1:c
        val = img(i,j);
        if(val>Ti)
            output(i,j)=1;
        else
            output(i,j)=0;
        end
    end
end

im2 = output;
subplot(1,3,3);
imshow(im2);
title("Segmented image");
end