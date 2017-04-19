function circle_pts(r)
%creates two matricies of points forming circles to be used in animations
theta = 0:1:360;
pts = [r*(cosd(theta));r*(sind(theta))];
pts2 = [r*(cosd(theta));r*(sind(theta))];
save circle_pts pts pts2
        

