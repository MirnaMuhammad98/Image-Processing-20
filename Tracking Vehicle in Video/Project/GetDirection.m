function angle = GetDirection(FP, LP)
    deltaY = LP(2) - FP(2);
    deltaX = LP(1) - FP(1);
    slope = deltaY / deltaX;
    angle = atan(slope) * 180 / pi;
    if deltaX < 0
        angle = 180 - angle;
    end
end

