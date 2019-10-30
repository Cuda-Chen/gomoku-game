function available_points = available_points_update(available_points_original,current_point)

current_point = round(current_point);
% 
% for i = 1:size(available_points_original,1)
%     if available_points_original(i,1) == current_point(1,1) && available_points_original(i,2) == current_point(1,2)
%         available_points_original(i,:) = [];
%         break;
%     end
% end
% available_points = available_points_original;

index_x = find(available_points_original(:,1) == current_point(1,1));
for i = 1:length(index_x)
    if available_points_original(index_x(i),2) == current_point(1,2);
        available_points_original(index_x(i),:) = [];
        break;
    end
end

available_points = available_points_original;