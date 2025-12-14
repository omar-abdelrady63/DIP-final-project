classdef gui_logic
    methods (Static)
        
        function setupPaths()
            currentPath = fileparts(mfilename('fullpath')); 
            functionsPath = fullfile(currentPath, '..', 'Functions');
            addpath(functionsPath);
        end

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

        function onCannyEdge(~, fig)
            gui_logic.processImage(fig, @canny_edge);
        end

        function onDiffOfGaussians(~, fig)
            gui_logic.processImage(fig, @dog_filter);
        end

        function onAddSaltPepper(~, fig)
            gui_logic.processImage(fig, @add_sp_noise);
        end

        function onAddGaussianNoise(~, fig)
            gui_logic.processImage(fig, @add_gaussian_noise);
        end

        function onRemoveNoise(~, fig)
            gui_logic.processImage(fig, @remove_noise);
        end

        function onHistEqualization(~, fig)
            gui_logic.processImage(fig, @hist_eq);
        end

        function processImage(fig, funcHandle)
            gui_logic.setupPaths();
            appData = fig.UserData;
            
            if isempty(appData.OriginalImage)
                uialert(fig, 'Please Load an Image First!', 'Warning');
                return;
            end
            
            try
                inputImg = appData.OriginalImage;
                
                if size(inputImg, 3) == 3
                    inputImg = rgb2gray(inputImg); 
                end
                
                outImg = funcHandle(inputImg);
                
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