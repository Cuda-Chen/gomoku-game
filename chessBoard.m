function varargout = chessBoard(varargin)
% CHESSBOARD MATLAB code for chessBoard.fig
%      CHESSBOARD, by itself, creates a new CHESSBOARD or raises the existing
%      singleton*.
%
%      H = CHESSBOARD returns the handle to a new CHESSBOARD or the handle to
%      the existing singleton*.
%
%      CHESSBOARD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHESSBOARD.M with the given input arguments.
%
%      CHESSBOARD('Property','Value',...) creates a new CHESSBOARD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chessBoard_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chessBoard_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chessBoard

% Last Modified by GUIDE v2.5 19-Jun-2015 23:03:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chessBoard_OpeningFcn, ...
                   'gui_OutputFcn',  @chessBoard_OutputFcn, ...
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


% --- Executes just before chessBoard is made visible.
function chessBoard_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chessBoard (see VARARGIN)

% Choose default command line output for chessBoard
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chessBoard wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% clf;



% --- Outputs from this function are returned to the command line.
function varargout = chessBoard_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% set global integer color to specify the chesses' color
global color;
color = 1;

% random a integer number to decide which color goes first
number = round(rand(1));
if number == 0,
    h = msgbox('blue goes first');
    color = 0;
elseif number == 1,
    h = msgbox('red goes first');
end

% after the user press "OK" button, start to draw the chess board
uiwait(h);

% draw chess board
clc
grid on
axis([1 15 1 15]);
set(gca, 'GridLineStyle', '-', 'XTick', [1:1:15], 'YTick', [1:1:15]);
axis square

% initialize global matrix chessBoard to store the chess' statues
global chessBoard;
chessBoard = zeros(15, 15);

% set(handles.pushbutton1, 'string', 'restrat');
% h1 = uicontrol;
% set(h1, 'String', 'restart');
% cmd = playAgain;
% set(h1, 'callback', cmd);

% if detect user draw a chess, invoke function chess
chess();

%test;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% to restart game
playAgain;

