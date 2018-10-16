function [ lon, lat ] = xy2lonlat( xy, img_resol, bound )
%XY2LONLAT Converts x and y of image with given resolution to lon and lat  
% xy: [x y]
% img_resol: [width height]
% bound: [lon_min lat_min lon_max lat_max]

	horz_factor = xy(1) / img_resol(1);
	vert_factor = xy(2) / img_resol(2);
	% lon = lonmin + horz_factor*(lon_max - lon_min)
	lon = bound(1) + horz_factor*(bound(3) - bound(1));
	% lat = latmin + horz_factor*(lat_max - lat_min)
	lat = bound(2) + vert_factor*(bound(4) - bound(2));
end

