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

% Put all the D0s in to an array
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