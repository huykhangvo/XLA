**ÔN TẬP XỬ LÝ ẢNH**

### 1. Cộng/Trừ Pixel Ảnh
-	Cộng pixel
####MATLAB code
```
A=imread('cameraman.tif'); % Read in image 
subplot(1,2,1), imshow(A); % Display image
B = imadd(A, 100); % Add 100 pixel values to image A 
subplot(1,2,2), imshow(B); % Display result image B
```
-	Trừ pixel

####MATLAB code
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
-	Ảnh Âm bản

`Chưa có khi nào có gửi về zalo 0794943324`
### 3. Lọc trung bình (Code Tay)
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
