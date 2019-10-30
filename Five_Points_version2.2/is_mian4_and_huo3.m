function flag = is_mian4_and_huo3(Current_Step,Step_Set1,Step_Set2)
flag = 0;
[flag_temp3 Type3] = is_huo3([Step_Set1;Current_Step],Step_Set2);
[flag_temp4 Type4] = is_mian4([Step_Set1;Current_Step],Step_Set2);
[flag_special4 Type_special4] = is_special_mian4(Current_Step,Step_Set1,Step_Set2);
[flag_special3 Type_special3] = is_special_huo3(Current_Step,Step_Set1,Step_Set2);
% flag_temp3
% flag_temp4
% flag_special4
% flag_special3
% Type3.East_west.name
% Type3.East_west.name
% Type3.North_east.name
% Type3.North_west.name
% Type3.North_south.name
% Type4.East_west.name
% Type4.East_west.name
% Type4.North_east.name
% Type4.North_west.name
% Type4.North_south.name

while flag == 0
    if ( flag_temp4 == 1 || flag_special4 == 1 ) && ( flag_temp3 == 1 || flag_special3 == 1)
    %     flag = 1;
        if  strcmp(Type4.North_east.name,'North_east') && ...
          ( strcmp(Type3.East_west.name,'East_west') || strcmp(Type3.North_south.name,'North_south') || strcmp(Type3.North_west.name,'North_west') ) || ...
          ( strcmp(Type_special3.East_west.name,'East_west') || strcmp(Type_special3.North_south.name,'North_south') || strcmp(Type_special3.North_west.name,'North_west') )
            flag = 1;
            break;
        end
        if  strcmp(Type4.East_west.name,'East_west') && ...
          ( strcmp(Type3.North_east.name,'North_east') || strcmp(Type3.North_south.name,'North_south') || strcmp(Type3.North_west.name,'North_west') ) || ...
          ( strcmp(Type_special3.North_east.name,'North_east') || strcmp(Type_special3.North_south.name,'North_south') || strcmp(Type_special3.North_west.name,'North_west') )
            flag = 1;
            break;
        end
        if  strcmp(Type4.North_south.name,'North_south') && ...
          ( strcmp(Type3.East_west.name,'East_west') || strcmp(Type3.North_east.name,'North_east') || strcmp(Type3.North_west.name,'North_west') ) || ...
          ( strcmp(Type_special3.East_west.name,'East_west') || strcmp(Type_special3.North_east.name,'North_east') || strcmp(Type_special3.North_west.name,'North_west') )
            flag = 1;
            break;
        end
        if  strcmp(Type4.North_west.name,'North_west') && ...
          ( strcmp(Type3.East_west.name,'East_west') || strcmp(Type3.North_south.name,'North_south') || strcmp(Type3.North_east.name,'North_east') ) || ...
          ( strcmp(Type_special3.East_west.name,'East_west') || strcmp(Type_special3.North_south.name,'North_south') || strcmp(Type_special3.North_east.name,'North_east') )
            flag = 1;
            break;
        end    % ************************************************************
        if  strcmp(Type_special4.North_east.name,'North_east') && ...
          ( strcmp(Type3.East_west.name,'East_west') || strcmp(Type3.North_south.name,'North_south') || strcmp(Type3.North_west.name,'North_west') ) || ...
          ( strcmp(Type_special3.East_west.name,'East_west') || strcmp(Type_special3.North_south.name,'North_south') || strcmp(Type_special3.North_west.name,'North_west') )
            flag = 1;
            break;
        end
        if  strcmp(Type_special4.East_west.name,'East_west') && ...
          ( strcmp(Type3.North_east.name,'North_east') || strcmp(Type3.North_south.name,'North_south') || strcmp(Type3.North_west.name,'North_west') ) || ...
          ( strcmp(Type_special3.North_east.name,'North_east') || strcmp(Type_special3.North_south.name,'North_south') || strcmp(Type_special3.North_west.name,'North_west') )
            flag = 1;
            break;
        end
        if  strcmp(Type_special4.North_south.name,'North_south') && ...
          ( strcmp(Type3.East_west.name,'East_west') || strcmp(Type3.North_east.name,'North_east') || strcmp(Type3.North_west.name,'North_west') ) || ...
          ( strcmp(Type_special3.East_west.name,'East_west') || strcmp(Type_special3.North_east.name,'North_east') || strcmp(Type_special3.North_west.name,'North_west') )
            flag = 1;
            break;
        end
        if  strcmp(Type_special4.North_west.name,'North_west') && ...
          ( strcmp(Type3.East_west.name,'East_west') || strcmp(Type3.North_south.name,'North_south') || strcmp(Type3.North_east.name,'North_east') ) || ...
          ( strcmp(Type_special3.East_west.name,'East_west') || strcmp(Type_special3.North_south.name,'North_south') || strcmp(Type_special3.North_east.name,'North_east') )
            flag = 1;
            break;
        end 
    end
    if flag_temp4 == 1
        if strcmp(Type4.North_east.name,'North_east') && strcmp(Type4.North_west.name,'North_west')
            flag = 1;
            break;
        end
        if strcmp(Type4.North_east.name,'North_east') && strcmp(Type4.East_west.name,'East_west')
            flag = 1;
            break;
        end
        if strcmp(Type4.North_east.name,'North_east') && strcmp(Type4.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if strcmp(Type4.North_west.name,'North_west') && strcmp(Type4.East_west.name,'East_west')
            flag = 1;
            break;
        end
        if strcmp(Type4.North_west.name,'North_west') && strcmp(Type4.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if strcmp(Type4.East_west.name,'East_west') && strcmp(Type4.North_south.name,'North_south')
            flag = 1;
            break;
        end

    end
    if flag_special4 == 1
        if strcmp(Type_special4.North_east.name,'North_east') && strcmp(Type_special4.North_west.name,'North_west')
            flag = 1;
            break;
        end
        if strcmp(Type_special4.North_east.name,'North_east') && strcmp(Type_special4.East_west.name,'East_west')
            flag = 1;
            break;
        end
        if strcmp(Type_special4.North_east.name,'North_east') && strcmp(Type_special4.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if strcmp(Type_special4.North_west.name,'North_west') && strcmp(Type_special4.East_west.name,'East_west')
            flag = 1;
            break;
        end
        if strcmp(Type_special4.North_west.name,'North_west') && strcmp(Type_special4.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if strcmp(Type_special4.East_west.name,'East_west') && strcmp(Type_special4.North_south.name,'North_south')
            flag = 1;
            break;
        end
    end
    break;
end
