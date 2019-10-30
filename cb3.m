% 根據第三個UI控制物件來決定使用的色盤矩陣。
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
