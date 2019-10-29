function [ M ] = MeanMask( Rows, Column )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    M = ones(Rows, Column);
    val = ones(Rows, Column) .* (Rows * Column) ;
    M = M ./ val;
end

