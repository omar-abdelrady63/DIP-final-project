function salt_pepper_slider()
    % قراءة الصورة
    img = imread('input.jpg');  % ضع اسم الصورة هنا

    % تحويل الصورة الرمادية إلى RGB إذا لزم الأمر
    if size(img,3)==1
        img = cat(3,img,img,img);
    end

    % إنشاء نافذة عرض
    hFig = figure('Name','Salt & Pepper Noise Dynamic','NumberTitle','off');
    hAx = axes('Parent',hFig);
    hIm = imshow(img,'Parent',hAx);

    % إضافة النص التوضيحي
    uicontrol('Style','text','Position',[20 20 150 20],'String','نسبة الضوضاء');

    % Slider بقيم افتراضية
    defaultMin = 0;        % الحد الأدنى
    defaultMax = 0.5;      % الحد الأقصى
    defaultValue = 0.05;   % القيمة الابتدائية 5%
    sliderPosition = [180 20 200 20];

    % إنشاء Slider مع Callback لتحديث الصورة تلقائيًا
    uicontrol('Style','slider','Min',defaultMin,'Max',defaultMax,'Value',defaultValue, ...
              'Position',sliderPosition, ...
              'Callback',@(src,~) set(hIm,'CData',imnoise(img,'salt & pepper',get(src,'Value'))));
end