x=0:255;
y = 1704*sin(pi*x/255);
bar(x,y);
xlabel('x');
ylabel('Frequency h1');

%y H(D)=1704sin(πD/ 255)
h = 1704*sin(pi*x/255);
% step 0,
%get L, total number of gray levels, 8 bits
L = 2^8; % 256 grey levels, so it needs to be divided into 256 bins
% get n, total number of pixels
n =[];
n(1)= round(1704*sin(pi*0/255));
t=[];
t(1) = n(1);
for d = 2:256
    n(d) = round(1704*sin(pi*(d-1)/255));
    t(d) = t(d-1)+n(d);
end
N = t(256);% total number of pixels
%fprintf("d: %d, v: %d, N: %d\n",d,round(1704*sin(pi*0/255)),N);