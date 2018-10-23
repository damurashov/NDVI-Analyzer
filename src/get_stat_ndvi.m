function [ stat ] = get_vec_meanndvi(f_use_mask);
% Format
% f_use_mask: {true, false}
% stat:
%   stat.mean_ndvi = [0.231, 0.4653, 0.567]; - mean value of ndvi for each
%     image
%   stat.green_perc = [30, 45, 10] - green area in percents

global g_images
nimgs = length(g_images.files_nir);

stat.mean_ndvi = [];
stat.green_perc = [];

for i = 1 : nimgs
	ndvi_map = get_ndvi_map(i, f_use_mask);
	n_points = 0;
	n_green = 0;
	sum_ndvi = 0;
	
	for i = 1 : size(ndvi_map,1)
		for j = 1 : size(ndvi_map,2)
			if isnan(ndvi_map(i,j))
				continue
			end
			n_points = n_points + 1;
			if ndvi_map(i,j) > 0.6
				n_green = n_green + 1;
			end
			sum_ndvi = sum_ndvi + ndvi_map(i,j);
		end
	end
	
	stat.mean_ndvi = [stat.mean_ndvi, sum_ndvi / n_points];
	stat.green_perc = [stat.green_perc, n_green / n_points * 100];
end

end

