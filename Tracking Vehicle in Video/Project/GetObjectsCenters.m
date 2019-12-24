function centers = GetObjectsCenters(video)
    [~, ~, ~, frames] = size(video);
    % Save the centroids of the Cars
    centers = zeros(frames, 2);
    %lastCenter = [-1,-1];
    %currentCenter = [-2,-2] ;
    for i = 1:frames
        [Labeled, ObjectNumbers] = bwlabeln(video(:, :, :, i));
        % If no objects in the current frame
        if ObjectNumbers == 0
            centers(i, :) = [-1 -1];
        % else if there's one or more objects
        else
            regions = regionprops(Labeled, 'all');
            max_area = 0;
            obj_index = 1;
            % Get object with Max Area
            for j = 1:ObjectNumbers
                if regions(j).Area > max_area
                    obj_index = j;
                    max_area = regions(j).Area;
                end
            end
            if max_area > 9630
                centers(i, :) = regions(obj_index).Centroid;
                %currentCenter = regions(obj_index).Centroid;
                %if abs(currentCenter(1) - lastCenter(1))>1
                %    centers(i, :) = regions(obj_index).Centroid;
                %    lastCenter = currentCenter;
                %else
                %    centers(i,:) = [-1,-1];
                %end
            else
                centers(i, :) = [-1,-1];
            end
        end 
    end
end