function h = plotme(pts)
% Purpose:  Plot points
% INargs:   requires a 2xN matrix of pts, x coords in Row 1, y coords in Row 2, 'b' is color code
%           remove for varying or change to a set color
% OUTargs:  plot handle (helpful for deleting points later)
% Usage:    h = plotme(pts) 

h = plot(pts(1,:),pts(2,:));
end

