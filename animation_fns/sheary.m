function pts = sheary(pts,k)
% Usage:    pts = sheary(pts)         
% Purpose:  Compute new coordinates for a shear parallel to y-axis
%           x' = x, y' = y + kx
% INargs:   2xN matrix (x coords in Row 1, y coords in Row 2)          
% OUTargs:  2xN matrix of updated coordinates
mat = [1 0;k 1];
pts = mat*pts;
end