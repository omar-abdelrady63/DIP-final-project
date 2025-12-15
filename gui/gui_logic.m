classdef gui_logic
    methods (Static)
        
        function setupPaths()
            currentPath = fileparts(mfilename('fullpath')); 
            functionsPath = fullfile(currentPath, '..', 'Functions');
            
            if exist(functionsPath, 'dir')
                addpath(functionsPath);
                fprintf('Added path: %s\n', functionsPath);
            else
                functionsPath = fullfile(pwd, 'Functions');
                if exist(functionsPath, 'dir')
                    addpath(functionsPath);
                    fprintf('Added path: %s\n', functionsPath);
                else
                    warning('Functions folder not found!');
                end
            end
        end

        function onLoadImage(~, fig)
            gui_logic.setupPaths(); 
            appData = getappdata(fig, 'AppData');
            
            [file, path] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Image Files'});
            if isequal(file, 0)
                return; 
            end
            
            try
                img = imread(fullfile(path, file));
                appData.OriginalImage = img;
                appData.ProcessedImage = [];
                setappdata(fig, 'AppData', appData);
                
                axes(appData.OriginalAxes);
                imshow(img);
                title('Original Image', 'FontSize', 12, 'FontWeight', 'bold');
                
            catch
                errordlg('Failed to load image.', 'Error');
            end
        end

        function onCannyEdge(~, fig)
            gui_logic.processImage(fig, @canny_edge, 'Canny Edge');
        end

        function onDiffOfGaussians(~, fig)
            gui_logic.processImage(fig, @dog_filter, 'Diff of Gaussians');
        end

        function onAddSaltPepper(~, fig)
            gui_logic.processImage(fig, @add_sp_noise, 'Salt & Pepper');
        end

        function onAddGaussianNoise(~, fig)
            gui_logic.processImage(fig, @add_gaussian_noise, 'Gaussian Noise');
        end

        function onRemoveNoise(~, fig)
            gui_logic.processImage(fig, @remove_noise, 'Remove Noise');
        end

        function onHistEqualization(~, fig)
            gui_logic.processImage(fig, @hist_eq, 'Histogram Equalization');
        end

        function processImage(fig, funcHandle, operationName)
            gui_logic.setupPaths();
            appData = getappdata(fig, 'AppData');
            
            if isempty(appData.OriginalImage)
                warndlg('Please Load an Image First!', 'Warning');
                return;
            end
            
            try
                inputImg = appData.OriginalImage;
                
                if size(inputImg, 3) == 3
                    inputImg = rgb2gray(inputImg); 
                end
                
                outImg = funcHandle(inputImg);
                
                appData.ProcessedImage = outImg;
                setappdata(fig, 'AppData', appData);
                
                axes(appData.ProcessedAxes);
                imshow(outImg);
                title(['Processed: ' operationName], 'FontSize', 12, 'FontWeight', 'bold');
                
            catch ME
                errordlg(['Error: ' ME.message], 'Execution Error');
            end
        end
    end
end