function w = winLose(matrix, x, y, color)
x1 = x;
y1 = y;
counter = ones(4, 1);

%左右
for i = 1:5,
    if (x1+i) > 15,
        break;
    end
    if matrix(x1+i, y) == matrix(x, y),
        counter(1, 1) = counter(1, 1) + 1;
    else
        break;
    end
end

for i = 1:5,
    if (x1-i) < 1,
        break;
    end
    if matrix(x1-i, y) == matrix(x, y),
        counter(1, 1) = counter(1, 1) + 1;
    else 
        break;
    end
end

% to check whether player is win
if counter(1, 1) > 4
    disp('win');
    if color == 1,
        h = msgbox('red wins');
    elseif color == 0,
        h = msgbox('blue wins');
    end
    
    uiwait(h);
    playAgain;
    %if playAgain.h == 'exit'
    %    close
    %end
end

%上下
for i = 1:5,
    if (y1+i) > 15,
        break;
    end
    if matrix(x1, y1+i) == matrix(x, y),
        counter(2, 1) = counter(2, 1) + 1;
    else
        break;
    end
end


for i = 1:5,
    if (y1-i) < 1,
        break;
    end
    if matrix(x1, y1-i) == matrix(x, y),
        counter(2, 1) = counter(2, 1) + 1;
    else 
        break;
    end
end

% to check whether player is win
if counter(2, 1) > 4,
    disp('win');
    if color == 1,
        h = msgbox('red wins');
    elseif color == 0,
        h = msgbox('blue wins');
    end
    
    uiwait(h),
    playAgain;
    %if playAgain.h == 'exit'
     %   close
    %end
end

%左上右下
for i = 1:5,
    if ((x1+i) > 15) || ((y1-i) < 1),
        break;
    end
    if matrix(x1+i, y1-i) == matrix(x, y),
        counter(3, 1) = counter(3, 1) + 1;
    else
        break;
    end
end

for i = 1:5,
    if ((x1-i) < 1) || ((y1+i) > 15),
        break;
    end
    if matrix(x1-i, y1+i) == matrix(x, y),
        counter(3, 1) = counter(3, 1) + 1;
    else
        break;
    end
end

% to check whether player is win
if counter(3, 1) > 4,
    disp('win');
    if color == 1,
        h = msgbox('red wins');
    elseif color == 0,
        h = msgbox('blue wins');
    end
    
    uiwait(h);
    playAgain;
    %if playAgain.h == 'exit'
     %   close
    %end
end

%左下右上
for i = 1:5,
    if ((x1+i) > 15) || ((y1+i) > 15),
        break;
    end
    if matrix(x1+i, y1+i) == matrix(x, y),
        counter(4, 1) = counter(4, 1) + 1;
    else 
        break;
    end
end

for i = 1:5,
    if ((x1-i) < 1) || ((y1-i) < 1),
        break;
    end
    if matrix(x1-i, y1-i) == matrix(x, y),
        counter(4, 1) = counter(4, 1) + 1;
    else
        break;
    end
end

% to check whether player is win
if counter(4, 1) > 4,
    disp('win');
    if color == 1,
        h = msgbox('red wins');
    elseif color == 0,
        h = msgbox('blue wins');
    end
    
    uiwait(h)
    playAgain;
    %if playAgain == 'exit'
     %   close
    %end
end

end