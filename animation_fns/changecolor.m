function color = changecolor
%used for randomly changing the color code in the plotme_set 
choice = randi([0,7]);
switch choice
    case 1
        color = 'blue';
    case 2
        color = 'red';
    case 3
        color = 'white';
    case 4
        color = 'green';
    case 5
        color = 'cyan';
    otherwise
        color = 'magenta';
 end

