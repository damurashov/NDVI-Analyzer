function [ polylonlat ] = polyxy2lonlat( polyxy, img_resol, bound )
% polyxy: {[x y], [x y]...}
% img_resol: [width height]
% bound: [lon_min lat_min lon_max lat_max]
% polylonlat: {[lon lat], [lon lat],...}

for i = 1:length(polyxy)
	[lon, lat] = xy2lonlat(polyxy{i}, img_resol, bound);
	polylonlat{i} = [lon, lat];
end

end

