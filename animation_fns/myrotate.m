function pts = myrotate(pts,theta)
% Purpose:  Rotates pts clockwise by theta degrees
% Usage:    pts = myrotate(pts,theta)
%           where pts is a 2xN matrix, x vals in row 1, y vals in row 2
% INargs:   pts, theta
% OUTargs:  pts
% 
mat = [cosd(theta) sind(theta);
       -sind(theta) cosd(theta)];
pts = mat*pts;
end