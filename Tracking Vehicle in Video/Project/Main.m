% Steps so far:
% Read video
% Extract background
% Subtract background from all frames and apply thresholding on result
% The result is segmented
% Difference between frames
% Bounding Box

case1 = ReadVideo('Case1/case1.wmv');
% background1 = ExtractBackground(case1, 'background2.jpg');
background1 = imread('background1.jpg');
without_background = SubtractBackground(case1, background1);
%temp_vid = DifferenceBetweenFrames(without_background, 3);
%[~, ~, ~, x] = size(temp_vid);
centers = GetObjectsCenters(without_background);
