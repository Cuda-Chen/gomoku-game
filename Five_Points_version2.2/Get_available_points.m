function  available_points = Get_available_points
available_points = zeros(225,2);
k = 1;
for i = 7:9
    for j = 7:9
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end
for i = 7:9
    for j = [3:6 10:12]
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end


for i = 3:6
    for j = 7:9
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end
for i = 3:6
    for j = [3:6 10:12]
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end


for i = 10:12
    for j = 7:9
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end
for i = 10:12
    for j = [3:6 10:12]
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end

for i = [1:2 13:15]
    for j = 7:9
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end
for i = [1:2 13:15]
    for j = [3:6 10:12]
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end
for i = 1:15
    for j = [1:2 13:15]
        available_points(k,:) = [i,j];
        k = k + 1;
    end
end


save available_points.mat available_points