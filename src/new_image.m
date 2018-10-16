function varargout = new_image(varargin)
% NEW_IMAGE MATLAB code for new_image.fig
%      NEW_IMAGE, by itself, creates a new NEW_IMAGE or raises the existing
%      singleton*.
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

% Last Modified by GUIDE v2.5 15-Oct-2018 19:56:36

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
handles.output = hObject;

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
function button_ok_Callback(hObject, eventdata, handles)
% hObject    handle to button_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_cancel.
function button_cancel_Callback(hObject, eventdata, handles)
% hObject    handle to button_cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_nir.
function button_nir_Callback(hObject, eventdata, handles)
% hObject    handle to button_nir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_red.
function button_red_Callback(hObject, eventdata, handles)
% hObject    handle to button_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
