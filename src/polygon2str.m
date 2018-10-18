function [ string ] = polygon2str( polygon, f_reversed )
%POLYGON2STR Converts polygon to a string
% polygon: {[x y], [x y],...}
% f_reversed:
%   f_reversed = true:  means [x y] will be displayed as 'y x'
%   f_reversed = false:  means [x y] will be displayed as 'x y'
% string: {'x y' 'x y'...} (depends on f_reversed
if nargin == 1
	f_reversed = false;
end
string = {};
for i = 1 : length(polygon)
	array = polygon{i};
	if f_reversed
		array = fliplr(polygon{i});
	end
	string = [string, {num2str(array)}];
end

end

