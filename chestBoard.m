clc
grid on
axis([-1.75 1.75 -1.75 1.75])
set(gca,'GridLineStyle','-','XTick',[-1.75:0.25:1.75],'YTick',[-1.75:0.25:1.75])
axis square

%[x, y] = ginput(1);
%disp([x, y]);
%circle(0.125, x, y, 'r');
%chess(x, y, 'action');
%chess;  
color = 1;
chess();


