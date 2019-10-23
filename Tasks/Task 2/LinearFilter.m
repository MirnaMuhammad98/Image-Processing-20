function Out = LinearFilter(I, Filter, Postproc)
%LINEARFILTER applies any linear filter with any postprocessing on input
%image.

%I: input image
%Filter: any filter matrix
%Postproc: string contains ‘none’, ‘cutoff’, ‘absolute’

    img = double(I);
    [rowsI, colsI, ~] = size(img);
    [rowsF, ~, ~] = size(Filter);
    
    padSize = floor(rowsF / 2);
    img = padarray(img, [padSize padSize], 'both');
    
    Out = zeros(rowsI, colsI);
    for r = 1:rowsI
        rI = r + padSize;
        for c = 1:colsI
            cI = c + padSize;
            tmp = img(rI-padSize:rI+padSize, cI-padSize:cI+padSize) .* Filter;
            Out(r, c) = sum(tmp(:));
        end
    end
    
    if strcmp(Postproc, 'cutoff') == 1
        Out = uint8(Out);
    elseif strcmp(Postproc, 'absolute') == 1
        Out = abs(Out);
    end   
end

