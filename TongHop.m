function varargout = TongHop(varargin)
% TONGHOP MATLAB code for TongHop.fig
%      TONGHOP, by itself, creates a new TONGHOP or raises the existing
%      singleton*.
%
%      H = TONGHOP returns the handle to a new TONGHOP or the handle to
%      the existing singleton*.
%
%      TONGHOP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TONGHOP.M with the given input arguments.
%
%      TONGHOP('Property','Value',...) creates a new TONGHOP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TongHop_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TongHop_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TongHop

% Last Modified by GUIDE v2.5 03-Jan-2021 16:49:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TongHop_OpeningFcn, ...
                   'gui_OutputFcn',  @TongHop_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TongHop is made visible.
function TongHop_OpeningFcn(hObject, eventdata, handles, varargin)


% Choose default command line output for TongHop
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TongHop wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TongHop_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% global hinhAnh;
% 
% [tenFile, duongDanFile] = uigetfile({'*.*','(*.*)'});
% 
% if ~strcmp(tenFile,'')
%     fullname = strcat(duongDanFile,tenFile);
%     hinhAnh  = imread(fullname);
%     axes(handles.axes1);
%     imshow(hinhAnh);
% end
global h;
[FileName,PathName] = uigetfile('*.jpg;*.png;*.bmp;*.jpeg;*.tif');
fullname = strcat(PathName,FileName);
h=imread(fullname);
axes(handles.axes1);
imshow(h);  
title('Anh Goc');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global h;
global A;
global B;
chon=get(handles.chon,'value');
switch chon
    case 1
        set(handles.axes1,'visible','off');
        set(handles.axes2,'visible','off');
    case 2
            k = fspecial('gaussian',[5 5], 1);
            axes(handles.axes2);
            imshow(imfilter(h,k));title('Medium');
    case 3
            B = imadd(h, 100); % Cong Anh
            axes(handles.axes2);
            imshow(B);
            title('Cong Pixel');
    case 4
            Output = imsubtract(A, B);% Tru Anh
            axes(handles.axes2);
            imshow(Output);
            title('A - B');
    case 5
            anhAmBan = imcomplement(h);% Am Ban
            axes(handles.axes2);
            imshow(anhAmBan);
            title('Am Ban');
    case 6
            anhXam = rgb2gray(h) % Anh Xam
            axes(handles.axes2);
            imshow(anhXam);
            title('Anh Xam');
    case 7
            sz = im2double(h); %loc trung vi
            [m, n] = size(sz);
            Med = [];
            for i=2:m-1
                for j=2:n-1
                    Med(1)=sz(i-1,j-1);
                    Med(2)=sz(i-1,j);
                    Med(3)=sz(i-1,j+1);
                    Med(4)=sz(i,j-1);
                    Med(5)=sz(i,j);
                    Med(6)=sz(i,j+1);
                    Med(7)=sz(i+1,j-1);
                    Med(8)=sz(i+1,j);
                    Med(9)=sz(i+1,j+1);
                    tam = 0;
                    for k=1:8
                        for f=k+1:9
                            if Med(k)<Med(f)
                                tam = Med(k);
                                Med(k)=Med(f);
                                Med(f)=tam;
                            end
                        end
                    end
                    sz(i,j)=Med(5);
                end
            end
            axes(handles.axes2);
            imshow(sz);
            title('Loc Trung Vi');

    case 8
            h=imread('eight.tif'); % Loc Rank
            Isp = imnoise(h,'salt & pepper'); %Muoi tieu
            Ig = imnoise(h,'gaussian',0.02);
            I_m = ordfilt2(h,25,ones(5,5));
            Isp_m = ordfilt2(Isp,25,ones(5,5));
            Ig_m =ordfilt2(Ig,25,ones(5,5));
            subplot(1,5,1), imshow(I_m);
            title('Anh Goc');
            subplot(1,5,2), imshow(Isp_m); 
            title('Loc Muoi Tieu');
            subplot(1,5,3), imshow(Ig_m);
            title('Loc gaussian');
            clear
      case 9
          clc; %Loc Thong Cao
            clear all; 
            a=imread('pout.tif'); 
            b=imnoise(a,'gaussian'); 
            a=double(a); 
            b=double(b);
            w=[1/9 1/9 1/9;1/9 1/9 1/9;1/9 1/9 1/9];
            [m n]=size(b); 
            for i=2:1:m-1
                for j=2:1:n-1
                r(i,j)=b(i-1,j-1)*w(1)+b(i-1,j)*w(2)+ b(i-1,j+1)*w(3)+ b(i,j-1)*w(4)+b(i,j)*w(5)+ b(i,j+1)*w(6)+ b(i+1,j-1)*w(7)+ b(i+1,j)*w(8)+ b(i+1,j+1)*w(9) ;
                end
            end
            subplot(1,5,1)
            imshow(uint8(a));
            title('Original Image') 
            subplot(1,5,2) 
            imshow(uint8(b));
            title('Image with Gaussian Noise') 
            subplot(1,5,3)
            imshow(uint8(r));
            title('Low Pass Filtered Image')
      case 10
          clc; %Loc Thong Thap
            clear all; a=imread('pout.tif'); 
            b=imnoise(a,'gaussian'); 
            a=double(a);
            b=double(b);
            w=[-1/9 -1/9 -1/9;-1/9 -1/9 8/9;-1/9 -1/9 -1/9];
            [m n]=size(b); for i=2:1:m-1
            for j=2:1:n-1
            r(i,j)=b(i-1,j-1)*w(1)+b(i-1,j)*w(2)+ b(i-1,j+1)*w(3)+ b(i,j-1)*w(4)+b(i,j)*w(5)+ b(i,j+1)*w(6)+ b(i+1,j-1)*w(7)+ b(i+1,j)*w(8)+ b(i+1,j+1)*w(9) ;
            end
            end
            subplot(1,5,1) 
            imshow(uint8(a));
            title('Original Image') 
            subplot(1,5,2) 
            imshow(uint8(b));
            title('Image with Gaussian Noise') 
            subplot(1,5,3)
            imshow(uint8(r));
            title('High Pass Filtered Image')
      case 11
            A = im2bw(h,0.5) %Chia Nguong Anh
            axes(handles.axes2);
            imshow(A)
            title('Anh nguong')
      case 12
            k=ones(3,3);% Xoi Mon Anh
            I2 = imerode(h,k);
            axes(handles.axes2);
            imshow(I2);
            title('Xoi Mon Anh')
      case 13
            I=rgb2gray(h); % Phat hien duong bien anh
            I=uint8(I);
            S = edge(I,'Sobel');
            axes(handles.axes1); 
            imshow(S);
            title('Tim bien voi bo loc Sobel'); 
            C = edge(I,'Canny');
             axes(handles.axes2); 
            imshow(C);
            title('Tim bien voi bo loc Canny');
      case 14
            rgb=imread('lena.png'); % RGB -> HSI
            axes(handles.axes1);  
            imshow(rgb);
            title('Anh goc RGB');
            
            rgb=im2double(rgb);
            r=rgb(:,:,1);
            g=rgb(:,:,2);
            b=rgb(:,:,3);
            
            num=0.5*((r-g)+(r-b));
            den=sqrt((r-g).^2+(r-b).*(g-b)); 
            theta=acos((num./(den+eps))); 
            H=theta;
            H(b>g)=2*pi-H(b>g); H=H/(2*pi);
            
            num=min(min(r,g),b); 
            den=r+g+b; 
            den(den==0)=eps;
            S=1-3.*num./den; 
            H(S==0)=0;
            I=(r+g+b)/3;
            
            hsi=cat(3,H,S,I);
            axes(handles.axes2); 
            imshow(hsi);
            title('HSI');
      case 15
            rgb=imread('lena.png'); % RGB -> CMY
            rgb=im2double(rgb);
            r=rgb(:,:,1);
            g=rgb(:,:,2);
            b=rgb(:,:,3); 
            C=1-r;
            M=1-g;
            Y=1-b; CMY=cat(3,C,M,Y);
            H=imcomplement(rgb); % ki?m tra b?ng h�m 
            axes(handles.axes1); 
            imshow(H);
            title('Ket qua dung ham'); 
            axes(handles.axes2); 
            imshow(CMY);
            title('Ket qua dung code');
      case 16
%CMY -> RGB
end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in chon.
function chon_Callback(hObject, eventdata, handles)
% hObject    handle to chon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns chon contents as cell array
%        contents{get(hObject,'Value')} returns selected item from chon


% --- Executes during object creation, after setting all properties.
function chon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global A;
[FileName,PathName] = uigetfile('*.png;*jpg');
fullname = strcat(PathName,FileName);
A=imread(fullname);
axes(handles.axes3);
imshow(A);  
title('Anh A');
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global B;
[FileName,PathName] = uigetfile('*.png;*jpg');
fullname = strcat(PathName,FileName);
B=imread(fullname);
axes(handles.axes4);
imshow(B);  
title('Anh B');
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
