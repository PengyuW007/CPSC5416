function im2 = equalize(im)

%img = imread(im);
img = imread('livingroom.tif');

[r,c] = size(img);
%fprintf("r: %d,c: %d",r,c);
N =r*c;
histo = uint8(zeros(r,c));
freq = zeros(1,256);
p = zeros(1,256);
% attributes
for i =1:r
    for j = 1:c
        value = img(i,j);
        freq(value+1) =freq(value+1)+1;
        p(value+1)=p(value+1)/N;
    end
end
bar(0:255,freq);
im2 =im;
end

