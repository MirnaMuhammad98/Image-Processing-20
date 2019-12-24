function DrawPaths(video, centers)
    [rows , ~ ] = size(centers);
    [~, ~, ~, frames ] = size(video);
    points = zeros(frames, 2);
    pointsCounter = 1;
    FP = [-1, -1];
    LP = [-1, -1];
    imageDone = 0;
    objectsFound = 0;
    lastFrame = 0;
    pixelsDiff = 0;
    slope =0;
    for i = 1:rows - 1
        if centers(i,1) == -1
            FP = [-1, -1];
            pointsCounter = 1;
        else   
            if FP(1) == -1
                objectsFound = objectsFound + 1;
                FP = centers(i, :);
                points(pointsCounter, 1) = centers(i, 1);
                points(pointsCounter, 2) = centers(i, 2);
                pointsCounter = pointsCounter +1;
                pixelsDiff = 0;
            elseif centers(i + 1, 1) == -1
                LP = centers(i, :);
                points(pointsCounter, 1) = centers(i, 1);
                points(pointsCounter, 2) = centers(i, 2);
                pointsCounter = pointsCounter + 1;
                imageDone = i;
                diffX = centers(i, 1) - centers(i - 1, 1);
                diffY = centers(i, 2) - centers(i - 1, 2);
                diff = sqrt(diffX^2 + diffY^2);
                pixelsDiff = pixelsDiff + diff;
            else
                points(pointsCounter, 1) = centers(i, 1);
                points(pointsCounter, 2) = centers(i, 2);
                pointsCounter = pointsCounter + 1;
                lastFrame = i;
                diffX = centers(i, 1) - centers(i - 1, 1);
                diffY = centers(i, 2) - centers(i - 1, 2);
                diff = sqrt(diffX^2 + diffY^2);
                pixelsDiff = pixelsDiff + diff;
            end
        end
        if imageDone ~= 0
            objectsFound = objectsFound - 1;
            
            deltaY = LP(2) - FP(2);
            deltaX = LP(1) - FP(1);
            slope = deltaY / deltaX;
            angle = atan(slope) * 180 / pi;
            if slope > 0
                angle = 180 - angle;
            end
            a = angle
            velocity = pixelsDiff / (pointsCounter - 2);
            if pointsCounter > 1
                img = video(:, :, :, imageDone);
                for j = 1:pointsCounter - 2
                    img = insertShape(img, 'Line', [points(j,1) points(j,2) points(j+1,1) points(j+1,2)], 'LineWidth', 2, 'Color', 'red');
                end
                figure , imshow(img)
            end          
            imageDone = 0;
            pointsCounter = 1;
        end
    end
    if objectsFound ~= 0; % still need to draw another path
        deltaY = LP(2) - FP(2);
        deltaX = LP(1) - FP(1);
        slope = deltaY / deltaX;
        angle = atan(slope) * 180 / pi;
        if slope > 0
            angle = 180 - angle;
        end
        a = angle
        velocity = pixelsDiff / (pointsCounter - 2);
        img = video(:, :, :, lastFrame);
        for j = 1:pointsCounter - 2
            img = insertShape(img, 'Line', [points(j,1) points(j,2) points(j+1,1) points(j+1,2)], 'LineWidth', 2, 'Color', 'red');
        end
        figure, imshow(img)
    end
end