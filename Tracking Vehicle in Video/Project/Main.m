% Steps so far:
% Read video
% Extract background
% Subtract background from all frames and apply thresholding on result
% The result is segmented
% Bounding Box

%case1 = ReadVideo('Case1/case1.wmv');
%case2 = ReadVideo('Case2/case2.avi');
%case3 = ReadVideo('Case3/3.mp4');

%background1 = ExtractBackground(case1, 'background1.jpg', 'Average');
%background2 = ExtractBackground(case2, 'background2.jpg', 'Average');
%background3 = ExtractBackground(case3, 'background3.jpg', 'Average');
%background1 = imread('background1.jpg');
%background2 = imread('background2.jpg');
%background3 = imread('background3.jpg');

%without_background1 = SubtractBackground(case1, background1);
%without_background2 = SubtractBackground(case2, background2);
%without_background3 = SubtractBackground(case3, background3);

%temp_vid = DifferenceBetweenFrames(without_background, 3);
%[~, ~, ~, x] = size(temp_vid);

centers1 = GetObjectsCenters(without_background1);
centers2 = GetObjectsCenters(without_background2);
centers3 = GetObjectsCenters(without_background3);

DrawPaths(case1, centers1);
DrawPaths(case2, centers2);
DrawPaths(case3, centers3);