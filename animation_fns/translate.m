function pts = translate(pts,tx,ty)
% Purpose:  Update coordinates for horizontal and vertical translation
% Usage:    pts = translate(pts,tx,ty)
% INargs:   pts  2xN matrix with x values in row 1, y values in row 2
%           tx  desired horizontal translation (>0 moves right)
%           ty  desired vertical translation (>0 moves up)
% OUTargs:  pts transformed values
% APPROACH 1
pts(1,:) = pts(1,:) + tx;
pts(2,:) = pts(2,:) + ty;
% APPROACH 2
% n = size(pts,2); % number of cols
% tx = ones(1,n) * tx;
% ty = ones(1,n) * ty;
% pts = pts + [tx;ty];
% APPROACH 3
% delta = repmat([tx;ty],1,size(pts,2));
% pts = pts + delta;
% APPROACH 4
% mat = [1 0 tx
%        0 1 ty];  % 2x3 if not affine w/other mats
% pts = mat * [pts;ones(1,size(pts,2))];   
       
end

