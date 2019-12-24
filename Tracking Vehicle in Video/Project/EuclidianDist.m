function dist = EuclidianDist(point1, point2)
    diffX = point1(1) - point2(1);
    diffY = point1(2) - point2(2);
    dist = sqrt(diffX^2 + diffY^2);
end

