%Return the complexity of a bitplane
%Input: NxN Matrix
function complexity = get_complexity(BP)
    [rows,columns] = size(BP);
    
    %Max. possible changes in the image
    if (rows == 1)
        max_pos_changes = columns - 1;
    elseif (columns == 1)
        max_pos_changes = rows - 1;
    else
        max_pos_changes = (rows-1)*(columns-1);
    end

    
    %Changes on rows
    %In a 3x3Matrix:
    % 0 0 0 -> 0 changes
    % 0 1 0 -> 2 changes
    % 0 1 1 -> 1 changes
    rows_changes = 0;
    for j=2:columns
        rows_changes = rows_changes + sum((BP(:,j-1) ~= BP(:,j)));
    end
    
    %Changes on column 
    %In a 3x3Matrix:
    % 0 0 0 
    % 0 1 0
    % 0 1 1
    % 
    % 0 1 1 changes

    columns_changes = 0;
    for i=2:rows-1
        columns_changes = columns_changes + sum((BP(i-1,:) ~= BP(i,:)));
    end
    
    total_changes = rows_changes + columns_changes;
    if (max_pos_changes > 0)
        complexity = total_changes/max_pos_changes;
    end
end