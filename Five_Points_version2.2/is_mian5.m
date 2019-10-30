function flag = is_mian5(available_points,Step_Set1,Step_Set2)

%  X O _ O O O
%  X O O _ O O
%  X O O O _ O
    
flag = 0;
% temp = [0 0];
if ~is_mian4(Step_Set1,Step_Set2) && size(available_points,1) <= 210
    for index = 1:size(available_points,1)
        temp_index = available_points(index,:);
        if is_win([Step_Set1;temp_index])
            flag = 1;
%             temp = temp_index;
            break;
        end
    end
end
