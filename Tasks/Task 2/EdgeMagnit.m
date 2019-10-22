function G = EdgeMagnit(I)
    SobelH = Sobel('H');
    ResH = LinearFilter(I, SobelH, 'absolute');
    SobelV = Sobel('V');
    ResV = LinearFilter(I, SobelV, 'absolute');
    G = uint8(ResH + ResV);
end

