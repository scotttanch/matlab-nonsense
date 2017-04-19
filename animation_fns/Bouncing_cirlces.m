%Scott Tanch
%CS 20
%Bouncing Circles
clc
%i wanted two cirlces instead of the getpoints thing so i wrote a function
%that makes circles
circle_pts
load circle_pts.mat
load circle_pts_2.mat
%both sets of points are started at a random point within the boundries
center_1 = [randi([-18 18]);randi([-18 18])];
center_2 = [randi([-18 18]);randi([-18 18])];
pts = translate(pts,center_1(1),center_1(2));
pts2 = translate(pts2,center_2(1),center_2(2));
prepfig
h = plotme(pts);
f = plotme(pts2);
pause(.1)
delete(h);
delete(f);
%the translation factors are chosen randomly and as a resuly, the speed
%an array makes comparing them together easier
t = [rand(1)*2/10 (rand(1)*2)/10; rand(1)*2/10 (rand(1)*2)/10];
%I wanted the circles to change colors randomly, changecolor does that
color = changecolor;
color2 = changecolor;
%the colors have to be initalized first though outside the loop
%The loop is intentionaly infinite and must be exited using ctrl-c
loop = true;
while loop == true
    pts = translate(pts,t(1,1),t(1,1));
    pts2 = translate(pts2,t(2,1),t(2,2));
    %the centers move the same way the cirlces around them do
    center_1 = translate(center_1,t(1,1),t(1,2));
    center_2 = translate(center_2,t(2,1),t(2,2));
    %plotme_set is a variation of plot me where i just added the extra
    %input for the line color
    h = plotme_set(pts,color);
    f = plotme_set(pts2,color2);
    pause(.001)
    delete(h);
    delete(f);
    %distance formula bewtween centers
    distance = sqrt((center_2(1,1)-center_1(1,1))^2 + ((center_2(2,1)-center_1(2,1))^2));
    %if the distance between them is less than or equal to 4 they reverse
    %direction
    if distance <= 4
        L1 = abs(center_1(1,1)-center_2(1,1)); 
        if cos(L1/4) > 45
            t(1,2) = -t(1,2);
            t(2,2) = -t(2,2);
        elseif cos(L1/4) < 45
            t(1,1) = -t(1,1);
            t(2,1) = -t(2,1);
        else
            t(1,1) = -t(1,1);
            t(2,1) = -t(2,1);
            t(1,2) = -t(1,2);
            t(2,2) = -t(2,2);
        end
        color = changecolor;
        color2 = changecolor;
    end
    %these if statments tell the circles to bounce and change color if
    %they hit the boundaries of the figure
    if max(pts(2,:)) > 20 || min(pts(2,:)) < -20
        t(1,2) = -t(1,2);
        color = changecolor;
    end
    if max(pts(1,:)) > 20 || min(pts(1,:)) < -20
        t(1,1) = -t(1,1);
        color = changecolor;
    end
    if max(pts2(2,:)) > 20 || min(pts2(2,:)) < -20
        t(2,1) = -t(2,1);
        color2 = changecolor;
    end
    if max(pts2(1,:)) > 20 || min(pts2(1,:)) < -20 
       t(2,2) = -t(2,2);
       color2 = changecolor;
    end
end
