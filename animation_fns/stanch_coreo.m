%CS 20 Spring 2016
%Animation assinment
%Scott Tanch
clc;
getpoints
load mypts.mat
plotme(pts);
prepfig
theta = 0;
%rotation and scale
while theta<1440
    h = plotme(scaleme((myrotate(pts,theta)),3*sind(theta),3*sind(theta)));
    pause(.1);
    theta = theta+10;
    delete(h);
end
%%reflextion and rotation
for index = 1:20
    pts = myrotate(pts,index);
    a = plotme(scaleme(pts,index/5,index/5));
    pause(.09)
    b = plotme(scaleme(reflectx(pts),index/5,index/5));
    pause(.09)
    c = plotme(scaleme(reflecty(reflectx(pts)),index/5,index/5));
    pause(.09)
    d = plotme(scaleme(reflectx(reflecty(reflectx(pts))),index/5,index/5));
    pause(.09)
    delete(d);
    pause(.09)
    delete(c);
    pause(.09)
    delete(b);
    pause(.09)
    delete(a);
    pause(.09)
end
for index = 1:3
    load mypts.mat
    h = plotme(pts);
    pause(.1)
    delete(h);
    pts = reflectxy(pts);
    h = plotme(pts);
    pause(.1)
    delete(h);
    for index2 = 1:5
        pts = translate(pts,0,-index2);
        h = plotme(pts);
        pause(.15)
        delete(h);
    end
    pts = reflecto(pts);
    h = plotme(pts);
    pause(.1)
    delete(h);
    for index3 = 1:5
        pts = translate(pts,0,-index3);
        h = plotme(pts);
        pause(.15)
        delete(h);
    end
end
load mypts.mat
for index = 1:5
    pts = shearx(pts,index/10);
    pts = sheary(pts,index/10);
    h = plotme(pts);
    pause(.1)
    delete(h);
end
close
