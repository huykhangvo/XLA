**ÔN TẬP XỬ LÝ ẢNH**

### 1. Cộng/Trừ Pixel Ảnh
-	Cộng pixel

```
A=imread('cameraman.tif'); % Read in image 
subplot(1,2,1), imshow(A); % Display image
B = imadd(A, 100); % Add 100 pixel values to image A 
subplot(1,2,2), imshow(B); % Display result image B
```
-	Trừ pixel

```
A=imread('cola1.png');	% Read in 1st image 
B=imread('cola2.png'); % Read in 2nd image

subplot(1,3,1), imshow(A); % Display 1st image title('anh 1');
subplot(1,3,2), imshow(B); % Display 2nd image title('anh 2');
Output = imsubtract(A, B); % subtract images

subplot(1,3,3), imshow(Output); % Display result title('anh output');
```
### 2. Ảnh Xám/Âm bản
-	Ảnh Xám

```
RGB=imread('lena.png'); % Doc anh R=RGB(:,:,1);
G=RGB(:,:,2);
B=RGB(:,:,3);
% CT chuyen anh sang anh xam 
GRAY=0.299*R + 0.587*G + 0.114*B GRAY=0.299.*R + 0.587.*G + 0.114.*B;
imshow(GRAY);
```
-	Ảnh Âm Bản

