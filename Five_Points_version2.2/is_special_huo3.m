function [flag Type] = is_special_huo3(Current_Step,Step_Set1,Step_Set2)
% O O _ O
% O _ O O
flag = 0;
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

[flag_temp Type_temp] = is_huo2(Step_Set1,Step_Set2);
% Type_temp.North_east.name
% Type_temp.North_west.name
% Type_temp.East_west.name
% Type_temp.North_south.name

if flag_temp == 1
    if strcmp(Type_temp.North_east.name,'North_east')
        sp = Type_temp.North_east.start_point;
        ep = Type_temp.North_east.end_point;
        if ( sp(1) - Current_Step(1) == 2 && sp(2) - Current_Step(2) == 2 ) || ( Current_Step(1) - ep(1) == 2 && Current_Step(2) - ep(2) == 2 ) || ...
           ( is_existed([sp(1) - 2  sp(2) - 2],Step_Set1) && ~is_existed([sp(1) - 3  sp(2) - 3],Step_Set2)) || ...
           ( is_existed([ep(1) + 2  ep(2) + 2],Step_Set1) && ~is_existed([ep(1) + 3  ep(2) + 3],Step_Set2))
            flag = 1;
            Type.North_east.name = Type_temp.North_east.name;
        end
    end
    if strcmp(Type_temp.North_west.name,'North_west')
        sp = Type_temp.North_west.start_point;
        ep = Type_temp.North_west.end_point;
        if ( sp(1) - Current_Step(1) == 2 && Current_Step(2) - sp(2) == 2 ) || ( Current_Step(1) - ep(1) == 2 && ep(2) - Current_Step(2) == 2 ) || ...
           ( is_existed([sp(1) - 2  sp(2) + 2],Step_Set1) && ~is_existed([sp(1) - 3  sp(2) + 3],Step_Set2)) || ...
           ( is_existed([ep(1) + 2  ep(2) - 2],Step_Set1) && ~is_existed([ep(1) + 3  ep(2) - 3],Step_Set2))
            flag = 1;
            Type.North_west.name = Type_temp.North_west.name;
        end
    end
    if strcmp(Type_temp.East_west.name,'East_west')
        sp = Type_temp.East_west.start_point;
        ep = Type_temp.East_west.end_point;
        if ( sp(1) - Current_Step(1) == 2 && sp(2) - Current_Step(2) == 0 ) || ( Current_Step(1) - ep(1) == 2 && Current_Step(2) - ep(2) == 0 ) || ...
           ( is_existed([sp(1) - 2  sp(2)],Step_Set1) && ~is_existed([sp(1) - 3  sp(2)],Step_Set2)) || ...
           ( is_existed([ep(1) + 2  ep(2)],Step_Set1) && ~is_existed([ep(1) + 3  ep(2)],Step_Set2))
            flag = 1;
            Type.East_west.name = Type_temp.East_west.name;
        end
    end
    if strcmp(Type_temp.North_south.name,'North_south')
        sp = Type_temp.North_south.start_point;
        ep = Type_temp.North_south.end_point;
        if ( sp(1) - Current_Step(1) == 0 && sp(2) - Current_Step(2) == 2 ) || ( Current_Step(1) - ep(1) == 0 && Current_Step(2) - ep(2) == 2 ) || ...
           ( is_existed([sp(1)  sp(2) - 2],Step_Set1) && ~is_existed([sp(1)  sp(2) - 3],Step_Set2)) || ...
           ( is_existed([ep(1)  ep(2) + 2],Step_Set1) && ~is_existed([ep(1)  ep(2) + 3],Step_Set2))
            flag = 1;
            Type.North_south.name = Type_temp.North_south.name;
        end
    end
end

% 加了当前这个点之后 才形成活2的
[flag_temp1 Type_temp1] = is_huo2([Step_Set1;Current_Step],Step_Set2);
if flag_temp1 == 1
    if strcmp(Type_temp1.North_east.name,'North_east')
        sp = Type_temp1.North_east.start_point;
        ep = Type_temp1.North_east.end_point;
        if ( (sp(1) == Current_Step(1) && sp(2) == Current_Step(2)) || (ep(1) == Current_Step(1) && ep(2) == Current_Step(2)) ) && ...
            ( (is_existed([sp(1) - 2  sp(2) - 2],Step_Set1) && ~is_existed([sp(1) - 3  sp(2) - 3],Step_Set2) && ~is_existed([sp(1) - 4  sp(2) - 4],Step_Set2)) || ...
              (is_existed([ep(1) + 2  ep(2) + 2],Step_Set1) && ~is_existed([ep(1) + 3  ep(2) + 3],Step_Set2) && ~is_existed([ep(1) + 4  ep(2) + 4],Step_Set2)))
            flag = 1;
            Type.North_east.name = Type_temp1.North_east.name;
        end
    end
    if strcmp(Type_temp1.North_west.name,'North_west')
        sp = Type_temp1.North_west.start_point;
        ep = Type_temp1.North_west.end_point;
        if  ( (sp(1) == Current_Step(1) && sp(2) == Current_Step(2)) || (ep(1) == Current_Step(1) && ep(2) == Current_Step(2)) ) && ...
            ( (is_existed([sp(1) - 2  sp(2) + 2],Step_Set1) && ~is_existed([sp(1) - 3  sp(2) + 3],Step_Set2)  && ~is_existed([sp(1) - 4  sp(2) + 4],Step_Set2)) || ...
              (is_existed([ep(1) + 2  ep(2) - 2],Step_Set1) && ~is_existed([ep(1) + 3  ep(2) - 3],Step_Set2)  && ~is_existed([ep(1) + 4  ep(2) - 4],Step_Set2)))
            flag = 1;
            Type.North_west.name = Type_temp1.North_west.name;
        end
    end
    if strcmp(Type_temp1.East_west.name,'East_west')
        sp = Type_temp1.East_west.start_point;
        ep = Type_temp1.East_west.end_point;
        if  ( (sp(1) == Current_Step(1) && sp(2) == Current_Step(2)) || (ep(1) == Current_Step(1) && ep(2) == Current_Step(2)) ) && ...
            ( (is_existed([sp(1) - 2  sp(2)],Step_Set1) && ~is_existed([sp(1) - 3  sp(2)],Step_Set2) && ~is_existed([sp(1) - 4  sp(2)],Step_Set2)) || ...
              (is_existed([ep(1) + 2  ep(2)],Step_Set1) && ~is_existed([ep(1) + 3  ep(2)],Step_Set2) && ~is_existed([ep(1) + 4  ep(2)],Step_Set2)))
            flag = 1;
            Type.East_west.name = Type_temp1.East_west.name;
        end
    end
    if strcmp(Type_temp1.North_south.name,'North_south')
        sp = Type_temp1.North_south.start_point;
        ep = Type_temp1.North_south.end_point;
        if  ( (sp(1) == Current_Step(1) && sp(2) == Current_Step(2)) || (ep(1) == Current_Step(1) && ep(2) == Current_Step(2)) ) && ...
            ( (is_existed([ep(1)  ep(2) + 2],Step_Set1) && ~is_existed([ep(1)  ep(2) + 3],Step_Set2) && ~is_existed([ep(1)  ep(2) + 4],Step_Set2)) || ...
              (is_existed([sp(1)  sp(2) - 2],Step_Set1) && ~is_existed([sp(1)  sp(2) - 3],Step_Set2) && ~is_existed([sp(1)  sp(2) - 4],Step_Set2)))
            flag = 1;
            Type.North_south.name = Type_temp1.North_south.name;
        end
    end
end