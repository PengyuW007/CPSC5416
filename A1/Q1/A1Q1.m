
%y H(D)=1704sin(πD/ 255)
x=0:250;
y = 1704*sin(pi*x/255);
nbins = 25;

bar(x,y);
xlabel('x');
ylabel('Frequency');