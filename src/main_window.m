function varargout = main_window(varargin)
%MAIN_WINDOW M-file for main_window.fig
%      MAIN_WINDOW, by itself, creates a new MAIN_WINDOW or raises the existing
%      singleton*.
%
%      H = MAIN_WINDOW returns the handle to a new MAIN_WINDOW or the handle to
%      the existing singleton*.
%
%      MAIN_WINDOW('Property','Value',...) creates a new MAIN_WINDOW using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to main_window_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAIN_WINDOW('CALLBACK') and MAIN_WINDOW('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAIN_WINDOW.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_window

% Last Modified by GUIDE v2.5 17-Oct-2018 22:25:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_window_OpeningFcn, ...
                   'gui_OutputFcn',  @main_window_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before main_window is made visible.
function main_window_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
global g_images;
global g_analyzed_areas;
global g_ignored_areas;

set(handles.list_images, 'string', g_images.files_red);
set(handles.list_ignored_areas, 'string', listpolygon2str(g_ignored_areas));
set(handles.list_analyzed_areas, 'string', listpolygon2str(g_analyzed_areas));
update_preview(handles);


% Choose default command line output for main_window
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_window wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_window_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in list_images.


function list_images_Callback(hObject, eventdata, handles)
% hObject    handle to list_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_images contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_images
update_preview(handles);


% --- Executes during object creation, after setting all properties.
function list_images_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_images_plus.
function button_images_plus_Callback(hObject, eventdata, handles)
% hObject    handle to button_images_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_images;
out = new_image();
if ~(out.is_valid)
	return;
end
insert_image_after(out, length(g_images.files_nir));
set(handles.list_images, 'string', g_images.files_red);
set(handles.list_images, 'value', 1);
update_preview(handles);

% --- Executes on button press in button_images_minus.
function button_images_minus_Callback(hObject, eventdata, handles)
% hObject    handle to button_images_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_images;
pos = int64(get(handles.list_images, 'value'));
if pos <= 0
	return;
elseif length(g_images.files_nir) == 0
	return;
end
remove_image(pos);
set(handles.list_images, 'string', g_images.files_red);
pos = pos-1;
if pos <= 0
	pos = 1;
end
set(handles.list_images, 'value', pos);
guidata(hObject, handles);
update_preview(handles);

% --- Executes on button press in button_images_up.
function button_images_up_Callback(hObject, eventdata, handles)
% hObject    handle to button_images_up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_images;
if isempty(get(handles.list_images,'string'))
	return;
end
pos = get(handles.list_images, 'value');
if pos <= 1
	return;
end
swap_images(pos, pos-1);
set(handles.list_images, 'string', g_images.files_red);
set(handles.list_images, 'value', pos-1);


% --- Executes on button press in button_images_down.
function button_images_down_Callback(hObject, eventdata, handles)
% hObject    handle to button_images_down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_images;
if isempty(get(handles.list_images,'string'))
	return;
end
pos = get(handles.list_images, 'value');
if pos >= length(g_images.files_red)
	return;
end
swap_images(pos, pos+1);
set(handles.list_images, 'string', g_images.files_red);
set(handles.list_images, 'value', pos+1);


% --- Executes on selection change in list_ignored_areas.
function list_ignored_areas_Callback(hObject, eventdata, handles)
% hObject    handle to list_ignored_areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_preview(handles);

% Hints: contents = cellstr(get(hObject,'String')) returns list_ignored_areas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_ignored_areas


% --- Executes during object creation, after setting all properties.
function list_ignored_areas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_ignored_areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_ignored_areas_plus.
function button_ignored_areas_plus_Callback(hObject, eventdata, handles)
% hObject    handle to button_ignored_areas_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_ignored_areas
if isempty(get(handles.list_images, 'string'))
	return;
end
poly = new_area(get(handles.list_images,'value'));
if isempty(poly)
	return;
end
g_ignored_areas = [g_ignored_areas, {poly}];
update_preview(handles);
set(handles.list_ignored_areas, 'string', listpolygon2str(g_ignored_areas));
set(handles.list_ignored_areas, 'value', 1);


% --- Executes on button press in button_ignored_areas_minus.
function button_ignored_areas_minus_Callback(hObject, eventdata, handles)
% hObject    handle to button_ignored_areas_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_ignored_areas;
if isempty(get(handles.list_ignored_areas, 'string'))
	return;
end
g_ignored_areas(get(handles.list_ignored_areas, 'value')) = [];
set(handles.list_ignored_areas, 'string', listpolygon2str(g_ignored_areas));
if isempty(g_ignored_areas)
	set(handles.list_ignored_areas, 'value', 0);
else
	set(handles.list_ignored_areas, 'value', 1);
end
update_preview(handles);


% --- Executes on selection change in list_analyzed_areas.
function list_analyzed_areas_Callback(hObject, eventdata, handles)
% hObject    handle to list_analyzed_areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_preview(handles);

% Hints: contents = cellstr(get(hObject,'String')) returns list_analyzed_areas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_analyzed_areas


% --- Executes during object creation, after setting all properties.
function list_analyzed_areas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_analyzed_areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_analyzed_areas_plus.
function button_analyzed_areas_plus_Callback(hObject, eventdata, handles)
% hObject    handle to button_analyzed_areas_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_analyzed_areas
if isempty(get(handles.list_images, 'string'))
	return;
end
poly = new_area(get(handles.list_images,'value'));
if isempty(poly)
	return;
end
g_analyzed_areas = [g_analyzed_areas, {poly}];
update_preview(handles);
set(handles.list_analyzed_areas, 'string', listpolygon2str(g_analyzed_areas));
set(handles.list_analyzed_areas, 'value', 1);


% --- Executes on button press in button_analyzed_areas_minus.
function button_analyzed_areas_minus_Callback(hObject, eventdata, handles)
% hObject    handle to button_analyzed_areas_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g_analyzed_areas;
if isempty(get(handles.list_analyzed_areas, 'string'))
	return;
end
g_analyzed_areas(get(handles.list_analyzed_areas, 'value')) = [];
set(handles.list_analyzed_areas, 'string', listpolygon2str(g_analyzed_areas));
if isempty(g_analyzed_areas)
	set(handles.list_analyzed_areas, 'value', 0);
else
	set(handles.list_analyzed_areas, 'value', 1);
end
update_preview(handles);


% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_Analyze_Callback(hObject, eventdata, handles)
% hObject    handle to menu_Analyze (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_analyze_graph_Callback(hObject, eventdata, handles)
% hObject    handle to menu_analyze_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_analyze_ndvi_vizualization_Callback(hObject, eventdata, handles)
% hObject    handle to menu_analyze_ndvi_vizualization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(get(handles.list_images, 'string'))
	msgbox('You should provide at least one image', 'Abort', 'warn');
	return;
end
[mode, f_mask] = visualization_parameters();
if mode == -1
	return;
end
ndvi_map = get_ndvi_map(get(handles.list_images,'value'), false);
figure;
imshow(ndvi_map);


% --------------------------------------------------------------------
function menu_file_quit_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.window);


% --- Executes during object creation, after setting all properties.
function axes_preview_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_preview
axis off
set(hObject, 'ydir', 'normal');
axis image
hold on

% --- Updates preview ---
function update_preview(handles)
% Updates preview field
% Remove previous preview
global g_analyzed_areas;
global g_ignored_areas;
color_red = [1 .4 .4];
color_green = [.4 1 .4];

cla(handles.axes_preview); % clear axes
if isempty(get(handles.list_images, 'string'))
	return;
end

st_image = get_image(get(handles.list_images,'value'));
matrix_image = flipud(imread(st_image.red));
[h,w,nch] = size(matrix_image);
imresol = [w,h];
bound = st_image.bound;
set(handles.axes_preview, 'xlim', [0 w], 'ylim', [0 h], ...
	'xlimmode', 'manual', 'ylimmode', 'manual');

% Show image
image(matrix_image, 'parent', handles.axes_preview);

% Show analyzed areas
for i = 1:length(g_analyzed_areas)
	col = color_green;
	linewidth = 2;
	if get(handles.list_analyzed_areas, 'value') == i
		linewidth = 4;
	end
	polyxy = polylonlat2xy(g_analyzed_areas{i}, imresol, bound);
	polyxy = [polyxy, polyxy(1)];
	[xvec, yvec] = polygon2vectors(polyxy);
	plot(xvec, yvec, 'parent', handles.axes_preview, 'linewidth', linewidth, ...
		'color', col);
end

% Show ignored areas
for i = 1:length(g_ignored_areas)
	col = color_red;
	linewidth = 2;
	if get(handles.list_ignored_areas, 'value') == i
		linewidth = 4;
	end
	polyxy = polylonlat2xy(g_ignored_areas{i}, imresol, bound);
	polyxy = [polyxy, polyxy(1)];
	[xvec, yvec] = polygon2vectors(polyxy);
	plot(xvec, yvec, 'parent', handles.axes_preview, 'linewidth', linewidth, ...
		'color', col);
end









