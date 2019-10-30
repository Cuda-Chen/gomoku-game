function q = playAgain
% Construct a questdlg with two options
q = questdlg('Play again?',...
    'WTF', ...
    'again', 'no', 'again');
% Handle response
global exit;
switch q
    case 'again'
        reset(gcf);
        chessBoard; % play again
    case 'no' % quit playing
        exit = 'exit';
        close;
    %otherwise
     %   disp('error');
end
end