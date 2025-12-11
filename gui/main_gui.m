function main_gui
    % Create main figure
    fig = uifigure('Name', 'Team 8 Image Processing Project', ...
        'Position', [100 100 900 600], ...
        'Color', [0.96 0.96 0.96]);

    % Main grid: 1 row, 2 columns (Left controls, Right axes)
    mainGrid = uigridlayout(fig, [1 2]);
    mainGrid.ColumnWidth = {220, '1x'};
    mainGrid.RowHeight   = {'1x'};
    mainGrid.Padding     = [10 10 10 10];
    mainGrid.ColumnSpacing = 10;
    mainGrid.RowSpacing    = 10;

    %% Left panel for controls
    leftPanel = uipanel(mainGrid, ...
        'Title', 'Controls', ...
        'FontWeight', 'bold', ...
        'FontSize', 12);
    leftPanel.Layout.Row = 1;
    leftPanel.Layout.Column = 1;

    controlsGrid = uigridlayout(leftPanel, [8 1]);
    controlsGrid.RowHeight   = {40, 40, 40, 40, 40, 40, 40, '1x'};
    controlsGrid.ColumnWidth = {'1x'};
    controlsGrid.Padding     = [10 10 10 10];
    controlsGrid.RowSpacing  = 8;

    % Shared app data (struct stored in figure UserData)
    appData = struct();
    appData.OriginalAxes = [];
    appData.ProcessedAxes = [];
    appData.OriginalImage = [];
    appData.ProcessedImage = [];
    fig.UserData = appData;

    %% Right panel for axes
    rightPanel = uipanel(mainGrid, ...
        'Title', 'Image Views', ...
        'FontWeight', 'bold', ...
        'FontSize', 12);
    rightPanel.Layout.Row = 1;
    rightPanel.Layout.Column = 2;

    axesGrid = uigridlayout(rightPanel, [2 1]);
    axesGrid.RowHeight   = {'1x', '1x'};
    axesGrid.ColumnWidth = {'1x'};
    axesGrid.Padding     = [10 10 10 10];
    axesGrid.RowSpacing  = 10;

    % Top axes: Original Image
    axOriginal = uiaxes(axesGrid);
    axOriginal.Layout.Row = 1;
    axOriginal.Layout.Column = 1;
    title(axOriginal, 'Original Image');
    axOriginal.XTick = [];
    axOriginal.YTick = [];
    box(axOriginal, 'on');

    % Bottom axes: Processed Image
    axProcessed = uiaxes(axesGrid);
    axProcessed.Layout.Row = 2;
    axProcessed.Layout.Column = 1;
    title(axProcessed, 'Processed Image');
    axProcessed.XTick = [];
    axProcessed.YTick = [];
    box(axProcessed, 'on');

    % Update app data with axes handles
    appData = fig.UserData;
    appData.OriginalAxes  = axOriginal;
    appData.ProcessedAxes = axProcessed;
    fig.UserData = appData;

    %% Buttons in left panel (Linked to gui_logic)
    
    % 1. Load Image (main button)
    btnLoad = uibutton(controlsGrid, ...
        'Text', 'Load Image', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onLoadImage(btn, fig));
    btnLoad.Layout.Row = 1;
    btnLoad.Layout.Column = 1;
    btnLoad.FontWeight = 'bold';
    btnLoad.BackgroundColor = [0.20 0.45 0.80];
    btnLoad.FontColor = [1 1 1];

    % 2. Canny Edge (Kamel)
    btnCanny = uibutton(controlsGrid, ...
        'Text', 'Canny Edge ', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onCannyEdge(btn, fig));
    btnCanny.Layout.Row = 2;

    % 3. Diff of Gaussians (Abu Hadid)
    btnDoG = uibutton(controlsGrid, ...
        'Text', 'Diff of Gaussians ', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onDiffOfGaussians(btn, fig));
    btnDoG.Layout.Row = 3;

    % 4. Add Salt & Pepper (Abdallah)
    btnSP = uibutton(controlsGrid, ...
        'Text', 'Add Salt & Pepper ', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onAddSaltPepper(btn, fig));
    btnSP.Layout.Row = 4;

    % 5. Add Gaussian Noise 
    btnGaussNoise = uibutton(controlsGrid, ...
        'Text', 'Add Gaussian Noise ', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onAddGaussianNoise(btn, fig));
    btnGaussNoise.Layout.Row = 5;

    % 6. Remove Noise (Al-Rajhi)
    btnRemoveNoise = uibutton(controlsGrid, ...
        'Text', 'Remove Noise', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onRemoveNoise(btn, fig));
    btnRemoveNoise.Layout.Row = 6;

    % 7. Hist Equalization (El-Daly)
    btnHistEq = uibutton(controlsGrid, ...
        'Text', 'Hist Equalization', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onHistEqualization(btn, fig));
    btnHistEq.Layout.Row = 7;

end