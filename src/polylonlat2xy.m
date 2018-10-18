function [ polyxy ] = polylonlat2xy( polylonlat, img_resol, bound )
% polylonlat: {[lon lat], [lon lat]...}
% img_resol: [width height]
% bound: [lon_min lat_min lon_max lat_max]
% polyxy: {[x y], [x y]...}

for i = 1 : length(polylonlat)
	[x,y] = lonlat2xy(polylonlat{i}, img_resol, bound);
	polyxy{i} = [x,y];
end

end

