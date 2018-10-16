function [ x, y ] = lonlat2xy( lonlat, img_resol, bound )
%LONLAT2XY Converts lon, lat to x,y coords. of an image with given resol.
% lonlat: [lat lon]
% img_resol: [width height]
% bound: [lon_min lat_min lon_max lat_max]
	horz_factor = (lonlat(1)-bound(1))/(bound(3) - bound(1));
	vert_factor = (lonlat(2) - bound(2))/(bound(4) - bound(2));
	x = round(horz_factor*img_resol(1));
	y = round(vert_factor*img_resol(2));
end

