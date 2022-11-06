clc;
close all;
clear;

boat = imread('boat.png');
boat = im2double(boat);

subplot(4,3,2);
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
% Butterworth Low Pass Filter %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DLow0 = [5 80 230];
[DLowRows,D0LowLen] = size(DLow0);
N = [1 2 4];
[NLowRows,NLowLen] = size(N);
index = 4;
for h=1:D0LowLen
    DLow0_i = DLow0(h); % D0
    for k = 1:NLowLen
        n = N(k); % n
        HLowi = zeros(r2,c2);
        for i =1:r2
            for j =1:c2
                % Build Filter
                HLowi(i,j) = 1./(1+(D(i,j)/DLow0_i).^(2.*n));
            end
        end
        GLowi = ft.*HLowi; % G(u,v)

        igLow0_i = ifft2(fftshift(GLowi)); % Inverse of G(DFT)
        % resize it to normal size, put into middle of page
        igLowi = igLow0_i(1:r,1:c);
        igLowi = real(igLowi); % real part of function G

        subplot(4,3,index);
        index = index+1;
        imshow(igLowi);
        title("After BSLPF when D0="+DLow0_i+",n="+n);
    end % end Loop, D0, n 
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Butterworth High Pass Filter %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;

subplot(4,3,2);
imshow(boat);
title('Original image');

DHigh0 = [15 30 80];
[DHighRows,D0HighLen] = size(DHigh0);
N = [1 2 4];
[NHighRows,NHighLen] = size(N);
index = 4;
for h=1:D0HighLen
    DHigh0_i = DHigh0(h); % D0
    for k = 1:NHighLen
        n = N(k); % n
        HHighi = zeros(r2,c2);
        Ones = ones(r2,c2);
        for i =1:r2
            for j =1:c2
                % Build Filter
                HHighi(i,j) = Ones(i,j)-1./(1+(D(i,j)/DHigh0_i).^(2.*n));
            end
        end
        GHighi = ft.*HHighi; % G(u,v)

        igHigh0_i = ifft2(fftshift(GHighi)); % Inverse of G(DFT)
        % resize it to normal size, put into middle of page
        igHighi = igHigh0_i(1:r,1:c);
        igHighi = real(igHighi); % real part of function G

        subplot(4,3,index);
        index = index+1;
        imshow(igHighi);
        title("After BSHPF when D0="+DHigh0_i+",n="+n);
    end % end Loop, D0, n 
end