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
%%%%%%%%%%%%
% Low Pass %
%%%%%%%%%%%%
% case 1, d0_1 = 5;
dLow0_1 = 5;
HLow1 = zeros(r,c);
for i=1:r
    for j = 1:c
        if(D(i,j)<=dLow0_1)
            HLow1(i,j) = 1;
        end
    end
end
GLow1 = HLow1.*ft;
iGLow1 = real(ifft2(fftshift(GLow1)));
subplot(2,3,4);
imshow(iGLow1);
title('Image after Low filter D0=5');
% case 2, d0_2 = 80;
dLow0_2 = 80;
HLow2 = zeros(r,c);
for i=1:r
    for j = 1:c
        if(D(i,j)<=dLow0_2)
            HLow2(i,j) = 1;
        end
    end
end
GLow2 = HLow2.*ft;
iGLow2 = real(ifft2(fftshift(GLow2)));
subplot(2,3,5);
imshow(iGLow2);
title('Image after Low filter D0=30');
% case 3, d0_3 = 230;
dLow0_3 = 230;
HLow3 = zeros(r,c);
for i=1:r
    for j = 1:c
        if(D(i,j)<=dLow0_3)
            HLow3(i,j) = 1;

        end
    end
end
GLow3 = HLow3.*ft;
iGLow3 = real(ifft2(fftshift(GLow3)));
subplot(2,3,6);
imshow(iGLow3);
title('Image after Low filter D0=230');


%%%%%%%%%%%%%
% High Pass %
%%%%%%%%%%%%%
figure;

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