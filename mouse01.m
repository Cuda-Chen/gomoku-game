function mouse01(action)
% mouse01: ���Үi�ܦp��]�w�ƹ��ƥ󪺤������O

if nargin == 0, action = 'start'; end

switch(action)
    case 'start' % �}�ҹϧε���
        axis([0 1 0 1]); % �]�w�϶b�d��
        box on; % �N�϶b�[�W�Ϯ�
        title('Click and drag your mouse in this window!');
    % �]�w�ƹ����s�Q���U�ɪ��������O���umouse01 down�v
        set(gcf, 'WindowButtonDownFcn', 'mouse01 down');
    case 'down' % �ƹ����s�Q���U�ɪ��������O
        % �]�w�ƹ����ʮɪ��������O���umouse01 move�v
        set(gcf, 'WindowButtonMotionFcn', 'mouse01 move');
        % �]�w�ƹ����s�Q����ɪ��������O���umouse01 up�v
        set(gcf, 'WindowButtonUpFcn', 'mouse01 up');
        % �C�L�uMouse down!�v�T��
        fprintf('Mouse down!\n');
    case 'move' % �ƹ����ʮɪ��������O
        currPt = get(gca, 'CurrentPoint');
        x = currPt(1,1); y = currPt(1, 2);
        line(x, y, 'marker', '.', 'EraseMode', 'xor');
        % �C�L�uMouse is moving!�v�T���ηƹ��{�b��m
        fprintf('Mouse is moving! Cuttent location = (%g, %g)\n', ...
            currPt(1, 1), currPt(1, 2));
    case 'up' % �ƹ����s�Q����ɪ��������O
		% �M���ƹ����ʮɪ��������O
        set(gcf, 'WindowButtonMotionFcn', '');
        % �M���ƹ����s�Q����ɪ��������O
        set(gcf, 'WindowButtonUpFcn', '');
        % �C�L�uMouse up!�v�T��
        fprintf('Mouse up!\n');
end

    

