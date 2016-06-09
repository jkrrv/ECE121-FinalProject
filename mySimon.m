function varargout = mySimon(varargin)
% MYSIMON MATLAB code for mySimon.fig
%      MYSIMON, by itself, creates a new MYSIMON or raises the existing
%      singleton*.
%
%      H = MYSIMON returns the handle to a new MYSIMON or the handle to
%      the existing singleton*.
%
%      MYSIMON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYSIMON.M with the given input arguments.
%
%      MYSIMON('Property','Value',...) creates a new MYSIMON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mySimon_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mySimon_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mySimon

% Last Modified by GUIDE v2.5 14-May-2015 15:34:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mySimon_OpeningFcn, ...
                   'gui_OutputFcn',  @mySimon_OutputFcn, ...
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


% --- Executes just before mySimon is made visible.
function mySimon_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mySimon (see VARARGIN)

% Set up game parameters
handles = initialize_game(handles);

% Choose default command line output for mySimon
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = mySimon_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_1.
function pushbutton_1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject,'Interruptible','off');
button_press(1);


% --- Executes on button press in pushbutton_2.
function pushbutton_2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject,'Interruptible','off');    
button_press(2);


% --- Executes on button press in pushbutton_3.
function pushbutton_3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject,'Interruptible','off');
button_press(3);
   

% --- Executes on button press in pushbutton_4.
function pushbutton_4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject,'Interruptible','off');
button_press(4);
   

% --- Executes on button press in pushbutton_start.
function pushbutton_start_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
%%%% DO NOT EDIT THIS FUNCTION CALL
start_round;


% --- Executes on button press in pushbutton_exit.
function pushbutton_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%% DO NOT EDIT THIS FUNCTION CALL
end_game;
