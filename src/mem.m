% ---------- Analyzed regions ----------
% format: {{[lon lat], [lon lat],...}, {[lon lat], [lon lat],...}...}
global g_analyzed_areas;
g_analyzed_areas = {};

% ---------- Ignored areas ----------
% format: {{[lon lat], [lon lat],...}, {[lon lat], [lon lat],...}...}
global g_ignored_areas;
g_ignored_areas = {};

% ---------- Struct images ----------
% format:
% g_images.files_nir = {'1.tiff', '2.tiff' ...}
% g_images.files_red = {'1.tiff', '2.tiff' ...}
% g_images.bounds = {[lon_min lat_min lon_max lat_max], ...}
% g_images.resolutions = {0.5, 2, ...} % units/px
global g_images;
g_images.files_nir = {};
g_images.files_red = {};
g_images.bounds = {};
g_images.resolutions = {};