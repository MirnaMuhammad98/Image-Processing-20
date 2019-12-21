function  DrawLine(video,centers)
    [rows , ~ ] = size(centers);
    [~, ~, ~, frames ] = size (video);
    points = zeros(frames,2);
    pointsCounter =1;
    FP = [-1,-1];
    LP = [-1,-1];
    imageDone =0;
    for i = 1:rows-1
        if centers(i,1) == -1
            FP = [-1,-1];
            pointsCounter = 1;
        else 
            if FP(1) == -1
                FP = [centers(i,1) , centers(i,2)];
                points(pointsCounter,1) = centers(i,1);
                points(pointsCounter,2) = centers(i,2);
                pointsCounter = pointsCounter +1;
            elseif centers(i+1, 1) == -1
                LP = [centers(i,1) , centers(i,2)];
                points(pointsCounter,1) = centers(i,1);
                points(pointsCounter,2) = centers(i,2);
                pointsCounter = pointsCounter +1;
                imageDone = i;
            else
                points(pointsCounter,1) = centers(i,1);
                points(pointsCounter,2) = centers(i,2);
                pointsCounter = pointsCounter +1;
            end
        end
        if imageDone ~= 0;
            if pointsCounter > 1
                img = video(:,:,:,imageDone);
                for j = 1:pointsCounter-2
                    img =insertShape(img,'Line',[points(j,1) points(j,2) points(j+1,1) points(j+1,2)],'LineWidth',2,'Color','red');
                end
                figure , imshow(img)
            end
            
            imageDone =0;
            pointsCounter = 1;
        end
    end

end