function ui02(action)

if nargin == 0,
    action = 'initialize';
end

switch(action)
    case 'initialize'    % �ϧε�����UI����󪺪�l�ơC
	% ���ͷs�ϧε����A�䥪�U�����y�Ь�[30, 30]�A
	% ���׬�300�A���׬�200�]���HPixel�����^
    figH = figure('position', [30 30 300 200]);
    
    % �b�ϧε��������ͤ@�ӹ϶b�A�䥪�U�����y�Ь�[0.1, 0.2],
	% ���׬�0.8�A���׬�0.8�]�ϥμзǤƪ����A�Y�ϧΪ����U����[0, 0]�A
	% ���פΰ��׳��O1�C�^
    axes('position', [0.1 0.2 0.8 0.8]);
    
    % �����W���Ĥ@�ӹϧΡA���T�תŶ���peaks��ơC
    pointNum = 20;
    [xx, yy, zz] = peaks(pointNum);
    surf(xx, yy, zz);
    axis tight
    
    % �Ĥ@��UI�����A�ΥH����I����u����ܡC
    pos1 = [10, 10, 60, 20];
    h1 = uicontrol('style', 'checkbox', ...
        'tag', 'UI1', ...
        'string', 'Grid on', ...
        'position', pos1, 'value', 1);
    
    % �ĤG��UI�����A�ΥH���wX�b��Y�b����l�I�ƥءC
    pos2 = [90, 10, 60, 20];
    h2 = uicontrol('style', 'edit', ...
        'tag', 'UI2', ...
        'string', int2str(pointNum), ...
        'position', pos2, 'backgroundColor', [1 1 1]);
    
    % �ĤT��UI�����A�ΥH���w��ܦ����ҥΨ쪺�զ�L�C
    pos3 = [170, 10, 60, 20];
    h3 = uicontrol('style', 'popmenu', ...
        'tag', 'UI3', ...
        'string', 'hsv|gray|hot|cool|pink|jet', ...
        'position', pos3);
    
    % �Ĥ@��UI����󪺤������O���ugrid�v�C
    set(h1, 'callback', 'grid');
    % �ĤG��UI����󪺤������O���uui02('callback2')�v�C
    set(h2, 'callback', 'ui02("callback2")');
    % �ĤT��UI����󪺤������O���uui02('callback3')�v�C
    set(h3, 'callback', 'ui02("callback3")');
    
    case 'callback2' % �ĤG��UI�����callback�C
	% ��X�Ĥ@�βĤG��UI����󪺴���C
    h1 = findobj(0, 'tag', 'UI1');
    h2 = findobj(0, 'tag', 'UI2');
    
    % ���o�ĤG��UI����󪺼ƭȡC
    pointNum = round(str2num(get(h2, 'string')));
    
    % �Y�Ʀr�Ӥj�ΤӤp�A�h�]�w��10�C
    if pointNum <= 1 | pointNum > 100,
        pointNum = 10;
    end
    set(h2, 'string', int2str(pointNum));
    
    % �ھکұo���Ʀr�A���epeaks�����C
    [xx, yy, zz] = peaks(pointNum);
    surf(xx, yy, zz);
    axis tight;
    
    % �ھڲĤ@��UI�����A�M�w�O�_�n�e��u�C
    if get(h1, 'value') == 1,
        grid on;
    else
        gird off;
    end
    
    case 'callback3' % �ĤT��UI�����callback�C
	% ��X�ĤT��UI����󪺴���
    h3 = findobj(0, 'tag', 'UI3');
    
    % �ھڲĤT��UI�����ӨM�w�ϥΪ���L�x�}�C
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