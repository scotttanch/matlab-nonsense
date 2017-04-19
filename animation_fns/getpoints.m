function getpoints
% Purpose:  Allow user to interact graphically to create design of choice
% Usage:    getpoints
% INargs:   None
% OUTargs:  None
% OUTfile:  mypts.mat contains pts, a 2xN matrix (x row 1, y row2) 
prepfig % set up the axes
X=[];Y=[]; % establish empty vectors to accumulate each set of the coordinates 
done = false;  % handy name for Boolean flag - use flag to quit the while loop when user is done
while ~done
    [x y] = ginput(1); % acquire one point at a time so we can plot as we go
    if ~isempty(x) % when done, user will press ENTER key without clicking on graph
        plot(x,y,'k*');
        X(end+1) = x;
        Y(end+1) = y; %append next x and y to end of respective vectors
    else
        done = true; % x is empty, so we're done
    end
end
pts = [X;Y];  % package the x and y values into a 2xN matrix, ready for matrix multiplication
save mypts pts
pause(2) % wait for a moment, then close the figure
close 
end


