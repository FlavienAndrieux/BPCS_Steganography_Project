function complexity = Get_Complexity(bitplane)
    [rows,columns] = size(bitplane);
    % Max. possible changes in the bitplane
    if (rows == 1)
        maxPosChanges = columns - 1;
    elseif (columns == 1)
        maxPosChanges = rows - 1;
    else
      maxPosChanges = (rows-1)*columns+rows*(columns-1);
    end

    rowsChanges = 0;
    for i= 1:rows
        for j= 2:columns
            rowsChanges = rowsChanges + sum((bitplane(i,j-1) ~= bitplane(i,j)));
        end
    end

    columnsChanges = 0;
    for j= 1:columns
        for i= 2:rows
            columnsChanges = columnsChanges + sum((bitplane(i-1,j) ~= bitplane(i,j)));
        end
    end
    % Total changes and complexity
    totalChanges = rowsChanges + columnsChanges;
    if (maxPosChanges > 0)
         % This type of complexity is called alpha
         alpha = totalChanges/maxPosChanges;
    end

    complexity = alpha;
end
