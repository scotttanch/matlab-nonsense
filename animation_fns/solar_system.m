%Solar System
clc
clear vars
close all
figure('Name','Solar System','NumberTitle','off','Menubar','none','Color','black')
axis([-175 175 -175 175])
hold on
plot([0 0],[-20 20],'k:') % draw x-axis
plot([-20 20],[0 0],'k:') % draw y-axis
%stars = randi([-170 170],2,200);
%scatter(stars(1,:),stars(2,:),'d')
axis manual % prevent axes from resizing for each new plot statement
set(gca,'xticklabel',[],'yticklabel',[],'Color','black') % remove axis numbering (gca = get current axes)
loop = true;
theta = 0:1:360;
speed = input('Enter the speed (1-10): ');
while (speed <= 0 || speed > 10)
    clc
    speed = input('Enter the speed (1-10): ');
end
sun_pts = [5*cosd(theta);5*sind(theta)];
mercury_pts = [.387*cosd(theta);.387*sind(theta)];
mercury_center = [.09*cosd(theta);.09*sind(theta)];
venus_pts = [.723*cosd(theta);.723*sind(theta)];
venus_center = [.09*cosd(theta);.09*sind(theta)];
earth_pts = [1*cosd(theta);1*sind(theta)];
earth_start = [30;0];
earth_location = [30;0];
mars_pts = [.53*cosd(theta);.53*sind(theta)];
mars_center = [.09*cosd(theta);.09*sind(theta)];
jupiter_pts = [11.19*cosd(theta);11.19*sind(theta)];
jupiter_center = [.09*cosd(theta);.09*sind(theta)];
mercury_pts = translate(mercury_pts,11.61,0);
mercury_center = translate(mercury_center,11.61,0);
venus_pts = translate(venus_pts,21.69,0);
venus_center = translate(venus_center,21.69,0);
earth_pts = translate(earth_pts,30,0);
mars_pts = translate(mars_pts,45.72,0);
mars_center = translate(mars_center,45.72,0);
jupiter_pts = translate(jupiter_pts,156.09,0);
jupiter_center = translate(jupiter_center,156.09,0);
sun = plotme_set(sun_pts,'yellow');
year = 1;
fprintf('Year: %d',year);
while loop == true
    mercury = plotme_set(mercury_pts,'red');
    %center_1 = plotme_set(mercury_center,'w');
    venus = plotme_set(venus_pts,'red');
    %center_2 = plotme_set(venus_center,'w');
    earth = plotme_set(earth_pts,'cyan');
    %center_3 = plotme_set(earth_center,'w');
    mars = plotme_set(mars_pts,'red');
    %center_4 = plotme_set(mars_center,'w');
    jupiter = plotme_set(jupiter_pts,'yellow');
    %center_5 = plotme_set(jupiter_center,'w');
    pause(.001)
    mercury_pts = myrotate(mercury_pts,1.607*speed);
    mercury_center = myrotate(mercury_center,1.607);
    venus_pts = myrotate(venus_pts,1.174*speed);
    venus_center = myrotate(venus_center,1.174);
    earth_pts = myrotate(earth_pts,speed);
    earth_location = myrotate(earth_location,speed);
    mars_pts = myrotate(mars_pts,.802*speed);
    mars_center = myrotate(mars_center,.802);
    jupiter_pts = myrotate(jupiter_pts,.434*speed);
    jupiter_center = myrotate(jupiter_center,.434);
    delete(mercury);
    delete(venus);
    delete(earth);
    delete(mars);
    delete(jupiter);
    if abs(earth_location - earth_start) < .1
        clc
        year = year + 1;
        fprintf('Speed: %d \n',speed);
        fprintf('Year: %d \n',year);
    end
end