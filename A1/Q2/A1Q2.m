k = 0:1:7;
nk = [1028 3544 5023 3201 1867 734 604 383];
n = 64*64; % since this is a 3 bit image, 8 gray levels, 0->7, 000->111

bar(k,nk);
xlabel('Gray value');
ylabel('#pixels');
title('Original');

% Normalized
rk=k/7;
prk = nk/n;
t = [];
t(1)= prk(1);

for k=2:1:8
    t(k)= prk(k)+t(k-1);
end

s = t*7;



disp(t);
disp(s);