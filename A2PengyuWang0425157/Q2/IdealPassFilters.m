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
d0_1 = 5;
for i=1:r
    for j = 1:c
        if(D(i,j)<=d0_1)
            HLow1(i,j) = 1;
        else
            HLow1(i,j) = 0;
        end
    end
end
GLow1 = HLow1.*ft;
iGLow1 = real(ifft2(fftshift(GLow1)));
subplot(2,3,4);
imshow(iGLow1);
title('Image after filter D0=5');
% case 2, d0_2 = 80;
d0_2 = 80;
for i=1:r
    for j = 1:c
        if(D(i,j)<=d0_2)
            HLow2(i,j) = 1;
        else
            HLow2(i,j) = 0;
        end
    end
end
GLow2 = HLow2.*ft;
iGLow2 = real(ifft2(fftshift(GLow2)));
subplot(2,3,5);
imshow(iGLow2);
title('Image after filter D0=30');
% case 3, d0_3 = 230;
d0_3 = 230;
for i=1:r
    for j = 1:c
        if(D(i,j)<=d0_3)
            HLow3(i,j) = 1;
        else
            HLow3(i,j) = 0;
        end
    end
end
GLow3 = HLow3.*ft;
iGLow3 = real(ifft2(fftshift(GLow3)));
subplot(2,3,6);
imshow(iGLow3);
title('Image after filter D0=230');
