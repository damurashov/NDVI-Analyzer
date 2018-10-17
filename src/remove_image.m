function remove_image( id )
%REMOVE_IMAGE removes image with given index (position)
global g_images;

nir = g_images.files_nir;
red = g_images.files_red;
rsl = g_images.resolutions;
bds = g_images.bounds;
idprev = id-1;
idnext = id+1;
nimgs = length(g_images.files_nir);

g_images.files_nir = [nir(1:idprev), nir(idnext:nimgs)];
g_images.files_red = [red(1:idprev), red(idnext:nimgs)];
g_images.resolutions = [rsl(1:idprev), rsl(idnext:nimgs)];
g_images.bounds = [bds(1:idprev), bds(idnext:nimgs)];

end

