function [pts] = reflecty(pts)
% Purpose:  Reflect pts through the y-axis
% Usage:    pts = reflecty(pts)
% INargs:   pts  a 2xN matrix, x in row 1, y in row 2
% OUTargs:  pts
mat = [-1 0;
        0 1];
pts = mat*pts;
end

