% specified histogram
x =0:7;
nSpecified = [0 0 4096 4096 4096 4096 0 0];
bar(x,nSpecified);
xlabel('Gray value');
ylabel('# Pixels');
title('Specified histogram');

% Total number of pixels
N = sum(nSpecified);

n = [0 1365 2731 4096 4096 2731 1365 0];
bar(x,n);
xlabel('Gray value');
ylabel('# Pixels');
title('Histogram of input image');

% equalization
