function flag = is_win(Step_Set)


Step_Setx = Step_Set(:,1);
Step_Sety = Step_Set(:,2);
Step_Set = [Step_Setx( Step_Setx > 0 ) Step_Sety( Step_Sety > 0 )];

flag = 0;
%% 东西方向五连珠

for i = 1:15
    temp = find(Step_Set(:,2) == i);
    [adjacent,dim] = is_adjacent(Step_Set(temp,1),5);
    if (length(temp) >= 5) && adjacent
        flag = 1;
        break;
    end
end

%% 南北方向五连珠


for i = 1:15
    temp = find(Step_Set(:,1) == i);
    [adjacent,dim] = is_adjacent(Step_Set(temp,2),5);
    if (length(temp) >= 5) && adjacent
        flag = 1;
        break;
    end
end

%% 东北方向五连珠

x2y = Step_Set(:,1) - Step_Set(:,2);
for i = 1:length(x2y)
    temp = find(x2y == x2y(i));
    [adjacent,dim] = is_adjacent(Step_Set(temp,1),5);
    if length(temp) >= 5 && adjacent
        flag = 1;
        break;
    end
end

%% 西北方向五连珠

x2y = Step_Set(:,1) + Step_Set(:,2);
for i = 1:length(x2y)
    temp = find(x2y == x2y(i));
    [adjacent,dim] = is_adjacent(Step_Set(temp,1),5);
    if length(temp) >= 5 && adjacent
        flag = 1;
        break;
    end
end

% Type.East_west
% 
% Type.North_south
% 
% Type.North_east
% 
% Type.North_west

