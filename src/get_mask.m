function [ mask ] = get_mask( img_resol, bound )
%GET_MASK Returns a constraining-polygons-based mask for the image 
% bound: [lon_min lat_min lon_max lat_max]
% img_resol: [width height]

	mask = get_mask_analyzed() .* get_mask_ignored();

%% Functions
	function [xv, yv] = for_inpolygon(polygon)
	% polygon: {[lon lat], [lon lat]}
		xv = [];
		yv = [];
		for i = 1 : length(polygon)
			[x,y] = lonlat2xy(polygon{i}, img_resol, bound);
			xv = [xv, x];
			yv = [yv, y];
		end
	end
%% -----------------------------------------------------------------------
	function mask_an = get_mask_analyzed
		global g_analyzed_areas
		if isempty(g_analyzed_areas) == 0
			mask_an(1:img_resol(2), 1:img_resol(1)) = 1;
			return
		end
		mask_an(1:img_resol(2), 1:img_resol(1)) = 0;
		
		for npol = 1:length(g_analyzed_areas)
			[xv, yv] = for_inpolygon(g_analyzed_areas{npol});
			x_min = min(xv);
			x_max = max(xv);
			y_min = min(yv);
			y_max = max(yv);
			for x = x_min:x_max
				for y = y_min:y_max
					if inpolygon(x,y)
						mask_an(x,y, xv, yv) = 1;
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
			[xv, yv] = for_inpolygon(g_ignored_areas{npol});
			x_min = min(xv);
			x_max = max(xv);
			y_min = min(yv);
			y_max = max(yv);
			for x = x_min:x_max
				for y = y_min:y_max
					if inpolygon(x,y, xv, yv)
						mask_ig(x,y) = 0;
					end
				end
			end
		end
	end

end

