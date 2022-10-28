boat = imread('boat.png');
boat = im2double(boat);

subplot(2,3,2);
imshow(boat);
title('Original image');

[r,c] = size(boat);
r2 = 2*r;
c2 = 2*c;

ft = fftshift(fft2(boat,r2,c2));

u = -c:c-1;
v = -r:r-1;

[U,V] = meshgrid(u,v);

D = sqrt(U.^2+V.^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ideal Low Pass Filter(ILPF) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% case 1, d0_1 = 5;
dLow0_1 = 5; % D0
HLow1 = zeros(r2,c2);
for i=1:r2
    for j = 1:c2
        if(D(i,j)<=dLow0_1)
            HLow1(i,j) = 1;
        end
    end
end
GLow1 = ft.*HLow1; % G(u,v)

igLow0_1 = ifft2(fftshift(GLow1)); % Inverse of G(DFT)
% resize it to normal size, put into middle of page
igLow1 = igLow0_1(1:r,1:c);
igLow1 = real(igLow1); % real part of function G

subplot(2,3,4);
imshow(igLow1);
title('After ILPF when D0=5');

% case 2, d0_2 = 30;
dLow0_2 = 30; % D0
HLow2 = zeros(r2,c2);
for i=1:r2
    for j = 1:c2
        if(D(i,j)<=dLow0_2)
            HLow2(i,j) = 1;
        end
    end
end
GLow2 = ft.*HLow2; % G(u,v)

igLow0_2 = ifft2(fftshift(GLow2)); % Inverse of G(DFT)
% resize it to normal size, put into middle of page
igLow2 = igLow0_2(1:r,1:c);
igLow2 = real(igLow2); % real part of function

subplot(2,3,5);
imshow(igLow2);
title('After ILPF when D0=30');

% case 3, d0_3 = 30;
dLow0_3 = 230; % D0
HLow3 = zeros(r2,c2);
for i=1:r2
    for j = 1:c2
        if(D(i,j)<=dLow0_3)
            HLow3(i,j) = 1;
        end
    end
end
GLow3 = ft.*HLow3; % G(u,v)

igLow0_3 = ifft2(fftshift(GLow3)); % Inverse of G(DFT)
% resize it to normal size, put into middle of page
igLow3 = igLow0_3(1:r,1:c);
igLow3 = real(igLow3); % real part of function

subplot(2,3,6);
imshow(igLow3);
title('After ILPF when D0=230');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ideal High Pass Filter(IHPF) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(2,3,2);
imshow(boat);
title('Original image');

% Put all the D0s in to an array
dHigh0 = [15 30 80];
[rows,len] =size(dHigh0);
index = 4;
for t = 1:len
    dHigh0_i = dHigh0(t);
    HHighi = ones(r2,c2);
    for i=1:r2
        for j = 1:c2
            if(D(i,j)<=dHigh0_i)
                HHighi(i,j) = 0;
            end
        end
    end
    GHighi = HHighi.*ft;
    igHigh0_i = ifft2(fftshift(GHighi));
    igHighi = igHigh0_i(1:r,1:c);
    igHighi = real(igHighi);

    subplot(2,3,index);
    index = index+1;
    imshow(igHighi);
    title("After IHPF D0="+dHigh0_i);
end