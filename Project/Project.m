function varargout = Project(varargin)
% PROJECT MATLAB code for Project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project

% Last Modified by GUIDE v2.5 18-Dec-2014 14:26:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_OutputFcn, ...
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


% --- Executes just before Project is made visible.
function Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project (see VARARGIN)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in drawNoiseMaskButton.
function drawNoiseMaskButton_Callback(hObject, eventdata, handles)
% hObject    handle to drawNoiseMaskButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,canceled]=imgetfile();
if canceled
    return;
end
handles.mask = imread(filename);
handles.mask = im2double(handles.mask);
handles.img = double(handles.mask>0.5) .* handles.img;
imshow(handles.img);
set(handles.drawNoiseMaskButton,'BackgroundColor','green');
set(handles.markRepairButton,'enable','on');
guidata(hObject, handles);


% --- Executes on button press in markRepairButton.
function markRepairButton_Callback(hObject, eventdata, handles)
% hObject    handle to markRepairButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.repair = getrect(handles.image);
handles.repair = int64(handles.repair);
set(handles.markRepairButton,'BackgroundColor','green');
set(handles.markSampleButton,'enable','on');
guidata(hObject, handles);


% --- Executes on button press in markSampleButton.
function markSampleButton_Callback(hObject, eventdata, handles)
% hObject    handle to markSampleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.sample = getrect(handles.image);
handles.sample = int64(handles.sample);
set(handles.markSampleButton,'BackgroundColor','green');
set(handles.runButton,'enable','on');
set(handles.run3Button,'enable','on');
guidata(hObject, handles);



function iterations_Callback(hObject, eventdata, handles)
% hObject    handle to iterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterations as text
%        str2double(get(hObject,'String')) returns contents of iterations as a double


% --- Executes during object creation, after setting all properties.
function iterations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function size_Callback(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size as text
%        str2double(get(hObject,'String')) returns contents of size as a double


% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function softness_Callback(hObject, eventdata, handles)
% hObject    handle to softness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of softness as text
%        str2double(get(hObject,'String')) returns contents of softness as a double


% --- Executes during object creation, after setting all properties.
function softness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to softness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rx = [handles.repair(1):handles.repair(1)+handles.repair(3)];
ry = [handles.repair(2):handles.repair(2)+handles.repair(4)];
sx = [handles.sample(1):handles.sample(1)+handles.repair(3)];
sy = [handles.sample(2):handles.sample(2)+handles.repair(4)];
handles.img = denoise3(handles.img, ry, rx, sy, sx, handles.mask(:,:,1));
imshow(handles.img);
guidata(hObject, handles);


% --------------------------------------------------------------------
function fileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to fileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function loadImageItem_Callback(hObject, eventdata, handles)
% hObject    handle to loadImageItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,canceled]=imgetfile();
if canceled
    return;
end
handles.img = imread(filename);
handles.img = im2double(handles.img);
imshow(handles.img);
set(handles.drawNoiseMaskButton,'enable','on');
guidata(hObject, handles);

% --------------------------------------------------------------------
function saveImageItem_Callback(hObject, eventdata, handles)
% hObject    handle to saveImageItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, ext, canceled] = imputfile();
if canceled
    return;
end
[img, flag] = getimage(handles.image);
if flag == 0
    return;
end
imwrite(img, filename);
guidata(hObject, handles);
% ====================================================================


% --- Executes on button press in run3Button.
function run3Button_Callback(hObject, eventdata, handles)
% hObject    handle to run3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rx = [handles.repair(1):handles.repair(1)+handles.repair(3)];
ry = [handles.repair(2):handles.repair(2)+handles.repair(4)];
sx = [handles.sample(1):handles.sample(1)+handles.repair(3)];
sy = [handles.sample(2):handles.sample(2)+handles.repair(4)];
handles.img = denoisesf3(handles.img, ry, rx, sy, sx, handles.mask(:,:,1));
imshow(handles.img);
guidata(hObject, handles);