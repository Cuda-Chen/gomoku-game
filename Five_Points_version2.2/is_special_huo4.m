function flag = is_special_huo4(Current_Step,Step_Set1,Step_Set2)
%  O O _ _ O
%  O O O _ O
%  O O _ O O
flag = 0;
[flag_temp Type] = is_huo2(Step_Set1,Step_Set2);
if flag_temp == 1
    if strcmp(Type.North_east.name,'North_east')
        sp = Type.North_east.start_point;
        ep = Type.North_east.end_point;
        if ( is_existed([sp(1) - 3  sp(2) - 3],Step_Set1) && ( (sp(1) - Current_Step(1) == 2 && sp(2) - Current_Step(2) == 2) || (sp(1) - Current_Step(1) == 1 && sp(2) - Current_Step(2) == 1) ) ) || ...
           ( is_existed([ep(1) + 3  ep(2) + 3],Step_Set1) && ( (Current_Step(1) - ep(1) == 2 && Current_Step(2) - ep(2) == 2) || (Current_Step(1) - ep(1) == 1 && Current_Step(2) - ep(2) == 1) ) )
            flag = 1;
        end
    elseif strcmp(Type.North_west.name,'North_west')
        sp = Type.North_west.start_point;
        ep = Type.North_west.end_point;
        if ( is_existed([sp(1) - 3  sp(2) + 3],Step_Set1) && ( (sp(1) - Current_Step(1) == 2 && Current_Step(2) - sp(2) == 2) || (sp(1) - Current_Step(1) == 1 && Current_Step(2) - sp(2) == 1) ) ) || ...
           ( is_existed([ep(1) + 3  ep(2) - 3],Step_Set1) && ( (Current_Step(1) - ep(1) == 2 && ep(2) - Current_Step(2) == 2) || (Current_Step(1) - ep(1) == 1 && ep(2) - Current_Step(2) == 1) ) )
            flag = 1;
        end
    elseif strcmp(Type.East_west.name,'East_west')
        sp = Type.East_west.start_point;
        ep = Type.East_west.end_point;
        if ( is_existed([sp(1) - 3  sp(2)],Step_Set1) && ( (sp(1) - Current_Step(1) == 2 && sp(2) - Current_Step(2) == 0) || (sp(1) - Current_Step(1) == 1 && sp(2) - Current_Step(2) == 0) ) ) || ...
           ( is_existed([ep(1) + 3  ep(2)],Step_Set1) && ( (Current_Step(1) - ep(1) == 2 && Current_Step(2) - ep(2) == 0) || (Current_Step(1) - ep(1) == 1 && Current_Step(2) - ep(2) == 0) ) )
            flag = 1;
        end
    elseif strcmp(Type.North_south.name,'North_south')
        sp = Type.North_south.start_point;
        ep = Type.North_south.end_point;
        if ( is_existed([sp(1)  sp(2) - 3],Step_Set1) && ( (sp(1) - Current_Step(1) == 0 && sp(2) - Current_Step(2) == 2) || (sp(1) - Current_Step(1) == 0 && sp(2) - Current_Step(2) == 1) ) ) || ...
           ( is_existed([ep(1)  ep(2) + 3],Step_Set1) && ( (Current_Step(1) - ep(1) == 0 && Current_Step(2) - ep(2) == 2) || (Current_Step(1) - ep(1) == 0 && Current_Step(2) - ep(2) == 1) ) )
            flag = 1;
        end
    end
end
