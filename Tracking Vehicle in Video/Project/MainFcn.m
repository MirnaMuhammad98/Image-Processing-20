function MainFcn(case_num)
    switch case_num
        case 1
            video = ReadVideo('Case1/case1.wmv');
        case 2
            video = ReadVideo('Case2/case2.avi');
        case 3
            video = ReadVideo('Case3/3.mp4');
        otherwise
            return
    end
    
    case_num_str = num2str(case_num);
    back_name = strcat('back', case_num_str, '.jpg');
    if exist(back_name, 'file') % if background has been extracted before
        back = imread(back_name);
    else
        back = ExtractBackground(video, back_name, 'Average');
    end
    
    
    without_back = SubtractBackground(video, back);
    
    centers = GetObjectsCenters(without_back);
    
    DrawPaths(video, centers);
end

