function [ ndvi_map ] = get_ndvi_map( id, f_use_mask )
% id:       image id
% ndvi_map: 2-dim matrix respective to image size
% The images must exist.

if nargin == 1
	f_use_mask = true;
end

img_struct = get_image(id);
nir = imread(img_struct.nir);
red = imread(img_struct.red);
if length(size(nir)) == 3
	nir = rgb2gray(nir);
end
if length(size(red)) == 3
	red = rgb2gray(red);
end
% Adjust sizes in case of a little size mismatch
sznir = size(nir);
szred = size(red);
xx = min(sznir(2), szred(2));
yy = min(sznir(1), szred(1));
if ~isequal(sznir, szred)
	nir = nir(1:yy, 1:xx);
	red = red(1:yy, 1:xx);
end
% Finish
nir = double(nir);
red = double(red);
ndvi_map = (nir-red)./(nir+red);
if f_use_mask
	ndvi_map = ndvi_map.*get_mask([xx,yy], img_struct.bound);
end
end

