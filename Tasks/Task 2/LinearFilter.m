function Out = LinearFilter(I, Filter, Postproc)
%LINEARFILTER applies any linear filter with any postprocessing on input
%image.

%I: input image
%Filter: any filter matrix
%Postproc: string contains ‘none’, ‘cutoff’, ‘absolute’

    img = double(I);
    [rowsI, colsI, ~] = size(img);
    [rowsF, colsF, ~] = size(Filter);
    
    padSizeR = floor(rowsF / 2);
    padSizeC = floor(colsF / 2);
    img = padarray(img, [padSizeR padSizeC], 'both');
    
    Out = zeros(rowsI, colsI);
    for r = 1:rowsI
        rI = r + padSizeR;
        for c = 1:colsI
            cI = c + padSizeC;
            tmp = img(rI-padSizeR:rI+padSizeR, cI-padSizeC:cI+padSizeC) .* Filter;
            Out(r, c) = sum(tmp(:));
        end
    end
    
    if strcmp(Postproc, 'cutoff') == 1
        Out = uint8(Out);
    elseif strcmp(Postproc, 'absolute') == 1
        Out = abs(Out);
    end   
end

