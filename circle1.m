function h=circle1(r,x0,y0,Nb,C)
% function h=circle1(r,x0,y0,Nb,C)
% Adding circles to the current plot
% Variables:
%    r:radi of circle, a scalar or row matrix.
%    x0,y0: Centers of circles, a scalar or row matrix
%    C:line colors, a string ('r','b'...),
%           or RGB values in column
%    Nb:No. of drawing points, a scalar or 
%           row matrix(default=300)
%           the size of Nb must be one 
%           or equal to the size of r.
%    h:handles to the circles
% Rules:
%  1. r=a matrix, (x0,y0)=a scalar:Multiple 
%     co-centered circles
%  2. r=a scalar, (x0,y0)=row matrix: circle with
%     r at each center
%  3. r,(x0,y0)=same length row matrix: circle 
%     with coresponding r at cooresponding center
%  4. r,(x0,y0)=different-length row matrix: Mutiple 
%         circles with different r at each center.
% Examples: (execute the commands "clf;" first)
%% Example 0:> circle1
%% Example 1
%  circle1([1 2 3],[2 3 5],[1 2 1],20);
%
%% Example 2
% the=linspace(0,pi,200);
% r=cos(5*the);
% circle1(0.1,r.*sin(the),r.*cos(the),20,hsv(40));
%
%% Example 3
% [x,y]=meshgrid(1:10,1:10);
% circle1([0.5,0.3,0.1],x,y,20,['r';'y']);
%
%% Example 4
% circle1(1:10,0,0,3:12,[]);
%
%% Example 5
% circle1((1:10),[0,0,20,20],[0,20,20,0]);
%
% rewritten by Din-sue Fon. BIME, NTU. Date:Nov 18,2004.
% Check the number of input arguments
axis equal;
if nargin <5,C=get(gca,'colororder');end
if nargin <4,Nb=300;end
if nargin <3,y0=0;end
if nargin <2,x0=0;end
if nargin <1,r=1;end
% Change matrices into row-wise ones
x0=x0(:);y0=y0(:);r=r(:);Nb=Nb(:);nx=length(x0);
if length(y0)>nx&nx==1,x0=ones(length(y0),1)*x0;end;
if nx>length(y0)&length(y0)==1,y0=ones(nx,1)*y0;end;
nr=length(r);nx=length(x0);nnb=length(Nb);

if length(y0)~=nx,
error('The lengths of x0 and y0 must be identical');
return;
end;
% plotting
for k=1:nx,
 if nx==nr,
    coords=circle(r(k),x0(k),y0(k),Nb(rem(k-1,nnb)+1)+1);
    h(k)=line(coords(1,:),coords(2,:));
    set(h(k),'color',C(rem(k-1,size(C,1))+1,:));
 else
     for m=1:nr
         coords=circle(r(m),x0(k),y0(k),...
            Nb(rem(m-1,nnb)+1)+1);
         h(k,m)=line(coords(1,:),coords(2,:));
         set(h(k,m),'color',C(rem(k*m-1,size(C,1))+1,:));
     end
 end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [coords] = circle(r,x0,y0,nn)
% function [coords] = circle(r,x0,y0,nn)
% This function draws a circle in a radius r,
%    at the center (x0,y0)
% The inputs:
%   r    = radius of circle
%  x0, y0= coordinates of the circular center
%  nn    = number of drawing points
%  coords(nn,1-2)= vectors to store the coordinates
%  Example: circle(10,0,0,10)
jj=0:2*pi/nn:2*pi;
coords=[x0+r*cos(jj);y0+r*sin(jj)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%