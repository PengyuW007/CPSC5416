k = 0:7;
nk = [1028 3544 5023 3201 1867 734 604 383];

bar(k,nk);
xlabel('Gray value');
ylabel('#pixels');
title('Histogram of input image');

% Total number of 
n = [];
n(1) = nk(1);
for l =2:8
    n(l)=n(l-1)+nk(l);
end

N = n(8);% Total number of pixels

t = [];
t =round(n/N,2);
figure;
bar(k/7,t);
xlabel('Normalized gray value');
ylabel('Fraction of #pixels');
title('Normalized');
%disp(t);
s = round(n/N*7);
%disp(s);

sk = mat2cell(sort(s),1,histcounts(findgroups(s)));
[r,c]=size(sk);
%fprintf("%d\n",sk{1,6});

Sk = [1028 0 3544  0 5023 3201 1867 734+604+383 ];
Pk = round(Sk/N,2);
%disp(Pk);

figure;
bar(k,Pk);
xlabel('Gray value');
ylabel('#pixels');
title("Histogram of output image");