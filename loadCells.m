function cells = loadCells(fileName)

    cellImp = load(fileName);
    cellFieldNames = fieldnames(cellImp);
    cells = cellImp.(cellFieldNames{1});

end