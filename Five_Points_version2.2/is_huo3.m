function [flag Type] = is_huo3(Step_Set1,Step_Set2)

Type.East_west.name = 'East_aaaa';
Type.East_west.start_point = [0 0];
Type.East_west.end_point = [0 0];

Type.North_south.name = 'North_aaaaa';
Type.North_south.start_point = [0 0];
Type.North_south.end_point = [0 0];

Type.North_east.name = 'North_aaaa';
Type.North_east.start_point = [0 0];
Type.North_east.end_point = [0 0];

Type.North_west.name = 'North_aaaa';
Type.North_west.start_point = [0 0];
Type.North_west.end_point = [0 0];

Step_Setx1 = Step_Set1(:,1);
Step_Sety1 = Step_Set1(:,2);
Step_Set1 = [Step_Setx1( Step_Setx1 > 0 ) Step_Sety1( Step_Sety1 > 0 )];

Step_Setx2 = Step_Set2(:,1);
Step_Sety2 = Step_Set2(:,2);
Step_Set2 = [Step_Setx2( Step_Setx2 > 0 ) Step_Sety2( Step_Sety2 > 0 )];

flag = 0;
%% 东西方向三连珠（活）

for i = 1:15
    flag_temp = 0;
    temp = find(Step_Set1(:,2) == i);
    [adjacent adjacent_part] = is_adjacent(Step_Set1(temp,1),3);
    if  adjacent  %(length(temp) == 3) && 
        flag_temp = 1;
        Type.East_west.start_point = [min(adjacent_part) i];
        Type.East_west.end_point = [max(adjacent_part) i];
    end
    
    if flag_temp == 1
        sp = Type.East_west.start_point;
        ep = Type.East_west.end_point;
        if (  ~is_existed([sp(1) - 1  sp(2)],Step_Set2) && ~is_existed([ep(1) + 1  ep(2)],Step_Set2) && ~is_existed([ep(1) + 2  ep(2)],Step_Set2) ) || ...
           (  ~is_existed([ep(1) + 1  ep(2)],Step_Set2) && ~is_existed([sp(1) - 1  sp(2)],Step_Set2) && ~is_existed([sp(1) - 2  sp(2)],Step_Set2) )
%         if (  ~is_existed([sp(1) - 1  sp(2)],Step_Set2) && ~is_existed([ep(1) + 1  ep(2)],Step_Set2) && ~is_existed([ep(1) + 2  ep(2)],Step_Set2)  && ~is_existed([sp(1) - 2  sp(2)],Step_Set2) )% || ...
%            (  ~is_existed([ep(1) + 1  ep(2)],Step_Set2) &&
%            ~is_existed([sp(1) - 1  sp(2)],Step_Set2) && ~is_existed([sp(1) - 2  sp(2)],Step_Set2) )
            flag = 1;
            Type.East_west.name = 'East_west';
            break;
        end
    end

end

%% 南北方向三连珠（活）


for i = 1:15
    flag_temp = 0;
    temp = find(Step_Set1(:,1) == i);
    [adjacent adjacent_part] = is_adjacent(Step_Set1(temp,2),3);
    if  adjacent
        flag_temp = 1;
        Type.North_south.start_point = [i min(adjacent_part)];
        Type.North_south.end_point = [i max(adjacent_part)];
    end
    if flag_temp == 1
        sp = Type.North_south.start_point;
        ep = Type.North_south.end_point;
        if (  ~is_existed([sp(1)  sp(2) - 1],Step_Set2) && ~is_existed([ep(1)  ep(2) + 1],Step_Set2) && ~is_existed([ep(1)  ep(2) + 2],Step_Set2) ) || ...
           (  ~is_existed([ep(1)  ep(2) + 1],Step_Set2) && ~is_existed([sp(1)  sp(2) - 1],Step_Set2) && ~is_existed([sp(1)  sp(2) - 2],Step_Set2) )
%         if (  ~is_existed([sp(1)  sp(2) - 1],Step_Set2) &&
%         ~is_existed([ep(1)  ep(2) + 1],Step_Set2) && ~is_existed([ep(1)  ep(2) + 2],Step_Set2)  && ~is_existed([sp(1)  sp(2) - 2],Step_Set2) ) %|| ...
%            (  ~is_existed([ep(1)  ep(2) + 1],Step_Set2) &&
%            ~is_existed([sp(1)  sp(2) - 1],Step_Set2) && ~is_existed([sp(1)  sp(2) - 2],Step_Set2) )
            flag = 1;
            Type.North_south.name = 'North_south';
            break;
        end
    end
