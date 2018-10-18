function [ mask ] = get_mask( img_resol, bound )
%GET_MASK Returns a constraining-polygons-based mask for the image 
% bound: [lon_min lat_min lon_max lat_max]
% img_resol: [width height]

	mask_an = get_mask_analyzed();
	mask_ig = get_mask_ignored();
	mask = mask_an .* mask_ig;

%% -----------------------------------------------------------------------
	function mask_an = get_mask_analyzed
		global g_analyzed_areas
		if isempty(g_analyzed_areas)
			mask_an(1:img_resol(2), 1:img_resol(1)) = 1;
			return
		end
		mask_an(1:img_resol(2), 1:img_resol(1)) = 0;
		
		for npol = 1:length(g_analyzed_areas)
			poly = polylonlat2xy(g_analyzed_areas{npol}, img_resol, bound);
			[xv, yv] = polygon2vectors(poly);
			x_min = min(xv);
			x_max = max(xv);
			y_min = min(yv);
			y_max = max(yv);
			for x = x_min:x_max
				for y = y_min:y_max
					% If the point is out of image borders
					if x < 0 || y < 0 || x > img_resol(1) || y > img_resol(2)
						continue;
					end
					if inpolygon(x, y, xv, yv)
						mask_an(y,x) = 1;
					end
				end
			end
		end
	end
%% -----------------------------------------------------------------------
	function mask_ig = get_mask_ignored
		global g_ignored_areas
		mask_ig(1:img_resol(2), 1:img_resol(1)) = 1;
		
		for npol = 1:length(g_ignored_areas)
			poly = polylonlat2xy(g_ignored_areas{npol}, img_resol, bound);
			[xv, yv] = polygon2vectors(poly);
			x_min = min(xv);
			x_max = max(xv);
			y_min = min(yv);
			y_max = max(yv);
			for x = x_min:x_max
				for y = y_min:y_max
					% If the point is out of image borders
					if x < 0 || y < 0 || x > img_resol(1) || y > img_resol(2)
						continue;
					end
					if inpolygon(x,y, xv, yv)
						mask_ig(y,x) = 0;
					end
				end
			end
		end
	end

end

