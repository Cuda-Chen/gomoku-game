%% 五子棋
function chessboard(player_r,player_g,score_g,score_r)
clf
%% 玩家信息初始化
for Index = 1:15
        plot([Index Index],[1 15],'-');hold on
        plot([1 15],[Index Index],'-');hold on
end
h0 = plot([4 4 8 12 12],[4 12 8 4 12],'b.');
h1 = plot([1 1 15 15 1],[1 15 15 1 1],'b-');
set(h1,'LineWidth',6);
set(h0,'MarkerSize',20);
axis equal
axis([1 15 1 15])
set(gcf,'Toolbar','none','position',[ 164 48 1070 690],'Resize' ,'off')
set(gca,'XTick',[],'YTick',[])

hh = get(gcf,'CurrentAxes');
%% 底下设置控制按钮

text(-5.2527,0.20 ,'Chen Le ','FontName','Arial Unicode MS','FontSize',10)
text(-5.2527,-0.20 ,'May 1, 2012 @ NCRL','FontName','Arial Unicode MS','FontSize',10)
text(16,-0.2 ,'\copyright Copyright Reserved  ','FontName','Arial Unicode MS','FontSize',10)
text(2.0214,0.0409,'  开   始  ','FontName','华文楷体','EdgeColor','white','LineWidth',3,'FontSize',16)
text(7.0569,0.0409,'  认   输  ','FontName','华文楷体','EdgeColor','white','LineWidth',3,'FontSize',16)
text(12.0569,0.0409,'  退   出  ','FontName','华文楷体','EdgeColor','white','LineWidth',3,'FontSize',16)
title('五子棋','FontName','华文行楷','FontSize',25)


%% 左边显示 玩家信息
text(16.0,10.4,player_r,'FontSize',16);
text(18.5,10.4,':','FontSize',16);
text(19,10.5,'\heartsuit','FontSize',26,'Color','r');
text(16.0,9.4,'Score ','FontSize',16);
text(18.5,9.4,':','FontSize',16);
text(19.1,9.4,num2str(score_r),'FontSize',22,'Color','r');

text(16.0,3.4,player_g,'FontSize',16);
text(18.5,3.4,':','FontSize',16);
text(19,3.5,'\spadesuit','FontSize',26,'Color','g');
text(16.0,2.4,'Score ','FontSize',16);
text(18.5,2.4,':','FontSize',16);
text(19.1,2.4,num2str(score_g),'FontSize',22,'Color','g');

axes('Parent',gcf,'position',[0.82  .3  .14  .24]);
imshow('Chen Le.png');
set(gcf,'color',[1 193/255 132/255]);

axes('Parent',gcf,'position',[0.83  .7  .11  .21]);
imshow('yjbpyjb1.jpg');
set(gcf,'CurrentAxes',hh)
