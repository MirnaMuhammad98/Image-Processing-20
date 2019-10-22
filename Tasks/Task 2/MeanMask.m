function [ M ] = MeanMask( Rows, Column )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    M = ones(Rows, Column);
    val = ones(Rows, Column) .* 9;
    M = M ./ val;
end

