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
    for i = 1:rows - 1
        if centers(i,1) == -1
            FP = [-1, -1];
            pointsCounter = 1;
        else   
            if FP(1) == -1 % found first point
                objectsFound = objectsFound + 1;                
                FP = centers(i, :);                
                points(pointsCounter, 1) = centers(i, 1);
                points(pointsCounter, 2) = centers(i, 2);               
                pointsCounter = pointsCounter + 1;               
                pixelsDiff = 0;
            elseif centers(i + 1, 1) == -1 % found last point
                LP = centers(i, :);
                points(pointsCounter, 1) = centers(i, 1);
                points(pointsCounter, 2) = centers(i, 2);
                pointsCounter = pointsCounter + 1;
                imageDone = i;
                diff = EuclidianDist(centers(i, :), centers(i - 1, :));
                pixelsDiff = pixelsDiff + diff;
            else % found one of the intermediate points
                points(pointsCounter, 1) = centers(i, 1);
                points(pointsCounter, 2) = centers(i, 2);
                pointsCounter = pointsCounter + 1;
                lastFrame = i;
                diff = EuclidianDist(centers(i, :), centers(i - 1, :));
                pixelsDiff = pixelsDiff + diff;
            end
        end
        if imageDone ~= 0
            if pointsCounter > 1
                objectsFound = objectsFound - 1;
                img = video(:, :, :, imageDone);
                for j = 1:pointsCounter - 2
                    img = insertShape(img, 'Line', [points(j,1) points(j,2) points(j+1,1) points(j+1,2)], 'LineWidth', 3, 'Color', 'red');
                end
                
                velocity = pixelsDiff / (pointsCounter - 2);
                velocity = round(velocity, 0);

                angle = GetDirection(FP, LP);
                angle = round(angle, 0);

                % Write V and D on the image
                position = abs(LP - ((LP - FP) ./ 2));
                box_color ={'white'};
                text_str = sprintf('V = %d ppf\nD = %d', velocity, angle);
                img = insertText(img, position, text_str, 'FontSize', 13, 'BoxColor', box_color, 'BoxOpacity', 0.4, 'TextColor', 'red');

                figure, imshow(img);

                imageDone = 0;
                pointsCounter = 1;
            end 
        end
    end
    
    if objectsFound ~= 0; % still need to draw another path
        if pointsCounter > 1
            img = video(:, :, :, lastFrame);
            for j = 1:pointsCounter - 2
                img = insertShape(img, 'Line', [points(j,1) points(j,2) points(j+1,1) points(j+1,2)], 'LineWidth', 3, 'Color', 'red');
            end
            
            velocity = pixelsDiff / (pointsCounter - 2);
            velocity = round(velocity, 0);

            angle = GetDirection(FP, LP);
            angle = round(angle, 0);

            % Write V and D on the image  
            position = abs(LP - ((LP - FP) ./ 2));
            box_color ={'white'};
            text_str = sprintf('V = %d ppf\nD = %d', velocity, angle);
            img = insertText(img, position, text_str, 'FontSize', 13, 'BoxColor', box_color, 'BoxOpacity', 0.4, 'TextColor', 'red');

            figure, imshow(img);
        end 
    end
end