% Construct a questdlg with three options
q = questdlg('game of 五子棋, press start to play, press exit to close program, press help to know how to play',...
    'wtf', ...
    'start', 'exit', 'help', 'start');
% Handle response
switch q
    case 'start'
        chessBoard; % start gaming
    case 'exit'
        close; % close program
    case 'help'
        h = msgbox('First, two player choose a color. Then computer will randomize a color to play first. The rules just like the ordinary 五子棋');
        %gamestart;
    otherwise
        disp('error');
end