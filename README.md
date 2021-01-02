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
### 2. Ảnh xám, âm bản
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
####HTML code

```html
<!DOCTYPE html>
<html>
    <head>
        <mate charest="utf-8" />
        <title>Hello world!</title>
    </head>
    <body>
        <h1>Hello world!</h1>
    </body>
</html>
```

