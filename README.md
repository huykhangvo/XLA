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

`Chưa có khi nào có gửi về zalo 0794943324`
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
```
```
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
### 5. Lọc Rank
### 6. Lọc Thông Cao
### 7. Lọc Thông Thấp
### 8. Lọc Max/Min
### 9. Chia ngưỡng ảnh
### 10. Xói mòn ảnh
### 11. Phát hiện biên ảnh
### 12. Chuyển RGB -> HSI CMY
### 13. Chuyển RGB -> CMY
### 14. Chuyển CMY -> RGB
