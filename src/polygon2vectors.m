function [ xvec, yvec ] = polygon2vectors( polygon )
% Polygon: {[x1 y1], [x2 y2],...}
% xvec: [x1 x2 ...]
% yvec: [y1 y2 ...]

xvec = [];
yvec = [];

for i = 1:length(polygon)
	xvec = [xvec, polygon{i}(1)];
	yvec = [yvec, polygon{i}(2)];
end

end

