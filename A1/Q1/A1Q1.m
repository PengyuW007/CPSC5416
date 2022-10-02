
%y H(D)=1704sin(πD/ 255)
x=0:250;
y = 1704*sin(pi*x/255);
nbins = 25;
bar(x,y);
xlabel('x');
ylabel('Frequency');

%if we want to make it monotonic, we must move it to right, which is as
%shown below

figure;

h = 1704*sin(pi*x/255/2);

bar(x,h);
xlabel('x');
ylabel('Frequency h');