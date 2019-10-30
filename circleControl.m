function circleControl(action)

if nargin == 0,
    action = 'initialize';
end

switch(action)
    case 'initialize'
        axis([0 1 0 1]);
        box on;
        title('circleControl');
        % 設定滑鼠按鈕被按下時的反應指令為「circleControl down」
        set(gcf, 'WindowButtonDownFcn', 'circleControl down');
    case 'down'
        % 設定滑鼠按鈕被釋放時的反應指令為「circleControl up」
        set(gcf, 'WindowButtonUpFcn', 'circleControl up');
        circle(0.5, 0.5, 0.5);
        %t = linspace(0, 2*pi, 100);
        %x = 10 * cos(t);
        %y = 10 * sin(t);
        %plot(x, y);
        %fill(x, y, 'r');
        %axis square
        %fprintf('Mouse down!\n');
        %%%
    case 'up'
        % 清除滑鼠按鈕被釋放時的反應指令
        set(gcf, 'WindowButtonUpFcn', '');
        fprintf('Mouse up!\n');
    otherwise
        disp('Error!');
end