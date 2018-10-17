function varargout = new_image(varargin)
% NEW_IMAGE MATLAB code for new_image.fig
%      NEW_IMAGE, by itself, creates a new NEW_IMAGE or raises the existing
%      singleton*.
%
%      varargout is a struct of the following format:
%      varargout.bound: [lon_min lat_min lon_max lat_max]
%      varargout.resolution: 123456
%      varargout.nir: 'path'
%      varargout.red: 'path'
%      varargout.is_valid = {true|false}
%
%      H = NEW_IMAGE returns the handle to a new NEW_IMAGE or the handle to
%      the existing singleton*.
%
%      NEW_IMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_IMAGE.M with the given input arguments.
%
%      NEW_IMAGE('Property','Value',...) creates a new NEW_IMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_image_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_image_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_image

% Last Modified by GUIDE v2.5 16-Oct-2018 21:28:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
	'gui_Singleton',  gui_Singleton, ...
	'gui_OpeningFcn', @new_image_OpeningFcn, ...
	'gui_OutputFcn',  @new_image_OutputFcn, ...
	'gui_LayoutFcn',  [] , ...
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


% --- Executes just before new_image is made visible.
function new_image_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_image (see VARARGIN)

% Choose default command line output for new_image
%handles.output = hObject;
handles.output = struct('bound', [], ...
	'resolution', -1, ...
	'nir', '', ...
	'red', '', ...
	'is_valid', false);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new_image wait for user response (see UIRESUME)
% uiwait(handles.new_image);


% --- Outputs from this function are returned to the command line.
function varargout = new_image_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% varargout{1} = 'Hello world';




function edit_nir_Callback(hObject, eventdata, handles)
% hObject    handle to edit_nir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_nir as text
%        str2double(get(hObject,'String')) returns contents of edit_nir as a double


% --- Executes during object creation, after setting all properties.
function edit_nir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_nir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
	set(hObject,'BackgroundColor','white');
end



function edit_red_Callback(hObject, eventdata, handles)
% hObject    handle to edit_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_red as text
%        str2double(get(hObject,'String')) returns contents of edit_red as a double


% --- Executes during object creation, after setting all properties.
function edit_red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
	set(hObject,'BackgroundColor','white');
end



function edit_resolution_Callback(hObject, eventdata, handles)
% hObject    handle to edit_resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_resolution as text
%        str2double(get(hObject,'String')) returns contents of edit_resolution as a double


% --- Executes during object creation, after setting all properties.
function edit_resolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_resolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
	set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in button_ok.
function error_edit(h_edit)
set(h_edit, 'backgroundColor', [1 .6 .6]);

function reset_edit(h_edit)
set(h_edit, 'backgroundColor', [1 1 1]);

function button_ok_Callback(hObject, eventdata, handles)
% hObject    handle to button_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ----------- Check nir file -----------
try
	imread(get(handles.edit_nir, 'string'));
catch me
	msgbox(me.message, 'Error while reading NIR file', 'error');
	return;
end
handles.output.nir = get(handles.edit_nir, 'string');
% ----------- Check red file -----------
try 
	imread(get(handles.edit_red, 'string'));
	
catch me
	msgbox(me.message, 'Error while readling RED file', 'error');
	return;
end
handles.output.red = get(handles.edit_red, 'string');
% ----------- Check resolution -----------
res = str2double(get(handles.edit_resolution, 'string'));
f_err = false;
if isnan(res)
	f_err = true;
elseif res <= 0
	f_err = true;
end
if f_err
	msgbox('Resolution must be a positive numeric value', 'Error', 'error');
	return;
end
handles.output.resolution = res;
% ----------- Check bouding rect -----------
reset_edit(handles.edit_left);
reset_edit(handles.edit_right);
reset_edit(handles.edit_top);
reset_edit(handles.edit_bottom);
f_err = false;
top = str2double(get(handles.edit_top,'string'));
bottom = str2double(get(handles.edit_bottom,'string'));
left = str2double(get(handles.edit_left,'string'));
right = str2double(get(handles.edit_right,'string'));
if isnan(top)
	f_err = true;
	error_edit(handles.edit_top);
elseif isnan(bottom)
	error_edit(handles.edit_bottom);
	f_err = true
elseif isnan(left)
	error_edit(handles.edit_left);
	f_err = true
elseif isnan(right)
	error_edit(handles.edit_right);
	f_err = true
elseif ~(left > -180 && left <= 180)
	error_edit(handles.edit_left);
	f_err = true;
elseif ~(right > -180 && right <= 180)
	error_edit(handles.edit_right);
	f_err = true;
elseif ~(top >= -90 && top <= 90)
	error_edit(handles.edit_top);
	f_err = true;
elseif ~(bottom >= -90 && bottom <= 90)
	error_edit(handles.edit_bottom);
	f_err = true;
elseif top <= bottom
	error_edit(handles.edit_top);
	error_edit(handles.edit_bottom);
	f_err = true;
end
if f_err
	msgbox('Wrong bounding rect values', 'Error', 'error');
	return;
end
handles.output.bound = [left, bottom, right, top];
% ----------- All the validation routines have been passed fuccflly -----------
handles.output.is_valid = true;



% --- Executes on button press in button_cancel.
function button_cancel_Callback(hObject, eventdata, handles)
% hObject    handle to button_cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output.is_valid = false;


% --- Executes on button press in button_nir.
function button_nir_Callback(hObject, eventdata, handles)
% hObject    handle to button_nir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file_nir, path_nir] = uigetfile('*.*', ...
	'Select near infrared spectrum image',...
	'multiselect', 'off');
if file_nir ~= 0
	set(handles.edit_nir, 'string', [path_nir, file_nir]);
end


% --- Executes on button press in button_red.
function button_red_Callback(hObject, eventdata, handles)
% hObject    handle to button_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file_red, path_red] = uigetfile('*.*', ...
	'Select red spectrum image', ...
	'multiselect', 'off');
if file_red ~= 0
	set(handles.edit_red, 'string', [path_red file_red]);
end




function edit_top_Callback(hObject, eventdata, handles)
% hObject    handle to edit_top (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_top as text
%        str2double(get(hObject,'String')) returns contents of edit_top as a double



% --- Executes during object creation, after setting all properties.
function edit_top_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_top (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
	set(hObject,'BackgroundColor','white');
end



function edit_bottom_Callback(hObject, eventdata, handles)
% hObject    handle to edit_bottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_bottom as text
%        str2double(get(hObject,'String')) returns contents of edit_bottom as a double


% --- Executes during object creation, after setting all properties.
function edit_bottom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_bottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
	set(hObject,'BackgroundColor','white');
end



function edit_left_Callback(hObject, eventdata, handles)
% hObject    handle to edit_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_left as text
%        str2double(get(hObject,'String')) returns contents of edit_left as a double


% --- Executes during object creation, after setting all properties.
function edit_left_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
	set(hObject,'BackgroundColor','white');
end



function edit_right_Callback(hObject, eventdata, handles)
% hObject    handle to edit_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_right as text
%        str2double(get(hObject,'String')) returns contents of edit_right as a double


% --- Executes during object creation, after setting all properties.
function edit_right_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
	set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close new_image.
function new_image_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to new_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
