function [ liststr ] = listpolygon2str( listpolygon, f_reversed )
% listpolygon: {{[lon lat], [lon lat],...}, {[lon lat], [lon lat],...}...}
% f_reversed: changes places of x and y
% liststr: {'x y; x y...', 'x y; x y; x y...'}
liststr = {};
if nargin == 1
	f_reversed = false;
end
for i = 1 : length(listpolygon)
	strings = polygon2str(listpolygon{i});
	string = '';
	for j = 1 : length(strings)
		array = strings{i};
		if f_reversed
			array = fliplr(array);
		end
		string = [string, num2str(array), '; '];
	end
	liststr = [liststr, {string}];
end

end

