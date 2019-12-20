function without_back = SubtractBackground(video, background)
    [rows, cols, ~, frames] = size(video);
    temp = zeros(rows, cols, 1, frames);
    back_g = rgb2gray(background);
    for i = 1:frames
        video_g = rgb2gray(video(:, :, :, i));
        temp(:, :, :, i) = bitxor(video_g, back_g);       
    end
    temp = uint8(temp);
    
    without_back = zeros(rows, cols, 1, frames);
    for i = 1:frames
        img = temp(:, :, :, i);
        threshold = adaptthresh(img);
        threshold = graythresh(threshold);
        without_back(:, :, :, i) = imbinarize(img, threshold);
        without_back(:, :, :, i) = imerode(without_back(:, :, :, i), ones(11, 11));
        without_back(:, :, :, i) = ordfilt2(without_back(:, :, :, i), 1, ones(5,5));
       % without_back(:, :, :, i) = imdilate(without_back(:, :, :, i), ones(9, 9));
       without_back(:, :, :, i) = imdilate(without_back(:, :, :, i), strel('square',32));
       without_back(:, :, :, i) = imdilate(without_back(:, :, :, i), strel('square',15));
       %without_back(:, :, :, i) = imdilate(without_back(:, :, :, i), strel('disk',9, 0));
    end
end