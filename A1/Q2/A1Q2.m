k = 0:1:7;
nk = [1028 3544 5023 3201 1867 734 604 383];
n = 64*64; % since this is a 3 bit image, 8 gray levels, 0->7, 000->111

bar(k,nk);
xlabel('Gray value');
ylabel('#pixels');
title('Original');

figure
% figure 2, equalization 
rk=k/7;
prk = nk/n;

bar(rk,prk);
xlabel('Normalized gray value');
ylabel('Fraction of #pixels');
title('Normalized');