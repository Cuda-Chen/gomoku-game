function [flag adjacent_part] = is_adjacent(sequence,len)
flag = 0;
adjacent_part = 0;
sequence = sort(sequence);

for i = 1:length(sequence) - len + 1
    if sequence(i + len - 1) == sequence(i) + len - 1
        flag = 1;
        adjacent_part = sequence(i:i + len - 1);
        break;
    end
end