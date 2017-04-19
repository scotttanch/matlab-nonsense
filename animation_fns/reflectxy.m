function [pts] = reflectxy(pts)
% Purpose:  Reflect pts through the line y = x
% Usage:    pts = reflectxy(pts)
% INargs:   pts  a 2xN matrix, x in row 1, y in row 2
% OUTargs:  pts
mat = [0 1;
       1 0];
pts = mat*pts;
end

