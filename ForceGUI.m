

%---------------------------------------------------------------------------------------------------------------------------
%                        a MATLAB GUI Intelligent Tuning Program for Guitar String Sound
%           Responsible for Project: Design of Intelligent Tuning Equipment for Stringed Instruments
%                 National College Student Innovation and Entrepreneurship Project, #201910280001
%
% Written and Editted by Shanzhou Diao, BS student at School of Computer Engineering and Science at Shanghai University
%                                         Email: coder_vanir@163.com
%
%   Project Principle: Hanfeng Zhai, BS student at School of Mechanics and Engineering Science at Shanghai University
%                                         Email: frankzhai0@gmail.com
%---------------------------------------------------------------------------------------------------------------------------




function varargout = ForceGUI(varargin)
% FORCEGUI MATLAB code for ForceGUI.fig
%      FORCEGUI, by itself, creates a new FORCEGUI or raises the existing
%      singleton*.
%
%      H = FORCEGUI returns the handle to a new FORCEGUI or the handle to
%      the existing singleton*.
%
%      FORCEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORCEGUI.M with the given input arguments.
%
%      FORCEGUI('Property','Value',...) creates a new FORCEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ForceGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ForceGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ForceGUI

% Last Modified by GUIDE v2.5 26-Apr-2020 15:31:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ForceGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ForceGUI_OutputFcn, ...
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


% --- Executes just before ForceGUI is made visible.
function ForceGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ForceGUI (see VARARGIN)

% Choose default command line output for ForceGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ForceGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ForceGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global length % guitar string length
global density % linear density
global outForce
global dF
x=0:0.05:400; %Unit equals 0.05 --> range [0,400]。
axes(handles.axes1);
y1=(x*2*length).^2 * density;
plot(handles.axes1,x,y1,'r','LineWidth',0.5); %curve width 0.5
hold on
h=str2double(get(handles.edit3,'String'));
F=str2double(get(handles.edit2,'String'));
scatter(handles.axes1,h,F,'*');
hold on
if dF>=0
    plot(handles.axes1,[h h],[outForce F],'b');
else
    plot(handles.axes1,[h h],[F outForce],'b');
end
grid on



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dF
global outForce
global length
global density
global E %弹性模量
global dL
E=200;
a1=str2double(get(handles.edit3,'String'));
a2=str2double(get(handles.edit2,'String'));
outForce = (a1*2* length)^2*density;
dF=abs(a2-outForce);
set(handles.text6,'String',num2str(dF));
dL=dF/E*length;
turns=dL/(pi*0.018); % guitar string diameter
set(handles.text9,'String',num2str(dL));
if dF>=0
    set(handles.text12,'String','CCW');% anti-clockwise
else
    set(handles.text12,'String','CW');% clockwise
end
set(handles.text13,'String',num2str(turns));



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global length
global density
length=0.628;
fe=get(handles.popupmenu1,'Value');
switch fe
    case 1
        density=0.0004812;
    case 2
        density=0.0006714;
    case 3
        density=0.001126;	
    case 4
        density=0.004523;	
    case 5
        density=0.006512;	
    case 6
        density=0.008826;
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[ReadVideoFileName,ReadVideoPathName,ReadVideoFilterIndex] = uigetfile({'*.m4a;*.wav'},'Video',...
    'MultiSelect','off',...       % Multiselection support,'off' or 'on'
    'D:\'); % set path
if isequal(ReadVideoFileName,0) || isequal(ReadVideoPathName,0) || isequal(ReadVideoFilterIndex,0)
    msgbox('导入音频失败，点击 确定 关闭对话框，再重新导入');
else
    VideoFullPath = fullfile(ReadVideoPathName,ReadVideoFileName);
end
axes(handles.axes2);
[data, Fs] = audioread(VideoFullPath);
fs=Fs;
N=4000;
%n=1:N-1;
n=0.01*fs:0.01*fs+N-1;     %read sample from 2nd secs.
%f=n*fs/N;  
f=(n-0.01*fs)*fs/N;     % digital freq -> virtual freq: n/N * fs，n starts from the third circles.
temp=data(:,1);      %single voice track
x=temp(n);
y=fft(x,N);  
mag=abs(y);          % amplitude after Fourier transform
plot(handles.axes2,f,mag); 
[~,pos] = max(mag);% get the freq at the highest amplitude
freq = f(pos);       % freq component at the highest amp
set(handles.edit3,'String',freq);
grid on;



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit3, 'String','')
set(handles.edit2, 'String','')
set(handles.edit1, 'String','')
try
    delete(allchild(handles.img1));
    delete(allchild(handles.img2));
end



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
