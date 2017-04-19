function pts = shearx(pts,k)
% Usage:    pts = shearx(pts)         
% Purpose:  Compute new coordinates for a shear parallel to x-axis
%           x' = x + ky, y' = y
% INargs:   2xN matrix (x coords in Row 1, y coords in Row 2)          
% OUTargs:  2xN matrix of updated coordinates
mat = [1 k;
       0 1];
pts = mat*pts;
end