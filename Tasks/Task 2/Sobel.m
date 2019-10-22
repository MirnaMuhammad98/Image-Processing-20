function M = Sobel(Mask)
%It generates 3x3 constant sobel mask.
%Mask: a char, ‘H’ for horizontal, ‘V’ for vertical.

if Mask == 'H'
    M = [-1, -2, -1; 0, 0, 0; 1, 2, 1;];
elseif Mask == 'V'
    M = [-1, 0, 1; -2, 0, 2; -1, 0, 1;];
end

