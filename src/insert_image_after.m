function insert_image_after( img, pos )
%INSERT_IMAGE_AFTER 
% pos - position, previous to an insertion.
%    if pos >= length(g_images), img will be inserted in back
%    if pos <= 0, img will be inserted in front
% img - structure:
%    img.nir = '1.tiff'
%    img.red = '1.tiff'
%    img.bound = [lon_min lat_min lon_max lat_max]
%    img.resolution = 0.1
global g_images;

n = length(g_images.files_nir);
nxt = pos+1;

g_images.files_nir = [g_images.files_nir(1:pos), ...
	{img.nir},...
	g_images.files_nir(nxt:n)];
g_images.files_red = [g_images.files_red(1:pos), ...
	{img.red}, ...
	g_images.files_red(nxt:n)];
g_images.bounds = [g_images.bounds(1:pos), ...
	{img.bound}, ...
	g_images.bounds(nxt:n)];
g_images.resolutions = [g_images.resolutions(1:pos), ...
	{img.resolution}, ...
	g_images.resolutions(nxt:n)];

end

