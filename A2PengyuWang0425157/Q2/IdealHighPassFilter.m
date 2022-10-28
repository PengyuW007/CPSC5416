boat = imread('boat.png');
subplot(2,3,2);
imshow(boat);
title('Original image');

[r,c] = size(boat);

ft = fftshift(fft2(boat));

u = 0:(r-1);
v = 0:(c-1);

[U, V] = meshgrid(u, v);

D = sqrt(U.^2+V.^2);


%%%%%%%%%%%%%
% High Pass %
%%%%%%%%%%%%%

subplot(2,3,2);
imshow(boat);
title('Original image');

% case 1, dHigh0_1 = 15;
dHigh0_1 = 15;
HHigh1 = ones(r,c);
for i=1:r
    for j = 1:c
        if(D(i,j)<=dHigh0_1)
            HHigh1(i,j) = 0;
            %fprintf("D(%d,%d)=%d\n",i,j,round(D(i,j)));
        end
    end
end
GHigh1 = HHigh1.*ft;
iGHigh1 = real(ifft2(fftshift(GHigh1)));
subplot(2,3,4);
imshow(iGHigh1);
title('Image after High filter D0=15');
% case 2, dHigh0_1 = 30;
dHigh0_2 = 30;
HHigh2 = ones(r,c);
for i=1:r
    for j = 1:c
        if(D(i,j)<=dHigh0_1)
            HHigh2(i,j) = 0;
        end
    end
end
GHigh2 = HHigh2.*ft;
iGHigh2 = real(ifft2(fftshift(GHigh2)));
subplot(2,3,5);
imshow(iGHigh2);
title('Image after High filter D0=30');
% case 3, dHigh0_3 = 80;
dHigh0_3 = 80;
HHigh3 = ones(r,c);
for i=1:r
    for j = 1:c
        if(D(i,j)<=dHigh0_3)
            HHigh3(i,j) = 0;
        end
    end
end
GHigh3 = HHigh3.*ft;
iGHigh3 = real(ifft2(fftshift(GHigh3)));
subplot(2,3,6);
imshow(iGHigh3);
title('Image after High filter D0=80');