`Chưa có ai có gửi về zalo 0794943324`
### 3. Lọc trung bình (Code Tay)
```
A = imread('noise-image.png') ; subplot(2,2,1);
imshow(A); title('Anh goc'); A = im2double(A); [m n] = size(A); Med = [];
%/////////// H=fspecial('average'); K=imfilter(A,H,'replicate'); subplot(2,2,3);
imshow(K);
title('Ket qua dung ham loc trung binh');
%/////////// for i=2:m-1
for j=2:n-1
	Med(1) = A(i-1,j-1);
	Med(2) =A(i-1,j) ;
	Med(3) = A(i-1,j+1);
	Med(4) = A(i,j-1);
	Med(5) = A(i,j);
	Med(6) = A(i,j+1);
	Med(7) = A(i+1,j-1);
	Med(8) = A(i+1,j);
	Med(9) = A(i+1,j+1);
sum=0; for k=1:9
sum=sum+Med(k);
end
A(i,j) = (sum/9);
end
end subplot(2,2,4); imshow(A);
title('Ket qua dung code loc trung binh');
```
### 4. Lọc trung vị
```
A = imread('noise-image.png') ; A=rgb2gray(A);
A = im2double(A); subplot(2,2,1);

imshow(A); title('Anh goc');
[m n] = size(A); Med = [];
%///////// K=medfilt2(A); subplot(2,2,3); imshow(K);
title('Ket qua dung ham loc trung vi');
%////////// for i=2:m-1
for j=2:n-1
	Med(1) = A(i-1,j-1);
	Med(2) =A(i-1,j) ;
	Med(3) = A(i-1,j+1);
	Med(4) = A(i,j-1);
	Med(5) = A(i,j);
	Med(6) = A(i,j+1);
	Med(7) = A(i+1, j-1);
	Med(8) = A(i+1,j);
	Med(9) = A(i+1,j+1);
A(i,j) = median(Med);
end
end subplot(2,2,4); imshow(A);
title('Ket qua dung code loc Trung vi');
```
### 5. Lọc Rank
```
I=imread('eight.tif'); % Read in image
Isp = imnoise(I,'salt & pepper'); % add 3% (0.03) salt and pepper noise
Ig = imnoise(I,'gaussian',0.02); % add Gaussian noise (with 0.02 variance)
I_m = ordfilt2(I,25,ones(5,5)); % apply to original image
Isp_m = ordfilt2(Isp,25,ones(5,5)); % apply to salt and pepper image 
Ig_m =ordfilt2(Ig,25,ones(5,5)); % apply tp gaussian image 
subplot(1,3,1), imshow(I_m); % Display result image
title('loc anh goc');
subplot(1,3,2), imshow(Isp_m); % Display result image title('loc salt and pepper');
subplot(1,3,3), imshow(Ig_m); % Display result image title('loc gaussian');

```
### 6. Lọc Thông Cao(High Pass Filtering)
```
%Low pass Filtering

clc;
clear all; a=imread('pout.tif'); b=imnoise(a,'gaussian'); a=double(a); b=double(b);
w=[1/9 1/9 1/9;1/9 1/9 1/9;1/9 1/9 1/9];
[m n]=size(b); for i=2:1:m-1
for j=2:1:n-1
r(i,j)=b(i-1,j-1)*w(1)+b(i-1,j)*w(2)+ b(i-1,j+1)*w(3)+ b(i,j-1)*w(4)+
b(i,j)*w(5)+ b(i,j+1)*w(6)+ b(i+1,j-1)*w(7)+ b(i+1,j)*w(8)+ b(i+1,j+1)*w(9) ;
end
end subplot(3,3,1) imshow(uint8(a));
title('Original Image') subplot(3,3,2) imshow(uint8(b));
title('Image with Gaussian Noise') subplot(3,3,3)
imshow(uint8(r));
title('Low Pass Filtered Image')
```
### 7. Lọc Thông Thấp
```
%High pass Filtering

clc;
clear all; a=imread('pout.tif'); b=imnoise(a,'gaussian'); a=double(a); b=double(b);
w=[-1/9 -1/9 -1/9;-1/9 -1/9 8/9;-1/9 -1/9 -1/9];
[m n]=size(b); for i=2:1:m-1
for j=2:1:n-1
r(i,j)=b(i-1,j-1)*w(1)+b(i-1,j)*w(2)+ b(i-1,j+1)*w(3)+ b(i,j-1)*w(4)+
b(i,j)*w(5)+ b(i,j+1)*w(6)+ b(i+1,j-1)*w(7)+ b(i+1,j)*w(8)+ b(i+1,j+1)*w(9) ;
end
end subplot(3,3,1) imshow(uint8(a));
title('Original Image') subplot(3,3,2) imshow(uint8(b));
title('Image with Gaussian Noise') subplot(3,3,3)
imshow(uint8(r));
title('High Pass Filtered Image')
```
### 8. Lọc Max/Min
`Chưa có ai có gửi về zalo 0794943324`
### 9. Chia ngưỡng ảnh
`Chưa có ai có gửi về zalo 0794943324`
### 10. Xói mòn ảnh
```
clear

I = imread('Đường Dẫn Hình Ảnh');

k=ones(3,3);
I2 = imerode(I,k);

k = ones(3,3);
I3 = imdilate(I,k);

imshow(I);
figure
imshow(I2);

%imshow(I3);
```
### 11. Phát hiện biên ảnh
```
I = imread('lena.png'); I=rgb2gray(I); I=uint8(I); subplot(2,2,1); imshow(I);
title('Anh goc');
S = edge(I,'Sobel');
subplot(2,2,3); imshow(S);
title('Tim bien voi bo loc Sobel'); C = edge(I,'Canny');
subplot(2,2,4); imshow(C);
title('Tim bien voi bo loc Canny');
```
### 12. Chuyển RGB -> HSI
```
rgb=imread('lena.png'); subplot(1,2,1); imshow(rgb);
title('Anh goc'); rgb=im2double(rgb); r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3); num=0.5*((r-g)+(r-b));
den=sqrt((r-g).^2+(r-b).*(g-b)); theta=acos((num./(den+eps))); H=theta;
H(b>g)=2*pi-H(b>g); H=H/(2*pi); num=min(min(r,g),b); den=r+g+b; den(den==0)=eps;
S=1-3.*num./den; H(S==0)=0;
I=(r+g+b)/3; hsi=cat(3,H,S,I);
subplot(1,2,2); imshow(hsi);
```
### 13. Chuyển RGB -> CMY
```
rgb=imread('lena.png'); % doc anh rgb=im2double(rgb);
r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3); C=1-r;
M=1-g;
Y=1-b; CMY=cat(3,C,M,Y);
H=imcomplement(rgb); % kiểm tra bằng hàm subplot(1,2,1)
imshow(H);
title('Ket qua dung ham'); subplot(1,2,2) imshow(CMY);
title('Ket qua dung code');
```
### 15. Chuyển CMY -> RGB
