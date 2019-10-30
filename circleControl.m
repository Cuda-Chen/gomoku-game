function circleControl(action)

if nargin == 0,
    action = 'initialize';
end

switch(action)
    case 'initialize'
        axis([0 1 0 1]);
        box on;
        title('circleControl');
        % �]�w�ƹ����s�Q���U�ɪ��������O���ucircleControl down�v
        set(gcf, 'WindowButtonDownFcn', 'circleControl down');
    case 'down'
        % �]�w�ƹ����s�Q����ɪ��������O���ucircleControl up�v
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
        % �M���ƹ����s�Q����ɪ��������O
        set(gcf, 'WindowButtonUpFcn', '');
        fprintf('Mouse up!\n');
    otherwise
        disp('Error!');
end