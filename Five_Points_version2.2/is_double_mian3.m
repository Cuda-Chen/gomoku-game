function [flag temp]= is_double_mian3(available_points,Step_Set1,Step_Set2)
%  ����  X O O O 
flag = 0;
flag_i = 0;
temp = [0 0];

for i = 1:size(available_points,1)
    temp_i = available_points(i,:);
    if is_mian4([Step_Set1;temp_i],Step_Set2)
        flag_i = 1;
        break;
    end
end
if flag_i == 1
    for j = 1:size(available_points,1)
        if j ~= i
            temp_j = available_points(j,:);
            if  is_mian4([Step_Set1;temp_j],Step_Set2)
                flag = 1;
                temp = temp_j;
                break;
            end
        end
    end
end