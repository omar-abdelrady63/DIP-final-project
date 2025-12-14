function main_gui
    fig = uifigure('Name', 'Team 8 Image Processing Project', ...
        'Position', [100 100 900 600], ...
        'Color', [0.96 0.96 0.96]);

    mainGrid = uigridlayout(fig, [1 2]);
    mainGrid.ColumnWidth = {220, '1x'};
    mainGrid.RowHeight   = {'1x'};
    mainGrid.Padding     = [10 10 10 10];
    mainGrid.ColumnSpacing = 10;
    mainGrid.RowSpacing    = 10;

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

    appData = struct();
    appData.OriginalAxes = [];
    appData.ProcessedAxes = [];
    appData.OriginalImage = [];
    appData.ProcessedImage = [];
    fig.UserData = appData;

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

    axOriginal = uiaxes(axesGrid);
    axOriginal.Layout.Row = 1;
    axOriginal.Layout.Column = 1;
    title(axOriginal, 'Original Image');
    axOriginal.XTick = [];
    axOriginal.YTick = [];
    box(axOriginal, 'on');

    axProcessed = uiaxes(axesGrid);
    axProcessed.Layout.Row = 2;
    axProcessed.Layout.Column = 1;
    title(axProcessed, 'Processed Image');
    axProcessed.XTick = [];
    axProcessed.YTick = [];
    box(axProcessed, 'on');

    appData = fig.UserData;
    appData.OriginalAxes  = axOriginal;
    appData.ProcessedAxes = axProcessed;
    fig.UserData = appData;

    
    btnLoad = uibutton(controlsGrid, ...
        'Text', 'Load Image', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onLoadImage(btn, fig));
    btnLoad.Layout.Row = 1;
    btnLoad.Layout.Column = 1;
    btnLoad.FontWeight = 'bold';
    btnLoad.BackgroundColor = [0.20 0.45 0.80];
    btnLoad.FontColor = [1 1 1];

    btnCanny = uibutton(controlsGrid, ...
        'Text', 'Canny Edge ', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onCannyEdge(btn, fig));
    btnCanny.Layout.Row = 2;

    btnDoG = uibutton(controlsGrid, ...
        'Text', 'Diff of Gaussians ', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onDiffOfGaussians(btn, fig));
    btnDoG.Layout.Row = 3;

    btnSP = uibutton(controlsGrid, ...
        'Text', 'Add Salt & Pepper ', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onAddSaltPepper(btn, fig));
    btnSP.Layout.Row = 4;

    btnGaussNoise = uibutton(controlsGrid, ...
        'Text', 'Add Gaussian Noise ', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onAddGaussianNoise(btn, fig));
    btnGaussNoise.Layout.Row = 5;

    btnRemoveNoise = uibutton(controlsGrid, ...
        'Text', 'Remove Noise', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onRemoveNoise(btn, fig));
    btnRemoveNoise.Layout.Row = 6;

    btnHistEq = uibutton(controlsGrid, ...
        'Text', 'Hist Equalization', ...
        'ButtonPushedFcn', @(btn, event) gui_logic.onHistEqualization(btn, fig));
    btnHistEq.Layout.Row = 7;

end