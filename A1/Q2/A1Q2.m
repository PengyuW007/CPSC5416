clear;
close all;
clc;

k = 0:7;
n = [1028 3544 5023 3201 1867 734 604 383];
[r,L] = size(n);

bar(k,n);
xlabel('Gray value');
ylabel('#pixels');
title('Histogram of input image');

% Total number of pixels
N = 0;
for i =1:L
    N=N+n(i);
end

% Applying the transformation
t = zeros(1,L);
t(1)=n(1);
for i=2:L
    t(i)=n(i)+t(i-1);
end

s = zeros(1,L);
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
bar(k,S);
xlabel('Gray value');
ylabel('#pixels');
title('Histogram of output image');

f = figure;
col={'r','n'};
dat = [];
for i = 1:L
    for j = 1:2
        if(j==1)
            dat(i,j) = k(i);
        elseif(j==2)
            dat(i,j) = S(i);
        end
    end
end
            
uitable(f,'ColumnName',col,'Position',[100 100 170 170],'Data',dat);