end


%% 东北方向三连珠（活）


x2y = Step_Set1(:,1) - Step_Set1(:,2);
for i = 1:length(x2y)
    flag_temp = 0;
    temp = find(x2y == x2y(i));
    [adjacent1 adjacent_part1] = is_adjacent(Step_Set1(temp,1),3);
    [dim, adjacent_part2] = is_adjacent(Step_Set1(temp,2),3);
    if  adjacent1
        flag_temp = 1;
        Type.North_east.start_point = [min(adjacent_part1) min(adjacent_part2)];
        Type.North_east.end_point = [max(adjacent_part1) max(adjacent_part2)];
    end
    if flag_temp == 1
        sp = Type.North_east.start_point;
        ep = Type.North_east.end_point;
        if (  ~is_existed([sp(1) - 1  sp(2) - 1],Step_Set2) && ~is_existed([ep(1) + 1  ep(2) + 1],Step_Set2) && ~is_existed([ep(1) + 2  ep(2) + 2],Step_Set2) ) || ...
           (  ~is_existed([ep(1) + 1  ep(2) + 1],Step_Set2) && ~is_existed([sp(1) - 1  sp(2) - 1],Step_Set2) && ~is_existed([sp(1) - 2  sp(2) - 2],Step_Set2) )
%         if (  ~is_existed([sp(1) - 1  sp(2) - 1],Step_Set2) && ~is_existed([ep(1) + 1  ep(2) + 1],Step_Set2) && ~is_existed([ep(1) + 2  ep(2) + 2],Step_Set2) && ~is_existed([sp(1) - 2  sp(2) - 2],Step_Set2) ) %|| ...
%            (  ~is_existed([ep(1) + 1  ep(2) + 1],Step_Set2) &&
%            ~is_existed([sp(1) - 1  sp(2) - 1],Step_Set2) && ~is_existed([sp(1) - 2  sp(2) - 2],Step_Set2) )
            flag = 1;
            Type.North_east.name = 'North_east';
            break;
        end
    end
end

%% 西北方向三连珠（活）

x2y = Step_Set1(:,1) + Step_Set1(:,2);
for i = 1:length(x2y)
    flag_temp = 0;
    temp = find(x2y == x2y(i));
    [adjacent1 adjacent_part1] = is_adjacent(Step_Set1(temp,1),3);
    if  adjacent1
        flag_temp = 1;
        Type.North_west.start_point = [min(adjacent_part1) x2y(i) - min(adjacent_part1)];
        Type.North_west.end_point = [max(adjacent_part1) x2y(i) - max(adjacent_part1)];
    end
    if flag_temp == 1
        sp = Type.North_west.start_point;
        ep = Type.North_west.end_point;
        if (  ~is_existed([sp(1) - 1  sp(2) + 1],Step_Set2) && ~is_existed([ep(1) + 1  ep(2) - 1],Step_Set2) && ~is_existed([ep(1) + 2  ep(2) - 2],Step_Set2) ) || ...
           (  ~is_existed([ep(1) + 1  ep(2) - 1],Step_Set2) && ~is_existed([sp(1) - 1  sp(2) + 1],Step_Set2) && ~is_existed([sp(1) - 2  sp(2) + 2],Step_Set2) )
%         if (  ~is_existed([sp(1) - 1  sp(2) + 1],Step_Set2) && ~is_existed([ep(1) + 1  ep(2) - 1],Step_Set2) && ~is_existed([ep(1) + 2  ep(2) - 2],Step_Set2)  && ~is_existed([sp(1) - 2  sp(2) + 2],Step_Set2) ) %|| ...
%            (  ~is_existed([ep(1) + 1  ep(2) - 1],Step_Set2) &&
%            ~is_existed([sp(1) - 1  sp(2) + 1],Step_Set2) && ~is_existed([sp(1) - 2  sp(2) + 2],Step_Set2) )
            flag = 1;
            Type.North_west.name = 'North_west';
            break;
        end
    end
end

% Type.East_west
% 
% Type.North_south
% 
% Type.North_east
% 
% Type.North_west
