function f = chess(action)
% CHESS.M
% to draw chess
if nargin == 0,
    action = 'start';
end

global color;
global chessBoard;

switch(action)
    case 'start'
        set(gcf, 'WindowButtonDownFcn', 'chess down');
    case 'down'
        %set(gcf, 'WindowButtonUpFcn', 'chess up');
        % to let the coordinates be integers
        [x, y] = ginput(1);
        if (x - floor(x)) <= 0.5,
            x = floor(x);
        elseif (x - floor(x)) > 0.5,
            x = ceil(x);
        end
        
        if (y - floor(y)) <= 0.5,
            y = floor(y);
        elseif (y - floor(y)) > 0.5,
            y = ceil(y);
        end
        
        % draw chess
        %t = linspace(0, 2*pi, 100);
        %x1 = 0.5 * cos(t) + x;
        %y1 = 0.5 * sin(t) + y;
        %hold on;
        %plot(x1, y1);
        if chessBoard(x, y) ~= 0, % if chess board's current position has a chess
            disp('invalid');
            h = msgbox('invalid move');
        elseif color == 1 % if it's red player's turn
            t = linspace(0, 2*pi, 100);
        x1 = 0.5 * cos(t) + x;
        y1 = 0.5 * sin(t) + y;
        hold on;
        plot(x1, y1);
            fill (x1, y1, 'r');
            chessBoard(x, y) = 1;
            color = 0;
            winLose(chessBoard, x, y, 1); % function to check whether player is win
        elseif color == 0 % if it's blue player's turn
            t = linspace(0, 2*pi, 100);
        x1 = 0.5 * cos(t) + x;
        y1 = 0.5 * sin(t) + y;
        hold on;
        plot(x1, y1);
            fill(x1, y1, 'b');
            chessBoard(x, y) = -1;
            color = 1;
            winLose(chessBoard, x, y, 0); % function to check whether player is win
        end
        set(gcf, 'WindowButtonUpFcn', 'chess up');
    case 'up'
        set(gcf, 'WindowButtonUpFcn', 'chess start');
        %fprintf('Mouse up!\n');
    otherwise
        disp('Error');
% draw circle
end

