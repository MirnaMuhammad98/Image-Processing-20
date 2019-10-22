function [ M ] = LaplacianSharp()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    M = ones(3);
    M = M .* -1;
    M(2,2) = 9;
end

