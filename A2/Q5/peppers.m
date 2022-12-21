clc;
close all;
clear;

pepper = imread("peppers_noisy.tif");

imshow(pepper);
title("Original image");

%%%%%%%%%%%%%%%%%%
% average filter %
%%%%%%%%%%%%%%%%%%
pepperAvg = filter2(fspecial('average',3),pepper)/255;
figure;
imshow(pepperAvg);
title('Average filter image');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% median, remove salt & pepper %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pepperMedian = medfilt2(pepper);
figure;
imshow(pepperMedian);
title('Median filter');

%%%%%%%%%%%%%%%%%%%%%
% IDEAL pass filter %
%%%%%%%%%%%%%%%%%%%%%
pepper = im2double(pepper);
[r,c] = size(pepper);
r2 = 2*r;
c2 = 2*c;

ft = fftshift(fft2(pepper,r2,c2));

u = -c:c-1;
v = -r:r-1;

[U,V] = meshgrid(u,v);

D = sqrt(U.^2+V.^2);
% Put all the D0s in to an array
figure;
subplot(2,3,2);
imshow(pepper);
title('Originial pepper image');
dLow0 = [5 80 230];
[rowsLow,lenLow] =size(dLow0);
index = 4;
for t = 1:lenLow
    dLow0_i = dLow0(t); % D0
    HLowi = zeros(r2,c2);
    for i=1:r2
        for j = 1:c2
            if(D(i,j)<=dLow0_i)
                HLowi(i,j) = 1;
            end
        end
    end
    GLowi = ft.*HLowi; % G(u,v)

    igLow0_i = ifft2(fftshift(GLowi)); % Inverse of G(DFT)
    % resize it to normal size, put into middle of page
    igLowi = igLow0_i(1:r,1:c);
    igLowi = real(igLowi); % real part of function G

    subplot(2,3,index);
    index = index+1;
    imshow(igLowi);
    title("After ILPF when D0="+dLow0_i);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Butterworth Low Pass Filter %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(4,3,2);
imshow(pepper);
title('Originial pepper image');
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gaussian Low Pass Filter %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(2,3,2);
imshow(pepper);
title('Originial pepper image');
DLow0 = [10 40 100];
[DLowRows,D0LowLen] = size(DLow0);
index = 4;
for h=1:D0LowLen
    DLow0_i = DLow0(h); % D0
    HLowi = zeros(r2,c2);
    for i =1:r2
        for j =1:c2
            % Build Filter
            HLowi(i,j) = exp((-D(i,j).^2)./(2.*(DLow0_i).^2));
        end
    end
    GLowi = ft.*HLowi; % G(u,v)

    igLow0_i = ifft2(fftshift(GLowi)); % Inverse of G(DFT)
    % resize it to normal size, put into middle of page
    igLowi = igLow0_i(1:r,1:c);
    igLowi = real(igLowi); % real part of function G

    subplot(2,3,index);
    index = index+1;
    imshow(igLowi);
    title("After GLPF when D0="+DLow0_i);
end % end Loop, D0


