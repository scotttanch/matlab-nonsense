function prepfig
% Purpose:  Plot the x- and y-axes; fix axis boundaries at [-20,20]
% Usage:    prepfig
% INargs:   None
% OUTargs:  None
close all
axis([-20 20 -20 20])
hold on
plot([0 0],[-20 20],'k:') % draw x-axis
plot([-20 20],[0 0],'k:') % draw y-axis
axis manual % prevent axes from resizing for each new plot statement
set(gca,'xticklabel',[],'yticklabel',[],'Color','black') % remove axis numbering (gca = get current axes)
end