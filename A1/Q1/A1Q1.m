clear;
close all;
clc;

%get L, total number of gray levels, 8 bits
L = 2^8; % 256 grey levels, so it needs to be divided into 256 bins

% H(D)=1704sin(πD/ 255)
x=0:(L-1);
y = 1704*sin(pi*x/255);
bar(x,y);
xlabel('Gray value');
ylabel('#Pixels');
title("Histogram of input image");

% get N, total number of pixels
h = @(x) 1704*sin(pi*x/255);
N = round(integral(h,0,255));

% get each gray level #pixels
n = zeros(1,L);
for i =1:L
    n(i) = round(1704*sin(pi*(i-1)/255));
    %fprintf("i: %d, %d\n",i-1,n(i));
end

% Applying the transforamtion
t = zeros(1,L);
t(1)=n(1);
for i = 2:L
    t(i)=n(i)+t(i-1);
end

s =zeros(1,L);
for i = 1:L
    p = t(i)/N;
    index = round(p*(L-1));
    s(index+1)=s(index+1)+1;
end

% Build output histogram
S =zeros(1,L);
last = 1;
for i=1:L
    num_items = s(i);
    sum = 0;
    if(num_items~=0)
        for j = last:(last+num_items-1)
            sum=sum+n(j);
        end
        S(i) =sum;
    end
    last= last+num_items;
end

figure;
bar(x,S);
xlabel('Gray value');
ylabel('#Pixels');
title("Histogram of output image");