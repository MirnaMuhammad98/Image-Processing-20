function difference_video = DifferenceBetweenFrames(video, step)
    [rows, cols, ~, frames] = size(video);
    difference_video = zeros(rows, cols, 1, uint32(frames ./ step));
    index = 1;
    for current_frame = (step + 1):step:frames
        difference_video(:, :, :, index) = video(:, :, :, current_frame) - video(:, :, :, current_frame - step);
        index = index + 1;
    end
end

