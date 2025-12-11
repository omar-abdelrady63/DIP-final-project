classdef gui_logic
    methods (Static)
        
        % --- تعديل المسار ليطابق اسم الفولدر في الصورة (Functions) ---
        function setupPaths()
            currentPath = fileparts(mfilename('fullpath')); 
            % التعديل هنا: حرف F كابيتال زي الصورة
            functionsPath = fullfile(currentPath, '..', 'Functions');
            addpath(functionsPath);
        end

        % --- 1. Load Image Logic ---
        function onLoadImage(~, fig)
            gui_logic.setupPaths(); 
            appData = fig.UserData;
            
            [file, path] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Images'});
            if isequal(file, 0), return; end
            
            try
                img = imread(fullfile(path, file));
                appData.OriginalImage = img;
                appData.ProcessedImage = [];
                fig.UserData = appData;
                
                imshow(img, 'Parent', appData.OriginalAxes);
                title(appData.OriginalAxes, 'Original Image');
            catch
                uialert(fig, 'Failed to load image.', 'Error');
            end
        end

        % --- 2. Canny Edge (Updated Name: canny_edge.m) ---
        function onCannyEdge(~, fig)
            % التعديل: استدعاء canny_edge
            gui_logic.processImage(fig, @canny_edge);
        end

        % --- 3. DoG (Updated Name: dog_filter.m) ---
        function onDiffOfGaussians(~, fig)
            % التعديل: استدعاء dog_filter
            gui_logic.processImage(fig, @dog_filter);
        end

        % --- 4. Salt & Pepper (Updated Name: add_sp_noise.m) ---
        function onAddSaltPepper(~, fig)
            % التعديل: استدعاء add_sp_noise
            gui_logic.processImage(fig, @add_sp_noise);
        end

        % --- 5. Gaussian Noise (Name Matches: add_gaussian_noise.m) ---
        function onAddGaussianNoise(~, fig)
            gui_logic.processImage(fig, @add_gaussian_noise);
        end

        % --- 6. Remove Noise (Name Matches: remove_noise.m) ---
        function onRemoveNoise(~, fig)
            gui_logic.processImage(fig, @remove_noise);
        end

        % --- 7. Hist Equalization (Updated Name: hist_eq.m) ---
        function onHistEqualization(~, fig)
            % التعديل: استدعاء hist_eq
            gui_logic.processImage(fig, @hist_eq);
        end

        % --- Main Processing Function ---
        function processImage(fig, funcHandle)
            gui_logic.setupPaths();
            appData = fig.UserData;
            
            if isempty(appData.OriginalImage)
                uialert(fig, 'Please Load an Image First!', 'Warning');
                return;
            end
            
            try
                % 1. ناخد نسخة من الصورة الأصلية
                inputImg = appData.OriginalImage;
                
                % 2. (الإضافة الجديدة): التحويل التلقائي للأبيض والأسود
                % بنشوف لو الصورة ليها 3 أبعاد (يعني RGB)
                if size(inputImg, 3) == 3
                    inputImg = rgb2gray(inputImg); 
                end
                
                % 3. نبعت الصورة (بعد التأكد إنها رمادي) للفانكشن بتاعة زميلك
                outImg = funcHandle(inputImg);
                
                % 4. الحفظ والعرض
                appData.ProcessedImage = outImg;
                fig.UserData = appData;
                
                imshow(outImg, 'Parent', appData.ProcessedAxes);
                title(appData.ProcessedAxes, 'Processed Image (Gray)');
            catch ME
                uialert(fig, ['Error: ' ME.message], 'Execution Error');
            end
        end
    end
end