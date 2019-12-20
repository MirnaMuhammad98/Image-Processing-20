function background = ExtractBackground(video, name)
[rows, cols, channels, frames] = size(video);
background = zeros(rows, cols, channels);
for i = 1:frames
    frame_d = double(video(:, :, :, i));
    background = background + frame_d;
end
background = background ./ frames;
background = uint8(background);
imwrite(background, name);
end

