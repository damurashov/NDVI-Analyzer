function [ img ] = get_image( id )
%GET_IMAGE returns the following struct:
% img.nir = '1.tiff'
% img.red = '1.tiff'
% img.bound = [lon_min lat_min lon_max lat_max]
% img.resolution = 0.1
global g_images
img.nir = '';
img.red = '';
img.bound = [];
img.resolution = 0;
if id < 1 || id > length(g_images.files_nir)
	return;
end
img.nir = g_images.files_nir{id};
img.red = g_images.files_red{id};
img.bound = g_images.bounds{id};
img.resolution = g_images.resolutions{id};

end

