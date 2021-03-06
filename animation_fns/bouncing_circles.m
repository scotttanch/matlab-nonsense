%%
clear vars
clc
loop = true;
%i wanted two cirlces instead of the getpoints thing so i wrote a function
%that makes circles
r = input('Enter the radius of the circles: ');
circle_pts(r)
load circle_pts.mat
%both sets of points are started at a random point within the boundries
%so this part here makes finds random inital centers
x_center_1 = randi([-(30-r) (30-r)]);
y_center_1 = randi([-(30-r) (30-r)]);
x_center_2 = randi([-(30-r) (30-r)]);
y_center_2 = randi([-(30-r) (30-r)]);
%creates center matrixies that can be processed by translate
center_1 = [x_center_1;y_center_1];
center_2 = [x_center_2;y_center_2];
pts = translate(pts,x_center_1,y_center_1);
pts2 = translate(pts2,x_center_2,y_center_2);
%Prepfig
close all
figure('Name','Bouncing Circles','NumberTitle','off','Color','none','MenuBar','none')
axis([-30 30 -30 30])
hold on
axis manual % prevent axes from resizing for each new plot statement
set(gca,'xticklabel',[],'yticklabel',[],'Color','black') % remove axis numbering (gca = get current axes)
%
h = plotme(pts);
f = plotme(pts2);
pause(.1)
delete(h);
delete(f);
%the translation factors are chosen randomly and as a resuly, the speed
tx = rand(1)*2/10;
ty = rand(1)*2/10;
tx2 = rand(1)*2/10;
ty2 = rand(1)*2/10;
%I wanted the circles to change colors randomly, changecolor does that
color = changecolor;
color2 = changecolor;
prev_color_1 = color;
prev_color_2 = color2;
%the colors have to be initalized first though outside the loop
while loop == true
    %its an infinte loop on purpose
    pts = translate(pts,tx,ty);
    pts2 = translate(pts2,tx2,ty2);
    %the centers move the same way the cirlces around them do
    center_1 = translate(center_1,tx,ty);
    center_2 = translate(center_2,tx2,ty2);
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
    if distance <= (2*r)
        L1 = abs(center_1(1,1)-center_2(1,1)); 
        %disp('Angle of Impact')
        %disp(acosd(L1/(2*r)))
        if acosd(L1/(2)) > 45
            if (ty < 0 && ty2 < 0) || (ty > 0 && ty2 > 0)
                if abs(ty) > abs(ty2)
                    ty = -ty;
                end
                if abs(ty2) > abs(ty)
                    ty2 = -ty2;
                end
            else
                ty = -ty;
                ty2 = -ty2;
            end
        elseif acosd(L1/(2*r)) < 45
            if (tx > 0 && tx2 > 0) || (tx < 0 && tx2 < 0)
                if abs(tx) > abs(tx2)
                    tx = -tx;
                end
                if abs(tx) < abs(tx2)
                    tx2 = -tx2;
                end
            else
                tx = -tx;
                tx2 = -tx2;
            end
        elseif acosd(L1/(2*r)) == 45
            if (ty > 0 && ty2 > 0) || (ty < 0 && ty2 < 0)
                if abs(ty) > abs(ty2)
                    ty = -ty;
                else
                    ty2 = -ty2;
                end
            elseif (tx > 0 && tx2 > 0) || (tx < 0 && tx2 < 0)
                if abs(tx) > abs(tx2)
                    tx = -tx;
                else
                    tx2 = -tx2;
                end
            else
            ty = -ty;
            ty2 = -ty2;
            tx = -tx;
            tx2 = -tx2;
            end
        end
        color1 = changecolor;
        color2 = changecolor;
    end
    %these if statments tell the circles to bounce and change color if
    %they hit the boundaries of the figure
    if max(pts(2,:)) > 30 || min(pts(2,:)) < -30
        ty = -ty;
        color = changecolor;
    end
    if max(pts(1,:)) > 30 || min(pts(1,:)) < -30
        tx = -tx;
        color = changecolor;
    end
    if max(pts2(2,:)) > 30 || min(pts2(2,:)) < -30
        ty2 = -ty2;
        color2 = changecolor;
    end
    if max(pts2(1,:)) > 30 || min(pts2(1,:)) < -30 
       tx2 = -tx2;
       color2 = changecolor;
    end
end