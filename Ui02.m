function ui02(action)

if nargin == 0,
    action = 'initialize';
end

switch(action)
    case 'initialize'    % 圖形視窗及UI控制物件的初始化。
	% 產生新圖形視窗，其左下角之座標為[30, 30]，
	% 長度為300，高度為200（均以Pixel為單位）
    figH = figure('position', [30 30 300 200]);
    
    % 在圖形視窗內產生一個圖軸，其左下角之座標為[0.1, 0.2],
	% 長度為0.8，高度為0.8（使用標準化的單位，即圖形的左下角為[0, 0]，
	% 長度及高度都是1。）
    axes('position', [0.1 0.2 0.8 0.8]);
    
    % 視窗上的第一個圖形，為三度空間的peaks函數。
    pointNum = 20;
    [xx, yy, zz] = peaks(pointNum);
    surf(xx, yy, zz);
    axis tight
    
    % 第一個UI控制物件，用以控制背景格線的顯示。
    pos1 = [10, 10, 60, 20];
    h1 = uicontrol('style', 'checkbox', ...
        'tag', 'UI1', ...
        'string', 'Grid on', ...
        'position', pos1, 'value', 1);
    
    % 第二個UI控制物件，用以指定X軸及Y軸的格子點數目。
    pos2 = [90, 10, 60, 20];
    h2 = uicontrol('style', 'edit', ...
        'tag', 'UI2', ...
        'string', int2str(pointNum), ...
        'position', pos2, 'backgroundColor', [1 1 1]);
    
    % 第三個UI控制物件，用以指定顯示曲面所用到的調色盤。
    pos3 = [170, 10, 60, 20];
    h3 = uicontrol('style', 'popmenu', ...
        'tag', 'UI3', ...
        'string', 'hsv|gray|hot|cool|pink|jet', ...
        'position', pos3);
    
    % 第一個UI控制物件的反應指令為「grid」。
    set(h1, 'callback', 'grid');
    % 第二個UI控制物件的反應指令為「ui02('callback2')」。
    set(h2, 'callback', 'ui02("callback2")');
    % 第三個UI控制物件的反應指令為「ui02('callback3')」。
    set(h3, 'callback', 'ui02("callback3")');
    
    case 'callback2' % 第二個UI控制物件的callback。
	% 找出第一及第二個UI控制物件的握把。
    h1 = findobj(0, 'tag', 'UI1');
    h2 = findobj(0, 'tag', 'UI2');
    
    % 取得第二個UI控制物件的數值。
    pointNum = round(str2num(get(h2, 'string')));
    
    % 若數字太大或太小，則設定為10。
    if pointNum <= 1 | pointNum > 100,
        pointNum = 10;
    end
    set(h2, 'string', int2str(pointNum));
    
    % 根據所得的數字，重畫peaks曲面。
    [xx, yy, zz] = peaks(pointNum);
    surf(xx, yy, zz);
    axis tight;
    
    % 根據第一個UI控制物件，決定是否要畫格線。
    if get(h1, 'value') == 1,
        grid on;
    else
        gird off;
    end
    
    case 'callback3' % 第三個UI控制物件的callback。
	% 找出第三個UI控制物件的握把
    h3 = findobj(0, 'tag', 'UI3');
    
    % 根據第三個UI控制物件來決定使用的色盤矩陣。
    switch get(h3, 'value')
        case 1
            colormap(hsv);
        case 2
            colormap(gray);
        case 3
            colormap(hot);
        case 4
            colormap(cool);
        case 5
            colormap(pink);
        case 6
            colormap(jet);
        otherwise
            disp('Unknown option');
    end
    
    otherwise,
        error('Unknown action string!');
end