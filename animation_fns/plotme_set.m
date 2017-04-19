function h = plotme_set(pts,color_change)
% Purpose:  Plot points
% INargs:   requires a 2xN matrix of pts, x coords in Row 1, y coords in Row 2,
%           addition of an input for changing the color
% OUTargs:  plot handle (helpful for deleting points later)
% Usage:    h = plotme(pts) 

h = plot(pts(1,:),pts(2,:),color_change);
end

