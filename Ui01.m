% 產生新圖形視窗，其左下角之座標為[30, 30]，
% 長度為300，高度為200（均以Pixel為單位）
figure('position', [30 30 300 200]);

% 在圖形視窗內產生一個圖軸，其左下角之座標為[0.1, 0.2],
% 長度為0.8，高度為0.8（使用標準化的單位，即圖形的左下角為[0, 0]，
% 長度及高度都是1。）
axes('position', [0.1 0.2 0.8 0.8]);

% 視窗上的第一個圖形，為三度空間的peaks函數。
pointNum = 20;
[xx yy zz] = peaks(pointNum);
surf(xx, yy, zz);
axis tight

% 第一個UI控制物件，用以控制背景格線的顯示。
pos1 = [10, 10, 60, 20];
h1 = uicontrol('style', 'checkbox', 'string', 'Grid on', ...
    'position', pos1, 'value', 1);

% 第二個UI控制物件，用以指定X軸及Y軸的格子點數目。
pos2 = [90, 10, 60, 20];
h2 = uicontrol('style', 'edit', 'string', int2str(pointNum), ...
    'position', pos2, 'backgroundColor', [1 1 1]);

% 第三個UI控制物件，用以指定顯示曲面所用到的色盤矩陣。
pos3 = [170, 10, 60, 20];
h3 = uicontrol('style', 'popmenu', ...
    'string', 'hsv|gray|hot|cool|pink|jet', ...
    'position', pos3);

% 第一個UI控制物件的反應指令為「cb1」
set(h1, 'callback', 'cb1');
% 第二個UI控制物件的反應指令為「cb2」
set(h2, 'callback', 'cb2');
% 第三個UI控制物件的反應指令為「cb3」
set(h3, 'callback', 'cb3');