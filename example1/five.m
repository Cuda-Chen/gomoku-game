%¤­¤l´Ñµ{§Ç
function [  ] = five()
global a h m1 n1 m2 n2 t h1 h2 h3 color score hsc ha ss
hf=figure('resize','off','name','five',...
    'position',[360   280   560   420],'numbertitle','off');
ha=axes;
set(gcf,'menubar','none','color',[0.3 0.3 0.3])
set(gca,'position',[0.2300    0.1100    0.7750    0.8150])
set(gca,'xlim',[0,9],'ylim',[0,9])
set(ha,'xtick',[],'ytick',[],'box','on')
set(ha,'color',[0.7 0.6,0.6])
set(ha,'DataAspectRatio',[1 1 1],'PlotBoxAspectRatio',[1 1 1])
x=repmat([0;9],1,9);
y=[1:9;1:9];
line(x,y,'color','k')
line(y,x,'color','k')
hst=uicontrol('style','text','string','Score','fontsize',30,...
    'units','normal','position',[0.02,0.55,0.26,0.14],'parent',hf,...
    'ForegroundColor','w','backgroundcolor',[0.3 0.3 0.3],...
    'fontweight','bold');
hsc=uicontrol('style','text','string','0','fontsize',24,...
    'units','normal','position',[0.02,0.4,0.26,0.14],'parent',hf,...
    'ForegroundColor','w','backgroundcolor',[0.3 0.3 0.3],...
    'fontweight','bold');
hbt=uicontrol('style','pushbutton','string','Restart','fontsize',18,...
    'units','normal','position',[0.02,0.16,0.26,0.14],'parent',hf,...
    'fontweight','bold','callback',@restart);
color=[...
    1 1 0;
    1 0 1;
    0 1 1;
    1 0 0;
    0 1 0;
    0 0 1;
    0.7 0.3 0;
    ];
h1=annotation('ellipse',[0.04,0.84,0.06,0.08],'facecolor','k');
h2=annotation('ellipse',[0.12,0.84,0.06,0.08],'facecolor','k');
h3=annotation('ellipse',[0.2,0.84,0.06,0.08],'facecolor','k');
set(ha,'buttondownfcn',@select2)
initialize
function initialize()
global a h m1 n1 m2 n2 t h1 h2 h3 color score hsc ss
a=zeros(9);
h=zeros(9)*NaN;
m1=[];
n1=[];
m2=[];
n2=[];
score=0;
ss=0;
k=rs(1:81,5);
t=ceil(rand(1,5)*7);
a(k)=t;
[m,n] = ind2sub([9,9],k);
y=9.5-m;
x=n-0.5;
for p=1:5
    h(k(p))=line(x(p),y(p),'marker','o','markersize',24,...
        'markerfacecolor',color(t(p),:),'markeredgecolor','none',...
        'buttondownfcn',@select1);
end
t=ceil(rand(1,3)*7);
set(h1,'facecolor',color(t(1),:))
set(h2,'facecolor',color(t(2),:))
set(h3,'facecolor',color(t(3),:))
function [k]=rs(s,n);
for m=1:n
    t=ceil(rand*length(s));
    k(m)=s(t);
    s(t)=[];
end
function select1(src,eventdata)
global a h m1 n1
n1=ceil(get(src,'xdata'));
m1=ceil(9-get(src,'ydata'));
set(h(~isnan(h)),'markeredgecolor','none')
set(src,'markeredgecolor','w')
function select2(src,eventdata)
global a h m1 n1 m2 n2 t h1 h2 h3 color score hsc ha ss
if isempty(m1) || isempty(n1)
    return
end
cp=get(src,'currentpoint');
n2=ceil(cp(1,1));
m2=ceil(9-cp(1,2));
if a(m2,n2)
    return
end
b=~a;
b(m1,n1)=1;
b=bwlabel(b,4);
if b(m1,n1)~=b(m2,n2)
    return
end
a(m2,n2)=a(m1,n1);
a(m1,n1)=0;
h(m2,n2)=h(m1,n1);
h(m1,n1)=NaN;
set(h(m2,n2),'xdata',n2-0.5,'ydata',9.5-m2,'markeredgecolor','none')
m1=[];
n1=[];
judgement;
if sum(sum(~a))<3
    hgo=text(1,4.5,'Game Over','fontsize',36,'fontweight',...
        'bold','parent',src);
    pause(3)
    delete(hgo);
    delete(h(~isnan(h)))
    set(hsc,'string','0')
    initialize;
    return
end
if ~ss
    new;
end
function judgement
global a h m1 n1 m2 n2 t h1 h2 h3 color score hsc ha ss
b=logical(zeros(9,9));
ss=0;
left=0;
right=0;
up=0;
down=0;
lu=0;
rd=0;
ld=0;
ru=0;
while n2-left-1>0 && a(m2,n2-left-1)==a(m2,n2)
    left=left+1;
end
while n2+right+1<10 && a(m2,n2+right+1)==a(m2,n2)
    right=right+1;
end
while m2-up-1>0 && a(m2-up-1,n2)==a(m2,n2)
    up=up+1;
end
while m2+down+1<10 && a(m2+down+1,n2)==a(m2,n2)
    down=down+1;
end
while n2-lu-1>0 && m2-lu-1>0 && a(m2-lu-1,n2-lu-1)==a(m2,n2)
    lu=lu+1;
end
while n2+rd+1<10 && m2+rd+1<10 && a(m2+rd+1,n2+rd+1)==a(m2,n2)
    rd=rd+1;
end
while n2-ld-1>0 && m2+ld+1<10 && a(m2+ld+1,n2-ld-1)==a(m2,n2)
    ld=ld+1;
end
while n2+ru+1<10 && m2-ru-1>0 && a(m2-ru-1,n2+ru+1)==a(m2,n2)
    ru=ru+1;
end
if left+right+1>=5
    b(m2,n2-left:n2+right)=1;
end
if up+down+1>=5
    b(m2-up:m2+down,n2)=1;
end
if lu+rd+1>=5
    ind=sub2ind([9,9],m2-lu:m2+rd,n2-lu:n2+rd);
    b(ind)=1;
end
if ld+ru+1>=5
    ind=sub2ind([9,9],m2+ld:-1:m2-ru,n2-ld:n2+ru);
    b(ind)=1;
end
if sum(sum(b))
    a(b)=0;
    delete(h(b));
    h(b)=NaN;
    score=score+sum(sum(b));
    set(hsc,'string',num2str(score))
    ss=1;
end
function new
global a h m1 n1 m2 n2 t h1 h2 h3 color score hsc ha
k=rs(find(~a),3);
a(k)=t;
[mt,nt] = ind2sub([9,9],k);
y=9.5-mt;
x=nt-0.5;
for p=1:3
    h(k(p))=line(x(p),y(p),'marker','o','markersize',24,...
        'markerfacecolor',color(t(p),:),'markeredgecolor','none',...
        'buttondownfcn',@select1);
end
for p=1:3
    m2=mt(p);
    n2=nt(p);
    judgement;
end
if sum(sum(~a))==0
    hgo=text(1,4.5,'Game Over','fontsize',36,'fontweight',...
        'bold','parent',ha);
    pause(3)
    delete(hgo);
    delete(h(~isnan(h)))
    set(hsc,'string','0')
    initialize;
    return
end
t=ceil(rand(1,3)*7);
set(h1,'facecolor',color(t(1),:))
set(h2,'facecolor',color(t(2),:))
set(h3,'facecolor',color(t(3),:))
function restart(src,eventdata)
global a h m1 n1 m2 n2 t h1 h2 h3 color score hsc ha ss
delete(h(~isnan(h)))
set(hsc,'string','0')
initialize;