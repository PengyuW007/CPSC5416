% specified histogram
x =0:7;
nSpecified = [0 0 4096 4096 4096 4096 0 0];
bar(x,nSpecified);
xlabel('Gray value');
ylabel('# Pixels');
title('Specified histogram');

n = [0 1365 2731 4096 4096 2731 1365 0];
% Total number of pixels
N = 0;
for i =1:L
    N=N+n(i);
end

figure;
bar(x,n);
xlabel('Gray value');
ylabel('# Pixels');
title('Histogram of input image');

%%%%%%%%%%%%%%%%
% Equalization %
%%%%%%%%%%%%%%%%
t = zeros(1,L);
t(1)=n(1);
for i=2:L
    t(i)=n(i)+t(i-1);
end

t = zeros(1,L);
t(1)=n(1);
for i=2:L
    t(i)=n(i)+t(i-1);
end

% Equalization output histogram
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
title('Histogram of Equalization output image');

%%%%%%%%%%%%%
% Specified %
%%%%%%%%%%%%%
g = nSpecified/N;

for i =1:L
    v = g*(L-1);
end