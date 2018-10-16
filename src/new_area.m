function varargout = new_area(varargin)
% NEW_AREA MATLAB code for new_area.fig
%      NEW_AREA, by itself, creates a new NEW_AREA or raises the existing
%      singleton*.
%
%      H = NEW_AREA returns the handle to a new NEW_AREA or the handle to
%      the existing singleton*.
%
%      NEW_AREA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_AREA.M with the given input arguments.
%
%      NEW_AREA('Property','Value',...) creates a new NEW_AREA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_area_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_area_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_area

% Last Modified by GUIDE v2.5 15-Oct-2018 23:00:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_area_OpeningFcn, ...
                   'gui_OutputFcn',  @new_area_OutputFcn, ...
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


% --- Executes just before new_area is made visible.
function new_area_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_area (see VARARGIN)

% Choose default command line output for new_area
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new_area wait for user response (see UIRESUME)
% uiwait(handles.window);


% --- Outputs from this function are returned to the command line.
function varargout = new_area_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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


% --- Executes on button press in button_reset.
function button_reset_Callback(hObject, eventdata, handles)
% hObject    handle to button_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in list_area.
function list_area_Callback(hObject, eventdata, handles)
% hObject    handle to list_area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_area contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_area


% --- Executes during object creation, after setting all properties.
function list_area_CreateFcn(hObject, eventdata, handles)
set(hObject, 'string', get(handles, 'userdata'));
% hObject    handle to list_area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function window_CreateFcn(hObject, eventdata, handles)
set(handles, 'userdata', {'sdf' 'fds' 'fds'});
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function window_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
