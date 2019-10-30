function GirlPlay(Current_Step,argin,dim)
if nargin == 3
    text(round(Current_Step(1)) - 0.55,round(Current_Step(2)) + 0.1,'\heartsuit','FontSize',45,'Color','m');
    drawnow;
elseif nargin == 2
    text(round(Current_Step) - 0.55,round(argin) + 0.1,'\heartsuit','FontSize',45,'Color','r');
    drawnow;
elseif nargin == 1
    text(round(Current_Step(1)) - 0.55,round(Current_Step(2)) + 0.1,'\heartsuit','FontSize',45,'Color','r');
    drawnow;
else
    error('Error inputs! ')
end