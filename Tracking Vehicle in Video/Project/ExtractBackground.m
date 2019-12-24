function background = ExtractBackground(video, name, method)

[rows, cols, channels, frames] = size(video);
background = zeros(rows, cols, channels);
    
if strcmp(method, 'Average') == 1
    for i = 1:frames
        frame_d = double(video(:, :, :, i));
        background = background + frame_d;
    end
    background = background ./ frames;
    background = uint8(background);
    imwrite(background, name);
end

if strcmp(method, 'Median') == 1
    for r = 1:rows
        for c = 1:cols
            for ch = 1:channels
                background(r, c, ch) = median(video(r, c, ch, :));
            end
        end
    end
end

background = uint8(background);
imwrite(background, name);
end