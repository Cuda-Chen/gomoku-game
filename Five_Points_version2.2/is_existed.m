function flag = is_existed(Current_Step,Step_Set)
Current_Step = round(Current_Step);
Step_Set = round(Step_Set);
index_x = find(Step_Set(:,1) == Current_Step(1,1));
flag = 0;
if ~isempty(index_x)
    for i = 1:length(index_x)
        if Step_Set(index_x(i),2) == Current_Step(1,2);
            flag = 1;
            break;
        end
    end
end