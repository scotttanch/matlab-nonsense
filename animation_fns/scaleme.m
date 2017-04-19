function pts = scaleme(pts,sx,sy)     
% Purpose:  Compute new coordinates for scaling of pts
% Usage:    pts = scaleme(pts,sx,sy)   
% INargs:   2xN matrix (x coords in Row 1, y coords in Row 2
%           sx, horizontal scale factor
%           sy, vertical scale factor
%           Use 1 for sx and/or sy if no scaling desired
% OUTargs:  2xN matrix of updated coordinates

mat = [sx 0;
       0 sy];
pts = mat*pts;
end
