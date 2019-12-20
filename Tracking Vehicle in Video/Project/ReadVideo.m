function video = ReadVideo(filename)
    videoReader = VideoReader(filename);
    video = read(videoReader);
end

