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
    grid off;
end
