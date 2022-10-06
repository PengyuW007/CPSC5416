function im2 = equalize(im)

img = imread(im);
[r,c] = size(img);
%fprintf("r: %d,c: %d",r,c);

histo = unit8(zeros(r,c));
% attributes

