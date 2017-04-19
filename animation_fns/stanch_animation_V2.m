%Scott Tanch
%C2 20 Spring 2016
%Animation V2
%nessicary extra functions included
clc
%i have get points comented out here because mypts is provided
%getpoints
load mypts.mat
prepfig
%rotates points in 30? increments
for k = 1:12
    pts = myrotate(pts,30);
    plotme(pts);
    pause(.1)
end
%scale up so the plots dont intereact
pts = scaleme(pts,2,2);
%rotate them back in 30? increments
for k = 12:-1:1
    pts = myrotate(pts,-30);
    plotme(pts);
    pause(.1)
end
%reset the points
load mypts.mat
pause(1)
prepfig
plotme(pts);
%rotate them in 15? increments fomr 30 to 180
for theta = 30:15:180
    plotme(myrotate(pts,theta));
    pause(.1)
end
%reset points again
load mypts.mat
pause(1)
prepfig
h = plotme(pts);
pause(.1)
delete(h);
%make the poonts move over one
for o_index = 1:10
    pts = translate(pts,1,0);
    h = plotme(pts);
    pause(.1)
    delete(h);
    %make the points go up 1 down 2 up 4 then down 7
    for i_index = [1,-2,4,-7]
        pts = translate(pts,0,i_index);
        h = plotme(pts);
        pause(.1)
        delete(h);
    end
end
pause(1)
%close the figure when its done 
close