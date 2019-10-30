function flag = is_double_huo3(Current_Step,Step_Set1,Step_Set2)
flag = 0;
[flag_temp1 Type_temp1]= is_special_huo3(Current_Step,Step_Set1,Step_Set2);
[flag_temp Type_temp] = is_huo3([Step_Set1;Current_Step],Step_Set2);
while flag == 0
    if flag_temp == 1
        if strcmp(Type_temp.North_east.name,'North_east') && strcmp(Type_temp.North_west.name,'North_west')
            flag = 1;
            break;
        end
        if strcmp(Type_temp.North_east.name,'North_east') && strcmp(Type_temp.East_west.name,'East_west')
            flag = 1;
            break;
        end
        if strcmp(Type_temp.North_east.name,'North_east') && strcmp(Type_temp.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if strcmp(Type_temp.North_west.name,'North_west') && strcmp(Type_temp.East_west.name,'East_west')
            flag = 1;
            break;
        end
        if strcmp(Type_temp.North_west.name,'North_west') && strcmp(Type_temp.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if strcmp(Type_temp.East_west.name,'East_west') && strcmp(Type_temp.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if flag_temp1 == 1
            flag =1;
            break;
        end
    end
    if flag_temp1 == 1
        if strcmp(Type_temp1.North_east.name,'North_east') && strcmp(Type_temp1.North_west.name,'North_west')
            flag = 1;
            break;
        end
        if strcmp(Type_temp1.North_east.name,'North_east') && strcmp(Type_temp1.East_west.name,'East_west')
            flag = 1;
            break;
        end
        if strcmp(Type_temp1.North_east.name,'North_east') && strcmp(Type_temp1.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if strcmp(Type_temp1.North_west.name,'North_west') && strcmp(Type_temp1.East_west.name,'East_west')
            flag = 1;
            break;
        end
        if strcmp(Type_temp1.North_west.name,'North_west') && strcmp(Type_temp1.North_south.name,'North_south')
            flag = 1;
            break;
        end
        if strcmp(Type_temp1.East_west.name,'East_west') && strcmp(Type_temp1.North_south.name,'North_south')
            flag = 1;
            break;
        end
    end
    break;
end