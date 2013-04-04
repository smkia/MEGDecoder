function varargout = MEGDecoder(varargin)
% MEGDECODER M-file for MEGDecoder.fig
%      MEGDECODER, by itself, creates a new MEGDECODER or raises the existing
%      singleton*.
%
%      H = MEGDECODER returns the handle to a new MEGDECODER or the handle to
%      the existing singleton*.
%
%      MEGDECODER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEGDECODER.M with the given input arguments.
%
%      MEGDECODER('Property','Value',...) creates a new MEGDECODER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MEGDecoder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MEGDecoder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013
% Last Modified by GUIDE v2.5 26-Mar-2013 16:51:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @MEGDecoder_OpeningFcn, ...
    'gui_OutputFcn',  @MEGDecoder_OutputFcn, ...
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


% --- Executes just before MEGDecoder is made visible.
function MEGDecoder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MEGDecoder (see VARARGIN)

% Choose default command line output for MEGDecoder
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MEGDecoder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MEGDecoder_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function FTDirText_Callback(hObject, eventdata, handles)
% hObject    handle to FTDirText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FTDirText as text
%        str2double(get(hObject,'String')) returns contents of FTDirText as a double


% --- Executes during object creation, after setting all properties.
function FTDirText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FTDirText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MIDirText_Callback(hObject, eventdata, handles)
% hObject    handle to MIDirText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MIDirText as text
%        str2double(get(hObject,'String')) returns contents of MIDirText as a double


% --- Executes during object creation, after setting all properties.
function MIDirText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MIDirText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DataDirText_Callback(hObject, eventdata, handles)
% hObject    handle to DataDirText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DataDirText as text
%        str2double(get(hObject,'String')) returns contents of DataDirText as a double


% --- Executes during object creation, after setting all properties.
function DataDirText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataDirText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FTDirBut.
function FTDirBut_Callback(hObject, eventdata, handles)
% hObject    handle to FTDirBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MIDirBut.
function MIDirBut_Callback(hObject, eventdata, handles)
% hObject    handle to MIDirBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dataDirBut.
function dataDirBut_Callback(hObject, eventdata, handles)
% hObject    handle to dataDirBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,dataFilePath] = uigetfile('*.mat');
set(handles.DataDirText,'String',strcat(dataFilePath,FileName));
setappdata(handles.figure1,'dataFile',strcat(dataFilePath,FileName));
variables = load(strcat(dataFilePath,FileName));
setappdata(handles.figure1,'workSpace',variables);
names = fieldnames(variables);
set(handles.variablesList,'String',names);
contents = get(handles.variablesList,'String');
setappdata(handles.figure1,'selectedData',contents{get(handles.variablesList,'Value')});
set(handles.BLFromText,'Enable','on');
set(handles.BLToText,'Enable','on');
set(handles.HPFilterText,'Enable','on');
set(handles.LPFilterText,'Enable','on');
set(handles.preprocessBut,'Enable','on');




% --- Executes on selection change in variablesList.
function variablesList_Callback(hObject, eventdata, handles)
% hObject    handle to variablesList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns variablesList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from variablesList
contents = get(hObject,'String');
%variables = getappdata(handles.figure1,'workSpace');
%a = getfield(variables,contents{get(hObject,'Value')});
% setappdata(handles.figure1,'selectedData',contents{get(hObject,'Value')});

% --- Executes during object creation, after setting all properties.
function variablesList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to variablesList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BLFromText_Callback(hObject, eventdata, handles)
% hObject    handle to BLFromText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BLFromText as text
%        str2double(get(hObject,'String')) returns contents of BLFromText as a double


% --- Executes during object creation, after setting all properties.
function BLFromText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BLFromText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BLToText_Callback(hObject, eventdata, handles)
% hObject    handle to BLToText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BLToText as text
%        str2double(get(hObject,'String')) returns contents of BLToText as a double


% --- Executes during object creation, after setting all properties.
function BLToText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BLToText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HPFilterText_Callback(hObject, eventdata, handles)
% hObject    handle to HPFilterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HPFilterText as text
%        str2double(get(hObject,'String')) returns contents of HPFilterText as a double


% --- Executes during object creation, after setting all properties.
function HPFilterText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HPFilterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LPFilterText_Callback(hObject, eventdata, handles)
% hObject    handle to LPFilterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LPFilterText as text
%        str2double(get(hObject,'String')) returns contents of LPFilterText as a double


% --- Executes during object creation, after setting all properties.
function LPFilterText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LPFilterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%Sanity Check

% --- Executes on button press in defineTrialBut.
function defineTrialBut_Callback(hObject, eventdata, handles)
% hObject    handle to defineTrialBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
n = length(projectData.subjectDataPath{projectData.currentSubject,1});
fileType = projectData.subjectDataPath{projectData.currentSubject,1}(n-2:n);
if fileType == 'fif'
    cfg = [];
    cfg.dataset = projectData.subjectDataPath{projectData.currentSubject,1};
    eventTypeContents = get(handles.TDEventTypePopup,'String');
    cfg.trialdef.eventtype = eventTypeContents{get(handles.TDEventTypePopup,'Value')};
    %cfg.trialdef.eventvalue = str2double(get(handles.TDEventValueText,'String'));
    cfg.trialdef.eventvalue = eval(get(handles.TDEventValueText,'String'));
    cfg.trialdef.prestim = str2double(get(handles.TDPreStimulusText,'String'));
    cfg.trialdef.poststim = str2double(get(handles.TDPostStimulusText,'String'));
    trialfunContents = get(handles.TDTrialFunctionPopup,'String');
    cfg.trialfun = trialfunContents{get(handles.TDTrialFunctionPopup,'Value')};
     %cfg.trialfun = 'trialfun_trial';
    cfg = ft_definetrial(cfg);
    cfg.channel = {'MEG'};
    data = ft_preprocessing(cfg);
    checkData.minTime = min(data.time{1,1});
    checkData.maxTime = max(data.time{1,1});
    [flag ,message] = sanityCheck(handles,checkData,'Trial Defining');
    if ~flag
        errordlg(message);
        return;
    end
else
    errordlg('The data file is not in correct format (.fif).');
    return;
end
[FileName,PathName] = uiputfile('*.mat','Saving Data',strcat(projectData.projectDir,'\',projectData.subjectNames{projectData.currentSubject},'_data.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'data','-v7.3');
    projectData.subjectTDDataPath{projectData.currentSubject,1} = strcat(PathName,FileName);
end
updateVariableList(handles,'data');
setappdata(handles.figure1,'data',data);
setappdata(handles.figure1,'projectData',projectData);
updateConfig(handles,projectData);


% --- Executes on button press in preprocessBut.
function preprocessBut_Callback(hObject, eventdata, handles)
% hObject    handle to preprocessBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
data = getappdata(handles.figure1,'data');
if isempty(data)
    [FileName,PathName] = uigetfile('*.mat','Loaing Data',projectData.projectDir);
    if FileName(1,1) ~= 0 && PathName(1,1) ~=0
        file = load(strcat(PathName,FileName));
        names = fieldnames(file);
        for i = 1: length(names)
            updateVariableList(handles,names{i});
        end
        set(handles.variablesList,'String',names);
        contents = get(handles.variablesList,'String');
        data  = getfield(file,contents{get(handles.variablesList,'Value')});
        setappdata(handles.figure1,'data',data);
    else
        errordlg('Please press button again and specify valid file.');
        return;
    end
end
% n = length(projectData.subjectDataPath{projectData.currentSubject,1});
% fileType = projectData.subjectDataPath{projectData.currentSubject,1}(n-2:n);
% if fileType == 'mat'
%     try
%         file = load(projectData.subjectDataPath{projectData.currentSubject,1});
%     catch
%         errordlg('The data file is not exist.');
%         return;
%     end
% elseif fileType == 'fif'
%     try
%         file = load(projectData.subjectTDDataPath{projectData.currentSubject,1});
%     catch
%         errordlg('The data file is not exist.');
%         return;
%     end
% else
%     errordlg('The data file is not in correct format (.mat or .fif).');
%     return;
% end

if iscell(data.time)
    checkData.minTime = min(data.time{1});
    checkData.maxTime = max(data.time{1});
else
    checkData.minTime = min(data.time);
    checkData.maxTime = max(data.time);
end
checkData.fSample = data.fsample;
[flag, message] = sanityCheck(handles,checkData,'Preprocessing');
if ~flag
    errordlg(message);
    return;
end
cfg = [];
cfg.detrend    = 'no';
cfg.resamplefs = str2double(get(handles.DSRateText,'String'));
if ~isnan(cfg.resamplefs)
    data = ft_resampledata(cfg,data);
end
cfg = [];
cfg.channel = {'MEG'};
%cfg.channel = {'MLP*','MRP*'};
cfg.baselinewindow(1,1) = str2double(get(handles.BLFromText,'String'));
cfg.baselinewindow(1,2) = str2double(get(handles.BLToText,'String'));
if isnan(cfg.baselinewindow(1,1)) || isnan(cfg.baselinewindow(1,2))
    cfg.demean = 'no';
else
    cfg.demean = 'yes';
end
cfg.lpfreq = str2double(get(handles.LPFilterText,'String'));
if isnan(cfg.lpfreq)
    cfg.lpfilter = 'no';
else
    cfg.lpfilter = 'yes';
end
cfg.hpfreq = str2double(get(handles.HPFilterText,'String'));
if isnan(cfg.hpfreq)
    cfg.hpfilter = 'no';
else
    cfg.hpfilter = 'yes';
end
preprocessedData = ft_preprocessing(cfg,data);
[FileName,PathName] = uiputfile('*.mat','Saving Preprocessed Data',strcat(projectData.projectDir,'\Preprocessed Data\',projectData.subjectNames{projectData.currentSubject},'_preprocessedData.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'preprocessedData','-v7.3');
end
updateVariableList(handles,'preprocessedData');
setappdata(handles.figure1,'preprocessedData',preprocessedData);
setappdata(handles.figure1,'projectData',projectData);
set(handles.artifactRejectionBut,'Enable','on');
updateConfig(handles,projectData);
rmappdata(handles.figure1,'data');
%


function updateVariableList(handles,variableName)
content = get(handles.variablesList,'String');
sw = 0;
for i = 1 : length(content)
    if strcmp(content{i},variableName)
        sw = 1;
        break;
    end
end
if sw == 0
    content{end+1} = variableName;
    set(handles.variablesList,'String',content);
end


% --- Executes on button press in preprocessSaveBut.
function preprocessSaveBut_Callback(hObject, eventdata, handles)
% hObject    handle to preprocessSaveBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile('*.mat');
preprocessedData = getappdata(handles.figure1,'preprocessedData');
save(strcat(PathName,FileName),'preprocessedData','-v7.3');


% --- Executes on button press in artifactRejectionBut.
function artifactRejectionBut_Callback(hObject, eventdata, handles)
% hObject    handle to artifactRejectionBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
preprocessedData = getappdata(handles.figure1,'preprocessedData');
if isempty(preprocessedData)
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Preprocessed Data\*.mat'),'Loaing Preprocessed Data');
    if FileName(1,1) ~= 0 && PathName(1,1) ~=0
        file = load(strcat(PathName,FileName));
        preprocessedData = file.preprocessedData;
        
    else
        errordlg('Please press button again and specify valid file.');
        return;
    end
end
cfg = [];
cfg.showlabel='yes';
cfg.channel= {'MEG'};
cfg.method = 'summary';
if length(preprocessedData.label) >= 306
    cfg.gradscale = 0.04; %factor to bring Grad and Mag data onto same scale
    cfg.layout = 'neuromag306mag.lay';
end
preprocessedData = ft_rejectvisual(cfg,preprocessedData);
setappdata(handles.figure1,'preprocessedData',preprocessedData);
set(handles.fixingChannelsBut,'Enable','on');
[FileName,PathName] = uiputfile('*.mat','Saving Preprocessed Data',strcat(projectData.projectDir,'\Preprocessed Data\',projectData.subjectNames{projectData.currentSubject},'_preprocessedData.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'preprocessedData','-v7.3');
end
updateConfig(handles,projectData);

% --- Executes on button press in fixingChannelsBut.
function fixingChannelsBut_Callback(hObject, eventdata, handles)
% hObject    handle to fixingChannelsBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
preprocessedData = getappdata(handles.figure1,'preprocessedData');
if isempty(preprocessedData)
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Preprocessed Data\*.mat'),'Loaing Preprocessed Data');
    %file = load(strcat(projectData.projectDir,'\Preprocessed Data\Subject',num2str(projectData.currentSubject),'_preprocessedData.mat'))
    if FileName(1,1) ~= 0 && PathName(1,1) ~=0
        file = load(strcat(PathName,FileName));
        preprocessedData = file.preprocessedData;
    else
        errordlg('Please press button again and specify valid file.');
        return;
    end
end
cfg=[];
preprocessedData = cimec_fixchannels(cfg,preprocessedData);
setappdata(handles.figure1,'preprocessedData',preprocessedData);
[FileName,PathName] = uiputfile('*.mat','Saving Preprocessed Data',strcat(projectData.projectDir,'\Preprocessed Data\',projectData.subjectNames{projectData.currentSubject},'_preprocessedData.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'preprocessedData','-v7.3');
end
updateConfig(handles,projectData);

% --- Executes on selection change in TFMethodPopup.
function TFMethodPopup_Callback(hObject, eventdata, handles)
% hObject    handle to TFMethodPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns TFMethodPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TFMethodPopup


% --- Executes during object creation, after setting all properties.
function TFMethodPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TFMethodPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FOIFromText_Callback(hObject, eventdata, handles)
% hObject    handle to FOIFromText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FOIFromText as text
%        str2double(get(hObject,'String')) returns contents of FOIFromText as a double


% --- Executes during object creation, after setting all properties.
function FOIFromText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FOIFromText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FOIToText_Callback(hObject, eventdata, handles)
% hObject    handle to FOIToText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FOIToText as text
%        str2double(get(hObject,'String')) returns contents of FOIToText as a double


% --- Executes during object creation, after setting all properties.
function FOIToText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FOIToText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FOIStepText_Callback(hObject, eventdata, handles)
% hObject    handle to FOIStepText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FOIStepText as text
%        str2double(get(hObject,'String')) returns contents of FOIStepText as a double


% --- Executes during object creation, after setting all properties.
function FOIStepText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FOIStepText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TOIFromText_Callback(hObject, eventdata, handles)
% hObject    handle to TOIFromText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TOIFromText as text
%        str2double(get(hObject,'String')) returns contents of TOIFromText as a double


% --- Executes during object creation, after setting all properties.
function TOIFromText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TOIFromText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TOIToText_Callback(hObject, eventdata, handles)
% hObject    handle to TOIToText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TOIToText as text
%        str2double(get(hObject,'String')) returns contents of TOIToText as a double


% --- Executes during object creation, after setting all properties.
function TOIToText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TOIToText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TOIStepText_Callback(hObject, eventdata, handles)
% hObject    handle to TOIStepText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TOIStepText as text
%        str2double(get(hObject,'String')) returns contents of TOIStepText as a double


% --- Executes during object creation, after setting all properties.
function TOIStepText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TOIStepText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TFMethodParamText_Callback(hObject, eventdata, handles)
% hObject    handle to TFMethodParamText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TFMethodParamText as text
%        str2double(get(hObject,'String')) returns contents of TFMethodParamText as a double


% --- Executes during object creation, after setting all properties.
function TFMethodParamText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TFMethodParamText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in TFBaselinePopup.
function TFBaselinePopup_Callback(hObject, eventdata, handles)
% hObject    handle to TFBaselinePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns TFBaselinePopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TFBaselinePopup
switch get(hObject,'Value')
    case 1
        set(handles.logCheckbox,'Enable','on');
    case 2
        set(handles.logCheckbox,'Enable','off');
    case 3
        set(handles.logCheckbox,'Enable','on');
end
% --- Executes during object creation, after setting all properties.
function TFBaselinePopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TFBaselinePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in logCheckbox.
function logCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to logCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of logCheckbox



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TFBaselineToText_Callback(hObject, eventdata, handles)
% hObject    handle to TFBaselineToText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TFBaselineToText as text
%        str2double(get(hObject,'String')) returns contents of TFBaselineToText as a double


% --- Executes during object creation, after setting all properties.
function TFBaselineToText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TFBaselineToText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TFBaselineFromText_Callback(hObject, eventdata, handles)
% hObject    handle to TFBaselineFromText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TFBaselineFromText as text
%        str2double(get(hObject,'String')) returns contents of TFBaselineFromText as a double


% --- Executes during object creation, after setting all properties.
function TFBaselineFromText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TFBaselineFromText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TFComputeBut.
function TFComputeBut_Callback(hObject, eventdata, handles)
% hObject    handle to TFComputeBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
preprocessedData = getappdata(handles.figure1,'preprocessedData');
if isempty(preprocessedData)
    %file = load(strcat(projectData.projectDir,'\Preprocessed Data\Subject',num2str(projectData.currentSubject),'_preprocessedData.mat'))
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Preprocessed Data\*.mat'),'Loaing Preprocessed Data');
    if FileName(1,1) ~= 0 && PathName(1,1) ~=0
        file = load(strcat(PathName,FileName));
        preprocessedData = file.preprocessedData;
        setappdata(handles.figure1,'preprocessedData',preprocessedData);
    else
        errordlg('Please press button again and specify valid file.');
        return;
    end
end
if iscell(preprocessedData.time)
    checkData.minTime = min(preprocessedData.time{1});
    checkData.maxTime = max(preprocessedData.time{1});
    t1 = size(preprocessedData.trial{1},2);
    t2 = size(preprocessedData.trial{length(preprocessedData.trial)-1},2);
else
    checkData.minTime = min(preprocessedData.time);
    checkData.maxTime = max(preprocessedData.time);
    t1 = size(preprocessedData.trial,3);
    t2 = size(preprocessedData.trial,3);
end
[flag, message] = sanityCheck(handles,checkData,'TFAnalysis');
if flag == 0
    errordlg(message);
    return;
end
cfg = [];
cfg.output = 'pow';
cfg.channel = 'MEG';
%cfg.channel = {'MLP*','MRP*'};
methodTF = get(handles.TFMethodPopup,'Value');
cfg.foi = str2double(get(handles.FOIFromText,'String')) : str2double(get(handles.FOIStepText,'String')) : str2double(get(handles.FOIToText,'String'));
cfg.keeptrials = 'yes';
switch methodTF
    case 1
        cfg.method = 'wavelet';
        if isnan(str2double(get(handles.TFMethodParamText,'String')))
            cfg.width = linspace(4,8,length(cfg.foi));
        else
            cfg.width = str2double(get(handles.TFMethodParamText,'String'));
        end
    case 2
        cfg.method = 'mtmconvol';
        cfg.t_ftimwin  = 4./cfg.foi;
        cfg.tapsmofrq  = 0.4 *cfg.foi;
end
if t1 == t2
    cfg.toi = str2double(get(handles.TOIFromText,'String')) : str2double(get(handles.TOIStepText,'String')) : str2double(get(handles.TOIToText,'String'));
    data_tf = ft_freqanalysis(cfg,preprocessedData);
    data_tf = reorder_channels(data_tf);
    cfgcmb = [];
    data_tf = ft_combineplanar(cfgcmb, data_tf);
    if ~isnan(str2double(get(handles.TFBaselineFromText,'String'))) && ~isnan(str2double(get(handles.TFBaselineToText,'String')))
        cfgbsl=[];
        baselineMethodTF = get(handles.TFBaselinePopup,'Value');
        cfgbsl.baseline(1,1) = str2double(get(handles.TFBaselineFromText,'String'));
        cfgbsl.baseline(1,2) = str2double(get(handles.TFBaselineToText,'String'));
        switch baselineMethodTF
            case 1
                cfgbsl.baselinetype='absolute';
                set(handles.logCheckbox,'Enable','on');
            case 2
                cfgbsl.baselinetype='relchange';
                set(handles.logCheckbox,'Enable','off');
            case 3
                cfgbsl.baselinetype='relative';
                set(handles.logCheckbox,'Enable','on');
        end
        data_tf = ft_freqbaseline(cfgbsl, data_tf);
    end
    if get(handles.logCheckbox,'Value') == 1 && strcmp(get(handles.logCheckbox,'Enable'),'on')
        data_tf.powspctrm = log(data_tf.powspctrm);
    end
else
    preprocessedDataTemp = preprocessedData;
    preprocessedDataTemp.trial = [];
    preprocessedDataTemp.time = [];
    preprocessedDataTemp.trial{1} = preprocessedData.trial{1};
    preprocessedDataTemp.time{1} = preprocessedData.time{1};
    cfg.toi = str2double(get(handles.TOIFromText,'String')) : str2double(get(handles.TOIStepText,'String')) : round(max(preprocessedDataTemp.time{1}));
    data_tfTemp = ft_freqanalysis(cfg,preprocessedDataTemp);
    data_tfTemp = reorder_channels(data_tfTemp);
    cfgcmb = [];
    data_tfTemp = ft_combineplanar(cfgcmb, data_tfTemp);
    data_tf = data_tfTemp;
    data_tf.time = [];
    data_tf.powspctrm = [];
    for i = 1 : length(preprocessedData.trial)
        preprocessedDataTemp.trial{1} = preprocessedData.trial{i};
        preprocessedDataTemp.time{1} = preprocessedData.time{i};
        cfg.toi = str2double(get(handles.TOIFromText,'String')) : str2double(get(handles.TOIStepText,'String')) : round(max(preprocessedDataTemp.time{1}));
        data_tfTemp = ft_freqanalysis(cfg,preprocessedDataTemp);
        data_tf.time{i} = cfg.toi;
        data_tfTemp = reorder_channels(data_tfTemp);
        cfgcmb = [];
        data_tfTemp = ft_combineplanar(cfgcmb, data_tfTemp);
        if ~isnan(str2double(get(handles.TFBaselineFromText,'String'))) && ~isnan(str2double(get(handles.TFBaselineToText,'String')))
            cfgbsl=[];
            baselineMethodTF = get(handles.TFBaselinePopup,'Value');
            cfgbsl.baseline(1,1) = str2double(get(handles.TFBaselineFromText,'String'));
            cfgbsl.baseline(1,2) = str2double(get(handles.TFBaselineToText,'String'));
            switch baselineMethodTF
                case 1
                    cfgbsl.baselinetype='absolute';
                    set(handles.logCheckbox,'Enable','on');
                case 2
                    cfgbsl.baselinetype='relchange';
                    set(handles.logCheckbox,'Enable','off');
                case 3
                    cfgbsl.baselinetype='relative';
                    set(handles.logCheckbox,'Enable','on');
            end
            data_tfTemp = ft_freqbaseline(cfgbsl, data_tfTemp);
        end
        if get(handles.logCheckbox,'Value') == 1 && strcmp(get(handles.logCheckbox,'Enable'),'on')
            data_tfTemp.powspctrm = log(data_tfTemp.powspctrm);
        end
        data_tf.powspctrm{i} = squeeze(data_tfTemp.powspctrm);
        disp(i);
    end
end
updateVariableList(handles,'data_tf');
setappdata(handles.figure1,'data_tf',data_tf);
[FileName,PathName] = uiputfile('*.mat','Saving Time-Frequency Analysis Data',strcat(projectData.projectDir,'\Time-Frequency Analysis Results\',projectData.subjectNames{projectData.currentSubject},'_TFAnalysis.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'data_tf','-v7.3');
end
%save(strcat(projectData.projectDir,'\Time-Frequency Analysis Results\Subject',num2str(projectData.currentSubject),'_TFAnalysis.mat'),'data_tf');
updateConfig(handles,projectData);


% --- Executes on button press in preprocessLoadBut.
function preprocessLoadBut_Callback(hObject, eventdata, handles)
% hObject    handle to preprocessLoadBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,dataFilePath] = uigetfile('*.mat');
preprocessedData = load(strcat(dataFilePath,FileName));
preprocessedData = preprocessedData.preprocessedData;
setappdata(handles.figure1,'preprocessedData',preprocessedData);
set(handles.BLFromText,'Enable','on');
set(handles.BLToText,'Enable','on');
set(handles.HPFilterText,'Enable','on');
set(handles.LPFilterText,'Enable','on');
set(handles.preprocessBut,'Enable','on');
set(handles.preprocessSaveBut,'Enable','on');
set(handles.artifactRejectionBut,'Enable','on');
set(handles.fixingChannelsBut,'Enable','on');
set(handles.TFMethodPopup,'Enable','on');
set(handles.TFBaselinePopup,'Enable','on');
set(handles.TFMethodParamText,'Enable','on');
set(handles.FOIFromText,'Enable','on');
set(handles.FOIStepText,'Enable','on');
set(handles.FOIToText,'Enable','on');
set(handles.TOIFromText,'Enable','on');
set(handles.TOIStepText,'Enable','on');
set(handles.TOIToText,'Enable','on');
% set(handles.logCheckbox,'Enable','on');
set(handles.TFBaselineFromText,'Enable','on');
set(handles.TFBaselineToText,'Enable','on');
set(handles.TFComputeBut,'Enable','on');


% --- Executes on button press in TFSaveBut.
function TFSaveBut_Callback(hObject, eventdata, handles)
% hObject    handle to TFSaveBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile('*.mat');
data_tf = getappdata(handles.figure1,'data_tf');
save(strcat(PathName,FileName),'data_tf','-v7.3');


% --- Executes on button press in TFLoadBut.
function TFLoadBut_Callback(hObject, eventdata, handles)
% hObject    handle to TFLoadBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,dataFilePath] = uigetfile('*.mat');
data_tf = load(strcat(dataFilePath,FileName));
data_tf = data_tf.data_tf;
setappdata(handles.figure1,'data_tf',data_tf);
set(handles.frequencyText,'Enable','on');
set(handles.timeIntervalText,'Enable','on');
set(handles.featureComputeBut,'Enable','on');
set(handles.channelsPopup,'Enable','on');


% --- Executes on selection change in channelsPopup.
function channelsPopup_Callback(hObject, eventdata, handles)
% hObject    handle to channelsPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns channelsPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from channelsPopup


% --- Executes during object creation, after setting all properties.
function channelsPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelsPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frequencyText_Callback(hObject, eventdata, handles)
% hObject    handle to frequencyText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frequencyText as text
%        str2double(get(hObject,'String')) returns contents of frequencyText as a double


% --- Executes during object creation, after setting all properties.
function frequencyText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequencyText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeIntervalText_Callback(hObject, eventdata, handles)
% hObject    handle to timeIntervalText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeIntervalText as text
%        str2double(get(hObject,'String')) returns contents of timeIntervalText as a double


% --- Executes during object creation, after setting all properties.
function timeIntervalText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeIntervalText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in featureComputeBut.
function featureComputeBut_Callback(hObject, eventdata, handles)
% hObject    handle to featureComputeBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
if (get(handles.FEFeatureTypePopup,'Value') == 1 || get(handles.FEFeatureTypePopup,'Value') == 2 || get(handles.FEFeatureTypePopup,'Value') == 5)
    data_tf = getappdata(handles.figure1,'data_tf');
    if isempty(data_tf)
        %file = load(strcat(projectData.projectDir,'\Time-Frequency Analysis Results\Subject',num2str(projectData.currentSubject),'_TFAnalysis.mat'))
        [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Time-Frequency Analysis Results\*.mat'),'Loaing Time-Frequency Analysis Data');
        if FileName(1,1) ~= 0 && PathName(1,1) ~=0
            file = load(strcat(PathName,FileName));
            data_tf = file.data_tf;
            setappdata(handles.figure1,'data_tf',data_tf);
        else
            errordlg('Please press button again and specify valid file.');
            return;
        end
    end
    if ~iscell(data_tf.powspctrm)
        checkData.channelNum = length(data_tf.label);
        checkData.freqNum = length(data_tf.freq);
        checkData.timeNum = length(data_tf.time);
        checkData.nanFreq = [];
        checkData.nanTime = [];
        for i = 1 :  size(data_tf.powspctrm,3)
            if sum(isnan(squeeze(data_tf.powspctrm(1,1,i,:)))) == size(data_tf.powspctrm,4)
                checkData.nanFreq = [checkData.nanFreq i];
            end
        end
        for i = 1 :  size(data_tf.powspctrm,4)
            if sum(isnan(squeeze(data_tf.powspctrm(1,1,:,i)))) == size(data_tf.powspctrm,3)
                checkData.nanTime = [checkData.nanTime i];
            end
        end
        [flag, message] = sanityCheck(handles,checkData,'Time-Frequency Feature Extraction');
        if flag == 0
            errordlg(message);
            return;
        end
        switch get(handles.channelsPopup,'Value')
            case 1
                channels = 'Grad';
                channelNum = 102;
                projectData.label = data_tf.label(1:102,:);
            case 2
                channels = 'Mag';
                channelNum = 102;
                projectData.label = data_tf.label(103:204,:);
            case 3
                channels = 'Both';
                channelNum = size(data_tf.powspctrm,2);
                projectData.label = data_tf.label;
        end
        projectData.grad = data_tf.grad;
        projectData.cfg = data_tf.cfg;
        frequencies = eval(get(handles.frequencyText,'String'));
        timeIntervals = eval(get(handles.timeIntervalText,'String'));
        setappdata(handles.figure1,'channelNum',channelNum);
        [features,projectData] = featureExtraction (data_tf,channels,channelNum,frequencies,timeIntervals,handles,projectData,get(handles.FEFeatureTypePopup,'Value'));
    else
        checkData.channelNum = length(data_tf.label);
        checkData.freqNum = length(data_tf.freq);
        for i = 1 : length(data_tf.time)
            checkData.timeNum{i} = length(data_tf.time{i});
        end
        checkData.nanFreq = [];
        for i = 1 :  size(data_tf.powspctrm{1},2)
            if sum(isnan(squeeze(data_tf.powspctrm{1}(1,i,:)))) == size(data_tf.powspctrm{1},3)
                checkData.nanFreq = [checkData.nanFreq i];
            end
        end
        [flag, message] = sanityCheck(handles,checkData,'Time-Frequency Feature Extraction');
        if flag == 0
            errordlg(message);
            return;
        end
        switch get(handles.channelsPopup,'Value')
            case 1
                channels = 'Grad';
                channelNum = 102;
                projectData.label = data_tf.label(1:102,:);
            case 2
                channels = 'Mag';
                channelNum = 102;
                projectData.label = data_tf.label(103:204,:);
            case 3
                channels = 'Both';
                channelNum = size(data_tf.powspctrm{1},1);
                projectData.label = data_tf.label;
        end
        projectData.grad = data_tf.grad;
        projectData.cfg = data_tf.cfg;
        frequencies = eval(get(handles.frequencyText,'String'));
        timePortions = eval(get(handles.timeIntervalText,'String'));
        if size(timePortions,2) == 2 && round(timePortions(1,2))>1
            for i = 1 : length(data_tf.time)
                timeIntervals{i} = timePortions;
            end
        else
            for i = 1 : length(data_tf.time)
                timeIntervals{i}(1,:) = [1 floor(max(data_tf.time{i})*timePortions(1))];
                for j = 2 : length(timePortions)
                    timeIntervals{i}(j,:) = [timeIntervals{i}(j-1,2)+1  timeIntervals{i}(j-1,2)+floor(max(data_tf.time{i})*timePortions(j))];
                end
            end
        end
        setappdata(handles.figure1,'channelNum',channelNum);
        [features,projectData] = featureExtraction (data_tf,channels,channelNum,frequencies,timeIntervals,handles,projectData,get(handles.FEFeatureTypePopup,'Value'));
    end
elseif get(handles.FEFeatureTypePopup,'Value') == 3 || get(handles.FEFeatureTypePopup,'Value') == 4
    preprocessedData = getappdata(handles.figure1,'preprocessedData');
    if isempty(preprocessedData)
        %file = load(strcat(projectData.projectDir,'\Time-Frequency Analysis Results\Subject',num2str(projectData.currentSubject),'_TFAnalysis.mat'))
        [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Preprocessed Data\*.mat'),'Loaing Preprocessed Data');
        if FileName(1,1) == 0 && PathName(1,1) == 0
            errordlg('Please press button again and specify valid file.');
            return;
        else
            file = load(strcat(PathName,FileName));
            preprocessedData = file.preprocessedData;
            setappdata(handles.figure1,'preprocessedData',preprocessedData);
        end
    end
    checkData.channelNum = length(preprocessedData.label);
    checkData.timeNum = length(preprocessedData.time);
    [flag, message] = sanityCheck(handles,checkData,'Time Feature Extraction');
    if flag == 0
        errordlg(message);
        return;
    end
    switch get(handles.channelsPopup,'Value')
        case 1
            channels = 'Grad';
            channelNum = 102;
        case 2
            channels = 'Mag';
            channelNum = 102;
        case 3
            channels = 'Both';
            channelNum = size(preprocessedData.trial,2);
    end
    projectData.label = preprocessedData.label;
    projectData.grad = preprocessedData.grad;
    projectData.cfg = preprocessedData.cfg;
    frequencies = eval(get(handles.frequencyText,'String'));
    timeIntervals = eval(get(handles.timeIntervalText,'String'));
    setappdata(handles.figure1,'channelNum',channelNum);
    [features,projectData] = featureExtraction (preprocessedData,channels,channelNum,frequencies,timeIntervals,handles,projectData,get(handles.FEFeatureTypePopup,'Value'));
elseif get(handles.FEFeatureTypePopup,'Value') == 6
    return;
end
try
    rmappdata(handles.figure1,'data_tf');
    clear data_tf;
catch
end
try
    rmappdata(handles.figure1,'preprocessedData');
    clear preprocessedData;
catch
end
setappdata(handles.figure1,'features',features);
[FileName,PathName] = uiputfile('*.mat','Saving Features',strcat(projectData.projectDir,'\Features\',projectData.subjectNames{projectData.currentSubject},'_Features.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'features');
end
%save(strcat(projectData.projectDir,'\Features\Subject',num2str(projectData.currentSubject),'_Features.mat'),'features');
setappdata(handles.figure1,'projectData',projectData);
updateVariableList(handles,'features');
updateConfig(handles,projectData);


% --- Executes on button press in featureSaveBut.
function featureSaveBut_Callback(hObject, eventdata, handles)
% hObject    handle to featureSaveBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile('*.mat');
features = getappdata(handles.figure1,'features');
channelNum = getappdata(handles.figure1,'channelNum');
timeIntervalNum = getappdata(handles.figure1,'timeIntervalNum');
freqNum = getappdata(handles.figure1,'freqNum');
save(strcat(PathName,FileName),'features','channelNum','timeIntervalNum','freqNum');

% --- Executes on button press in featureLoadBut.
function featureLoadBut_Callback(hObject, eventdata, handles)
% hObject    handle to featureLoadBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,dataFilePath] = uigetfile('*.mat');
file = load(strcat(dataFilePath,FileName));
setappdata(handles.figure1,'features',file.features);
setappdata(handles.figure1,'channelNum',file.channelNum);
setappdata(handles.figure1,'freqNum',file.freqNum);
setappdata(handles.figure1,'timeIntervalNum',file.timeIntervalNum);
set(handles.FSSortingMethodPopup,'Enable','on');
set(handles.FSSelectionMethodPopup,'Enable','on');
set(handles.FSCrossValidationPopup,'Enable','on');
set(handles.FSSelectionMethodParamText,'Enable','on');
set(handles.FSFoldNumText,'Enable','on');
set(handles.FSComputeBut,'Enable','on');



% --- Executes on selection change in FSSortingMethodPopup.
function FSSortingMethodPopup_Callback(hObject, eventdata, handles)
% hObject    handle to FSSortingMethodPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns FSSortingMethodPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FSSortingMethodPopup


% --- Executes during object creation, after setting all properties.
function FSSortingMethodPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FSSortingMethodPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FSSelectionMethodPopup.
function FSSelectionMethodPopup_Callback(hObject, eventdata, handles)
% hObject    handle to FSSelectionMethodPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns FSSelectionMethodPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FSSelectionMethodPopup


% --- Executes during object creation, after setting all properties.
function FSSelectionMethodPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FSSelectionMethodPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FSSelectionMethodParamText_Callback(hObject, eventdata, handles)
% hObject    handle to FSSelectionMethodParamText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FSSelectionMethodParamText as text
%        str2double(get(hObject,'String')) returns contents of FSSelectionMethodParamText as a double


% --- Executes during object creation, after setting all properties.
function FSSelectionMethodParamText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FSSelectionMethodParamText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FSCrossValidationPopup.
function FSCrossValidationPopup_Callback(hObject, eventdata, handles)
% hObject    handle to FSCrossValidationPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns FSCrossValidationPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FSCrossValidationPopup


% --- Executes during object creation, after setting all properties.
function FSCrossValidationPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FSCrossValidationPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FSFoldNumText_Callback(hObject, eventdata, handles)
% hObject    handle to FSFoldNumText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FSFoldNumText as text
%        str2double(get(hObject,'String')) returns contents of FSFoldNumText as a double


% --- Executes during object creation, after setting all properties.
function FSFoldNumText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FSFoldNumText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FSComputeBut.
function FSComputeBut_Callback(hObject, eventdata, handles)
% hObject    handle to FSComputeBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
features = getappdata(handles.figure1,'features');
if isempty(features)
    %file = load(strcat(projectData.projectDir,'\Features\Subject',num2str(projectData.currentSubject),'_Features.mat'));
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Features\*.mat'),'Loaing Features');
    try
        file = load(strcat(PathName,FileName));
        features = file.features;
        setappdata(handles.figure1,'features',features);
    catch
        errordlg('Please press button again and specify valid file.');
        return;
    end
end
targets = getappdata(handles.figure1,'targets');
% if isempty(targets)
%     file = load(projectData.targetsPath);
%     targets = file.targets;
% end
if isempty(targets)
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\*.mat'),'Loaing Targets');
    try
        file = load(strcat(PathName,FileName));
        targets = file.targets;
        setappdata(handles.figure1,'targets',targets);
    catch
        errordlg('Please a specify valid targets file.');
        return;
    end
end
cfg = [];
cfg.crossValidationMethod = get(handles.FSCrossValidationPopup,'Value');
cfg.sortingMethod = get(handles.FSSortingMethodPopup,'Value');
cfg.selectionMethod = get(handles.FSSelectionMethodPopup,'Value');
if isempty(str2double(get(handles.FSFoldNumText,'String')))
    cfg.foldNum = 10;
else
    cfg.foldNum = str2double(get(handles.FSFoldNumText,'String'));
end
if isempty(str2double(get(handles.FSSelectionMethodParamText,'String')))
    cfg.selectionMethodParam = 10;
else
    cfg.selectionMethodParam = str2double(get(handles.FSSelectionMethodParamText,'String'));
end
if isempty(str2double(get(handles.FSSortingMethodParamText,'String')))
    cfg.sortingMethodParam = size(features,1);
else
    cfg.sortingMethodParam = str2double(get(handles.FSSortingMethodParamText,'String'));
end
cfg.classificationMethod = get(handles.classificationAlgPopup,'Value');
if cfg.classificationMethod == 3
    warndlg('This classification method dose not use feature selection.');
    return;
end
checkData.foldNum = cfg.foldNum;
checkData.selectionMethod = cfg.selectionMethod;
checkData.sortingMethod = cfg.sortingMethod;
checkData.selectionMethodParam = cfg.selectionMethodParam;
checkData.sortingMethodParam = cfg.sortingMethodParam;
checkData.targets = targets;
checkData.featureNum = size(features,1);
checkData.sampleNum = size(features,2);
[flag, message] = sanityCheck(handles,checkData,'Feature Selection');
if flag == 0
    errordlg(message);
    return;
end
[sortedFeatureIndices,featureScores,bestN,trainIndices,testIndices] = featureSelection(features,targets,cfg);
setappdata(handles.figure1,'sortedFeatureIndices',sortedFeatureIndices);
setappdata(handles.figure1,'featureScores',featureScores);
setappdata(handles.figure1,'bestN',bestN);
setappdata(handles.figure1,'trainIndices',trainIndices);
setappdata(handles.figure1,'testIndices',testIndices);
set(handles.FSPlotBut,'Enable','on');
[FileName,PathName] = uiputfile('*.mat','Saving Feature Selection Results',strcat(projectData.projectDir,'\Features\',projectData.subjectNames{projectData.currentSubject},'_FeatureSelectionResults.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'bestN','sortedFeatureIndices','featureScores','trainIndices','testIndices','targets');
end
%save(strcat(projectData.projectDir,'\Features\Subject',num2str(projectData.currentSubject),'_FeatureSelectionResults.mat'),'bestN','sortedFeatureIndices','featureScores','crossValidationIndices','targets');
updateVariableList(handles,'bestN');
updateVariableList(handles,'sortedFeatureIndices');
updateVariableList(handles,'featureScores');
updateVariableList(handles,'trainIndices');
updateVariableList(handles,'testIndices');
updateConfig(handles,projectData);


% --- Executes on button press in FSPlotBut.
function FSPlotBut_Callback(hObject, eventdata, handles)
% hObject    handle to FSPlotBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
featureScores = getappdata(handles.figure1,'featureScores');
sortedFeatureIndices = getappdata(handles.figure1,'sortedFeatureIndices');
if isempty(projectData)
    file = load(strcat(projectData.projectDir,'\',projectData.projectName,'.mat'));
    projectData = file.projectData;
end
if isempty(featureScores)
    %file = load(strcat(projectData.projectDir,'\Features\Subject',num2str(projectData.currentSubject),'_Features.mat'));
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Features\*.mat'),'Loaing Features`s Scores');
    try
        file = load(strcat(PathName,FileName));
        featureScores = file.featureScores;
        sortedFeatureIndices = file.sortedFeatureIndices;
        setappdata(handles.figure1,'featureScores',featureScores);
        setappdata(handles.figure1,'sortedFeatureIndices',sortedFeatureIndices);
    catch
        errordlg('Please press button again and specify valid file.');
        return;
    end
end
timeIntervalNum = projectData.timeIntervalNum;
freqNum = projectData.freqNum;
channelNum = projectData.channelNum;
plotFormat.label = projectData.label;
plotFormat.freq = 1;
plotFormat.dimord = 'rpt_chan';
plotFormat.time = 1;
plotFormat.cfg = projectData.cfg;
plotFormat.grad = projectData.grad;
plotFormat.powspctrm = [];
contents = get(handles.FSLayoutPopup,'String');
layout = contents{get(handles.FSLayoutPopup,'Value')};
try
    plotFeatureScores(featureScores,sortedFeatureIndices,freqNum,timeIntervalNum,plotFormat,strcat(layout,'.lay'),projectData);
catch
    errordlg('Please check the specified layout and try again.');
    return;
end


function FSLabelsDirText_Callback(hObject, eventdata, handles)
% hObject    handle to FSLabelsDirText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FSLabelsDirText as text
%        str2double(get(hObject,'String')) returns contents of FSLabelsDirText as a double


% --- Executes during object creation, after setting all properties.
function FSLabelsDirText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FSLabelsDirText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FSLabelsDirBut.
function FSLabelsDirBut_Callback(hObject, eventdata, handles)
% hObject    handle to FSLabelsDirBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
[FileName,dataFilePath] = uigetfile('*.mat');
if FileName(1,1)~=0 && dataFilePath(1,1)~=0
    targets = load(strcat(dataFilePath,FileName));
    targets = targets.targets;
    set(handles.FSLabelsDirText,'String',strcat(dataFilePath,FileName));
    projectData.targetsPath = strcat(dataFilePath,FileName);
    setappdata(handles.figure1,'targets',targets);
    setappdata(handles.figure1,'projectData',projectData);
    updateVariableList(handles,'targets');
end


% --- Executes on selection change in FSLayoutPopup.
function FSLayoutPopup_Callback(hObject, eventdata, handles)
% hObject    handle to FSLayoutPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns FSLayoutPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FSLayoutPopup


% --- Executes during object creation, after setting all properties.
function FSLayoutPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FSLayoutPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in classificationAlgPopup.
function classificationAlgPopup_Callback(hObject, eventdata, handles)
% hObject    handle to classificationAlgPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns classificationAlgPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from classificationAlgPopup


% --- Executes during object creation, after setting all properties.
function classificationAlgPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to classificationAlgPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in classifyBut.
function classifyBut_Callback(hObject, eventdata, handles)
% hObject    handle to classifyBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
features = getappdata(handles.figure1,'features');
sortedFeatureIndices = getappdata(handles.figure1,'sortedFeatureIndices');
bestN = getappdata(handles.figure1,'bestN');
trainIndices = getappdata(handles.figure1,'trainIndices');
testIndices = getappdata(handles.figure1,'testIndices');
targets =getappdata(handles.figure1,'targets');
if isempty(features)
    %file = load(strcat(projectData.projectDir,'\Features\Subject',num2str(projectData.currentSubject),'_Features.mat'));
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Features\*.mat'),'Loaing Features');
    try
        file = load(strcat(PathName,FileName));
        features = file.features;
        setappdata(handles.figure1,'features',features);
    catch
        errordlg('Please press button again and specify valid file.');
        return;
    end
end
if isempty(targets)
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\*.mat'),'Loaing Targets');
    try
        file = load(strcat(PathName,FileName));
        targets = file.targets;
        setappdata(handles.figure1,'targets',targets);
    catch
        errordlg('Please a specify valid targets file.');
        return;
    end
end
if (isempty(sortedFeatureIndices) || isempty(bestN) || isempty(trainIndices) || isempty(testIndices)) && get(handles.classificationAlgPopup,'Value') ~= 3
    %file = load(strcat(projectData.projectDir,'\Features\Subject',num2str(projectData.currentSubject),'_FeatureSelectionResults.mat'))
    [FileName,PathName] = uigetfile(strcat(projectData.projectDir,'\Features\*.mat'),'Loaing Feature Selection Results');
    try
        file = load(strcat(PathName,FileName));
        sortedFeatureIndices = file.sortedFeatureIndices;
        bestN = file.bestN;
        trainIndices = file.trainIndices;
        testIndices = file.testIndices;
        setappdata(handles.figure1,'sortedFeatureIndices',sortedFeatureIndices);
        setappdata(handles.figure1,'bestN',bestN);
        setappdata(handles.figure1,'trainIndices',trainIndices);
        setappdata(handles.figure1,'testIndices',testIndices);
    catch
        errordlg('Please press button again and specify valid file.');
        return;
    end
end
switch get(handles.classificationAlgPopup,'Value')
    case 1
        [trainedClassifier,  predictedClassesTest, F ,ACC]=naiveBayesianClassifier...
            (features,targets,sortedFeatureIndices,bestN,trainIndices,testIndices,projectData.config.FSCrossValidationType);
    case 2
        C = 1;
        goal = 0.001;
        iteration = 10;
        [trainedClassifier,predictedClassesTest, F ,ACC] = svmClassifier(features,targets,C,@linearKernel,goal,iteration,sortedFeatureIndices,bestN,trainIndices,testIndices,projectData.config.FSCrossValidationType);
    case 3
        %[trainedClassifier,predictedClassesTest, F ,ACC] = myGLMNET(features,targets,get(handles.FSCrossValidationPopup,'Value'),str2double(get(handles.FSFoldNumText,'String')),'gaussian');
        [trainedClassifier,predictedClassesTest, F ,ACC] = myGLMNET(features,targets,get(handles.FSCrossValidationPopup,'Value'),str2double(get(handles.FSFoldNumText,'String')),'gaussian');
    case 4
        [trainedClassifier,  predictedClassesTest, F, ACC] = knnClassifier(features,targets,sortedFeatureIndices,bestN,trainIndices,testIndices,projectData.config.FSCrossValidationType);
    case 5 
        [trainedClassifier ,predictedClassesTest, F, ACC] = myGLM(features,targets,get(handles.FSCrossValidationPopup,'Value'),str2double(get(handles.FSFoldNumText,'String')),'binomial');
end
set(handles.classificationResultText,'String', 'Classification F1-Score: ');
set(handles.classificationResultText,'String', strcat(get(handles.classificationResultText,'String'),' ', num2str(mean(F))));
[FileName,PathName] = uiputfile('*.mat','Saving Classification Results',strcat(projectData.projectDir,'\Classification Results\',projectData.subjectNames{projectData.currentSubject},'_ClassificationResults.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'trainedClassifier','predictedClassesTest','F','ACC');
end
%save(strcat(projectData.projectDir,'\Classification Results\Subject',num2str(projectData.currentSubject),'_ClassificationResults.mat'),'trainedClassifier','predictedClassesTest','F','ACC');
updateVariableList(handles,'trainedClassifier');
updateVariableList(handles,'predictedClassesTest');
updateVariableList(handles,'F');
updateVariableList(handles,'ACC');
updateConfig(handles,projectData);

% --- Executes on button press in batchTrainingBut.
function batchTrainingBut_Callback(hObject, eventdata, handles)
% hObject    handle to batchTrainingBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
[featuresFileName,featuresPathName] = uigetfile(strcat(projectData.projectDir,'\Features\*.mat'),'Loaing Features','MultiSelect','on');
try
    if ~iscell(featuresFileName)
        t = featuresFileName;
        featuresFileName =[];
        featuresFileName{1} = t;
    end
    batchSize = length(featuresFileName);
    for i = 1 : batchSize
        file = load(strcat(featuresPathName,featuresFileName{i}));
        features{i} = file.features;
    end
catch
    errordlg('Please press button again and specify valid file.');
    return;
end
if iscell(features{1})
    temp = features;
    features = [];
    for i = 1 : length(temp{1})
        features{i} = temp{1}{i};
    end
end
[targetsFileName,targetsPathName] = uigetfile(strcat(projectData.projectDir,'\*.mat'),'Loaing Targets','MultiSelect','on');
if length(targetsFileName) ~= length(features)
    errordlg('Targets should be in the same size as features.');
    return;
end
batchSize = length(features);
try
    for i = 1 : batchSize
        file = load(strcat(targetsPathName,targetsFileName{i}));
        targets{i} = file.targets;
    end
catch
    errordlg('Please press button again and specify valid file.');
    return;
end
cfg = [];
cfg.crossValidationMethod = get(handles.FSCrossValidationPopup,'Value');
cfg.sortingMethod = get(handles.FSSortingMethodPopup,'Value');
cfg.selectionMethod = get(handles.FSSelectionMethodPopup,'Value');
if isempty(str2double(get(handles.FSFoldNumText,'String')))
    cfg.foldNum = 10;
else
    cfg.foldNum = str2double(get(handles.FSFoldNumText,'String'));
end
if isempty(str2double(get(handles.FSSelectionMethodParamText,'String')))
    cfg.selectionMethodParam = 10;
else
    cfg.selectionMethodParam = str2double(get(handles.FSSelectionMethodParamText,'String'));
end
if isempty(str2double(get(handles.FSSortingMethodParamText,'String')))
    cfg.sortingMethodParam = size(features,1);
else
    cfg.sortingMethodParam = str2double(get(handles.FSSortingMethodParamText,'String'));
end
cfg.classificationMethod = get(handles.classificationAlgPopup,'Value');
for i = 1 : batchSize
    try
        [sortedFeatureIndices{i},featureScores{i},bestN{i},trainIndices{i},testIndices{i}] = featureSelection(features{i},targets{i},cfg);
        switch get(handles.classificationAlgPopup,'Value')
            case 1
                [trainedClassifier{i},  predictedClassesTest{i}, F{i} ,ACC{i}]=naiveBayesianClassifier...
                    (features{i},targets{i},sortedFeatureIndices{i},bestN{i},trainIndices{i},testIndices{i},cfg.crossValidationMethod);
            case 2
                C = 1;
                goal = 0.001;
                iteration = 10;
                [trainedClassifier{i},predictedClassesTest{i}, F{i} ,ACC{i}] = svmClassifier(features{i},targets{i},C,@linearKernel,goal,iteration,sortedFeatureIndices{i},bestN{i},trainIndices{i},testIndices{i},cfg.crossValidationMethod);
            case 3
                [trainedClassifier{i},predictedClassesTest{i}, F{i} ,ACC{i}] = myGLMNET(features{i},targets{i},get(handles.FSCrossValidationPopup,'Value'),str2double(get(handles.FSFoldNumText,'String')),'gaussian');
            case 4
                [trainedClassifier{i}, predictedClassesTest{i}, F{i}, ACC{i}] = knnClassifier(features{i},targets{i},sortedFeatureIndices{i},bestN{i},trainIndices{i},testIndices{i},cfg.crossValidationMethod);
        end
    catch
        continue;
    end
end
% set(handles.classificationResultText,'String', 'Classification F1-Score: ');
% set(handles.classificationResultText,'String', strcat(get(handles.classificationResultText,'String'),' ', num2str(mean(mean(F)))));
[FileName,PathName] = uiputfile('*.mat','Saving Classification Results',strcat(projectData.projectDir,'\Classification Results\',projectData.subjectNames{projectData.currentSubject},'_BatchClassificationResults.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'trainedClassifier','predictedClassesTest','F','ACC','sortedFeatureIndices','featureScores','bestN','trainIndices','testIndices');
end

% --- Executes on button press in CLSaveBut.
function CLSaveBut_Callback(hObject, eventdata, handles)
% hObject    handle to CLSaveBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in variableList.
function variableList_Callback(hObject, eventdata, handles)
% hObject    handle to variableList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns variableList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from variableList


% --- Executes during object creation, after setting all properties.
function variableList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to variableList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function fileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to fileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
try
    file = load ('config1983.mat');
    MEGDecoderConfig = file.MEGDecoderConfig;
    addpath(MEGDecoderConfig.MEGDecoderDir);
    addpath(MEGDecoderConfig.fieldtripDir);
    addpath(MEGDecoderConfig.MIDir);
    ft_defaults;
catch
    warndlg('No config file. Please use File>Preferences to specify required Paths.')
end

% --------------------------------------------------------------------
function preferencesMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to preferencesMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'MEGDecoder Path:','Fieldtrip Path:','MI Path:'};
dlg_title = 'Preferences ...';
num_lines = 1;
try
    file = load ('config1983.mat');
    MEGDecoderConfig = file.MEGDecoderConfig;
    def = {MEGDecoderConfig.MEGDecoderDir,MEGDecoderConfig.fieldtripDir,MEGDecoderConfig.MIDir};
catch
    def = {'','',''};
end
options.Resize='on';
answer = inputdlg(prompt,dlg_title,num_lines,def,options);
if ~isempty(answer)
    MEGDecoderConfig.MEGDecoderDir = answer{1};
    MEGDecoderConfig.fieldtripDir = answer{2};
    MEGDecoderConfig.MIDir = answer{3};
    addpath(MEGDecoderConfig.MEGDecoderDir);
    addpath(MEGDecoderConfig.fieldtripDir);
    addpath(MEGDecoderConfig.MIDir);
    save(strcat(MEGDecoderConfig.MEGDecoderDir,'\config1983.mat'),'MEGDecoderConfig');
end


% --------------------------------------------------------------------
function newProjectMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to newProjectMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Enter Project Name:','Enter Project Directory:','Enter Subjects Number:'};
dlg_title = 'New Project';
num_lines = 1;
def = {'Untitled','','1'};
options.Resize='on';
answer = inputdlg(prompt,dlg_title,num_lines,def,options);
if ~isempty(answer)
    projectData.projectName = answer{1};
    projectData.projectDir = answer{2};
    projectData.subjectsNumber = str2num(answer{3});
    projectData.subjectNames = {};
    setappdata(handles.figure1,'projectData',projectData);
    mkdir(projectData.projectDir,'Preprocessed Data');
    mkdir(projectData.projectDir,'Time-Frequency Analysis Results');
    mkdir(projectData.projectDir,'Features');
    mkdir(projectData.projectDir,'Classification Results');
    updateConfig(handles,projectData)
end



%
function projectData = updateConfig(handles,projectData)
projectData.config.TDEventType = get(handles.TDEventTypePopup,'Value');
projectData.config.TDTrialFunction = get(handles.TDTrialFunctionPopup,'Value');
projectData.config.TDEventValue = get(handles.TDEventValueText,'String');
projectData.config.TDPreStimulus = get(handles.TDPreStimulusText,'String');
projectData.config.TDPostStimulus = get(handles.TDPostStimulusText,'String');
projectData.config.resampleRate = get(handles.DSRateText,'String');
projectData.config.BLFrom = get(handles.BLFromText,'String');
projectData.config.BLTo = get(handles.BLToText,'String');
projectData.config.lpFreq = get(handles.LPFilterText,'String');
projectData.config.hpFreq = get(handles.HPFilterText,'String');
projectData.config.TFMethod = get(handles.TFMethodPopup,'Value');
projectData.config.TFMethodParam = get(handles.TFMethodParamText,'String');
projectData.config.FOIFrom = get(handles.FOIFromText,'String');
projectData.config.FOITo = get(handles.FOIToText,'String');
projectData.config.FOIStep = get(handles.FOIStepText,'String');
projectData.config.TOIFrom = get(handles.TOIFromText,'String');
projectData.config.TOITo = get(handles.TOIToText,'String');
projectData.config.TOIStep = get(handles.TOIStepText,'String');
projectData.config.TFBaselineType = get(handles.TFBaselinePopup,'Value');
projectData.config.logCheckbox = get(handles.logCheckbox,'Value');
projectData.config.logCheckboxEnable = get(handles.logCheckbox,'Enable');
projectData.config.TFBaselineFrom = get(handles.TFBaselineFromText,'String');
projectData.config.TFBaselineToText = get(handles.TFBaselineToText,'String');
projectData.config.channelsType = get(handles.channelsPopup,'Value');
projectData.config.featureType = get(handles.FEFeatureTypePopup,'Value');
projectData.config.frequencyText = get(handles.frequencyText,'String');
projectData.config.timeIntervalText = get(handles.timeIntervalText,'String');
projectData.config.FSCrossValidationType = get(handles.FSCrossValidationPopup,'Value');
projectData.config.FSSortingMethodType = get(handles.FSSortingMethodPopup,'Value');
projectData.config.FSSelectionMethodType = get(handles.FSSelectionMethodPopup,'Value');
projectData.config.FSLayoutType = get(handles.FSLayoutPopup,'Value');
projectData.config.FSFoldNum = get(handles.FSFoldNumText,'String');
projectData.config.FSSelectionMethodParam = get(handles.FSSelectionMethodParamText,'String');
projectData.config.FSSortingMethodParam = get(handles.FSSortingMethodParamText,'String');
projectData.config.FSLabelsDir = get(handles.FSLabelsDirText,'String');
projectData.config.classificationAlgType = get(handles.classificationAlgPopup,'Value');
setappdata(handles.figure1,'projectData',projectData);


% --------------------------------------------------------------------
function saveProjectMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to saveProjectMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if ~isempty(projectData)
    projectData = updateConfig(handles,projectData);
    save(strcat(projectData.projectDir,'\',projectData.projectName,'.mat'),'projectData');
end


% --------------------------------------------------------------------
function loadProjectMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to loadProjectMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.mat','Load Project');
if FileName(1,1)~=0 && PathName(1,1)~=0
    file = load(strcat(PathName,FileName));
    setappdata(handles.figure1,'projectData',file.projectData);
    %     addpath(file.projectData.fieldtripDir);
    %     addpath(file.projectData.MIDir);
    %     ft_defaults;
    names = fieldnames(file.projectData);
    set(handles.variablesList,'String',names);
    updateWindow(handles,file.projectData);
else
    return;
end


%
function updateWindow(handles,projectData)
set(handles.TDEventTypePopup,'Value',projectData.config.TDEventType);
set(handles.TDTrialFunctionPopup,'Value',projectData.config.TDTrialFunction);
set(handles.TDEventValueText,'String',projectData.config.TDEventValue);
set(handles.TDPreStimulusText,'String',projectData.config.TDPreStimulus);
set(handles.TDPostStimulusText,'String',projectData.config.TDPostStimulus);
set(handles.DSRateText,'String',projectData.config.resampleRate);
set(handles.BLFromText,'String',projectData.config.BLFrom);
set(handles.BLToText,'String',projectData.config.BLTo);
set(handles.LPFilterText,'String',projectData.config.lpFreq);
set(handles.HPFilterText,'String',projectData.config.hpFreq);
set(handles.TFMethodPopup,'Value',projectData.config.TFMethod);
set(handles.TFMethodParamText,'String',projectData.config.TFMethodParam);
set(handles.FOIFromText,'String',projectData.config.FOIFrom);
set(handles.FOIToText,'String',projectData.config.FOITo);
set(handles.FOIStepText,'String',projectData.config.FOIStep);
set(handles.TOIFromText,'String',projectData.config.TOIFrom);
set(handles.TOIToText,'String',projectData.config.TOITo);
set(handles.TOIStepText,'String',projectData.config.TOIStep);
set(handles.TFBaselinePopup,'Value',projectData.config.TFBaselineType);
set(handles.logCheckbox,'Value',projectData.config.logCheckbox);
set(handles.logCheckbox,'Enable',projectData.config.logCheckboxEnable);
set(handles.TFBaselineFromText,'String',projectData.config.TFBaselineFrom);
set(handles.TFBaselineToText,'String',projectData.config.TFBaselineToText);
set(handles.channelsPopup,'Value',projectData.config.channelsType);
set(handles.FEFeatureTypePopup,'Value',projectData.config.featureType);
set(handles.frequencyText,'String',projectData.config.frequencyText);
set(handles.timeIntervalText,'String',projectData.config.timeIntervalText);
set(handles.FSCrossValidationPopup,'Value',projectData.config.FSCrossValidationType);
set(handles.FSSortingMethodPopup,'Value',projectData.config.FSSortingMethodType);
set(handles.FSSelectionMethodPopup,'Value',projectData.config.FSSelectionMethodType);
set(handles.FSLayoutPopup,'Value',projectData.config.FSLayoutType);
set(handles.FSFoldNumText,'String',projectData.config.FSFoldNum);
set(handles.FSSelectionMethodParamText,'String',projectData.config.FSSelectionMethodParam);
set(handles.FSLabelsDirText,'String',projectData.config.FSLabelsDir);
set(handles.classificationAlgPopup,'Value',projectData.config.classificationAlgType);
set(handles.cuurentSubjectText,'String',projectData.subjectNames{projectData.currentSubject});



% --------------------------------------------------------------------
function addSubjectMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to addSubjectMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
prompt = {'Enter Subject Name:','Enter Subject`s Data File Path (.mat or .fif):'};
dlg_title = 'Add Subject';
num_lines = 1;
def = {'Subject',projectData.projectDir};
options.Resize='on';
answer = inputdlg(prompt,dlg_title,num_lines,def,options);
if ~isempty(answer)
    subjectNum = size(projectData.subjectNames,1);
    projectData.subjectNames{subjectNum+1,1} = answer{1};
    projectData.currentSubject = subjectNum+1;
    projectData.subjectDataPath{subjectNum+1,1} = answer{2};
    set(handles.cuurentSubjectText,'String',projectData.subjectNames{projectData.currentSubject});
    clearBuffer(handles);
    setappdata(handles.figure1,'projectData',projectData);
end


% --- Executes on button press in WSClearBut.
function WSClearBut_Callback(hObject, eventdata, handles)
% hObject    handle to WSClearBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in WSExportBut.
function WSExportBut_Callback(hObject, eventdata, handles)
% hObject    handle to WSExportBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function DSRateText_Callback(hObject, eventdata, handles)
% hObject    handle to DSRateText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DSRateText as text
%        str2double(get(hObject,'String')) returns contents of DSRateText as a double


% --- Executes during object creation, after setting all properties.
function DSRateText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DSRateText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FEFeatureTypePopup.
function FEFeatureTypePopup_Callback(hObject, eventdata, handles)
% hObject    handle to FEFeatureTypePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns FEFeatureTypePopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FEFeatureTypePopup


% --- Executes during object creation, after setting all properties.
function FEFeatureTypePopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FEFeatureTypePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function saveAsProjectMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to saveAsProjectMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if ~isempty(projectData)
    projectData = updateConfig(handles,projectData);
    [FileName,PathName] = uiputfile('*.mat','Save As Project ...','untitledPorject');
    projectData.projectName = regexprep(FileName,'.mat','');
    projectData.projectDir = PathName;
    setappdata(handles.figure1,'projectData',projectData);
    save(strcat(PathName,FileName),'projectData');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
button = questdlg('Do you want to save project before exit?','Saving Project','Yes');
switch button
    case 'Yes'
        projectData = getappdata(handles.figure1,'projectData');
        if ~isempty(projectData)
            projectData = updateConfig(handles,projectData);
            save(strcat(projectData.projectDir,'\',projectData.projectName,'.mat'),'projectData');
            delete(hObject);
        end
    case 'No'
        delete(hObject);
    case 'Cancel'
        return;
    case ''
        return;
end


% --------------------------------------------------------------------
function exitMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to exitMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure1_CloseRequestFcn(handles.figure1, eventdata, handles);


% --- Executes on button press in classifyBut.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to classifyBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in classificationAlgPopup.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to classificationAlgPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns classificationAlgPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from classificationAlgPopup


% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to classificationAlgPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in TDEventTypePopup.
function TDEventTypePopup_Callback(hObject, eventdata, handles)
% hObject    handle to TDEventTypePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns TDEventTypePopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TDEventTypePopup


% --- Executes during object creation, after setting all properties.
function TDEventTypePopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TDEventTypePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TDEventValueText_Callback(hObject, eventdata, handles)
% hObject    handle to TDEventValueText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TDEventValueText as text
%        str2double(get(hObject,'String')) returns contents of TDEventValueText as a double


% --- Executes during object creation, after setting all properties.
function TDEventValueText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TDEventValueText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TDPreStimulusText_Callback(hObject, eventdata, handles)
% hObject    handle to TDPreStimulusText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TDPreStimulusText as text
%        str2double(get(hObject,'String')) returns contents of TDPreStimulusText as a double


% --- Executes during object creation, after setting all properties.
function TDPreStimulusText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TDPreStimulusText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TDPostStimulusText_Callback(hObject, eventdata, handles)
% hObject    handle to TDPostStimulusText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TDPostStimulusText as text
%        str2double(get(hObject,'String')) returns contents of TDPostStimulusText as a double


% --- Executes during object creation, after setting all properties.
function TDPostStimulusText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TDPostStimulusText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in TDTrialFunctionPopup.
function TDTrialFunctionPopup_Callback(hObject, eventdata, handles)
% hObject    handle to TDTrialFunctionPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns TDTrialFunctionPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TDTrialFunctionPopup


% --- Executes during object creation, after setting all properties.
function TDTrialFunctionPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TDTrialFunctionPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nextSubjectBut.
function nextSubjectBut_Callback(hObject, eventdata, handles)
% hObject    handle to nextSubjectBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
subjectNum = size(projectData.subjectNames,1);
if projectData.currentSubject+1 <= subjectNum
    projectData.currentSubject = projectData.currentSubject+1;
elseif projectData.currentSubject+1 > subjectNum
    projectData.currentSubject = 1;
end
set(handles.cuurentSubjectText,'String',projectData.subjectNames{projectData.currentSubject});
clearBuffer(handles);
setappdata(handles.figure1,'projectData',projectData);


% --- Executes on button press in previousSubjectBut.
function previousSubjectBut_Callback(hObject, eventdata, handles)
% hObject    handle to previousSubjectBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
subjectNum = size(projectData.subjectNames,1);
if projectData.currentSubject-1 > 0
    projectData.currentSubject = projectData.currentSubject-1;
elseif projectData.currentSubject-1 == 0
    projectData.currentSubject = subjectNum;
end
set(handles.cuurentSubjectText,'String',projectData.subjectNames{projectData.currentSubject});
clearBuffer(handles);
setappdata(handles.figure1,'projectData',projectData);


function clearBuffer(handles)
% handles    structure with handles and user data (see GUIDATA)
if isappdata(handles.figure1,'data')
    rmappdata(handles.figure1,'data');
end
if isappdata(handles.figure1,'preprocessedData')
    rmappdata(handles.figure1,'preprocessedData');
end
if isappdata(handles.figure1,'data_tf')
    rmappdata(handles.figure1,'data_tf');
end
if isappdata(handles.figure1,'features')
    rmappdata(handles.figure1,'features');
end
if isappdata(handles.figure1,'sortedFeatureIndices')
    rmappdata(handles.figure1,'sortedFeatureIndices');
end
if isappdata(handles.figure1,'featureScores')
    rmappdata(handles.figure1,'featureScores');
end
if isappdata(handles.figure1,'bestN')
    rmappdata(handles.figure1,'bestN');
end
if isappdata(handles.figure1,'crossValidationIndices')
    rmappdata(handles.figure1,'crossValidationIndices');
end
if isappdata(handles.figure1,'targets')
    rmappdata(handles.figure1,'targets');
end

% --------------------------------------------------------------------
function clearBufferMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to clearBufferMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isappdata(handles.figure1,'data')
    rmappdata(handles.figure1,'data');
end
if isappdata(handles.figure1,'preprocessedData')
    rmappdata(handles.figure1,'preprocessedData');
end
if isappdata(handles.figure1,'data_tf')
    rmappdata(handles.figure1,'data_tf');
end
if isappdata(handles.figure1,'features')
    rmappdata(handles.figure1,'features');
end
if isappdata(handles.figure1,'sortedFeatureIndices')
    rmappdata(handles.figure1,'sortedFeatureIndices');
end
if isappdata(handles.figure1,'featureScores')
    rmappdata(handles.figure1,'featureScores');
end
if isappdata(handles.figure1,'bestN')
    rmappdata(handles.figure1,'bestN');
end
if isappdata(handles.figure1,'crossValidationIndices')
    rmappdata(handles.figure1,'crossValidationIndices');
end



function FSSortingMethodParamText_Callback(hObject, eventdata, handles)
% hObject    handle to FSSortingMethodParamText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FSSortingMethodParamText as text
%        str2double(get(hObject,'String')) returns contents of FSSortingMethodParamText as a double


% --- Executes during object creation, after setting all properties.
function FSSortingMethodParamText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FSSortingMethodParamText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in batchFeatureExtractionBut.
function batchFeatureExtractionBut_Callback(hObject, eventdata, handles)
% hObject    handle to batchFeatureExtractionBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projectData = getappdata(handles.figure1,'projectData');
if isempty(projectData)
    errordlg('Please define a new project or load existed project.');
    return;
end
[featuresFileName,featuresPathName] = uigetfile(strcat(projectData.projectDir,'\Time-Frequency Analysis Results\*.mat'),'Loaing Time-Frequency Data','MultiSelect','on');
try
    batchSize = length(featuresFileName);
    for k = 1 : batchSize
        file = load(strcat(featuresPathName,featuresFileName{k}));
        data_tf = file.data_tf;
        if (get(handles.FEFeatureTypePopup,'Value') == 1 || get(handles.FEFeatureTypePopup,'Value') == 2 || get(handles.FEFeatureTypePopup,'Value') == 5)
            if ~iscell(data_tf.powspctrm)
                checkData.channelNum = length(data_tf.label);
                checkData.freqNum = length(data_tf.freq);
                checkData.timeNum = length(data_tf.time);
                checkData.nanFreq = [];
                checkData.nanTime = [];
                for i = 1 :  size(data_tf.powspctrm,3)
                    if sum(isnan(squeeze(data_tf.powspctrm(1,1,i,:)))) == size(data_tf.powspctrm,4)
                        checkData.nanFreq = [checkData.nanFreq i];
                    end
                end
                for i = 1 :  size(data_tf.powspctrm,4)
                    if sum(isnan(squeeze(data_tf.powspctrm(1,1,:,i)))) == size(data_tf.powspctrm,3)
                        checkData.nanTime = [checkData.nanTime i];
                    end
                end
                [flag, message] = sanityCheck(handles,checkData,'Time-Frequency Feature Extraction');
                if flag == 0
                    errordlg(message);
                    return;
                end
                switch get(handles.channelsPopup,'Value')
                    case 1
                        channels = 'Grad';
                        channelNum = 102;
                        projectData.label = data_tf.label(1:102,:);
                    case 2
                        channels = 'Mag';
                        channelNum = 102;
                        projectData.label = data_tf.label(103:204,:);
                    case 3
                        channels = 'Both';
                        channelNum = size(data_tf.powspctrm,2);
                        projectData.label = data_tf.label;
                end
                projectData.grad = data_tf.grad;
                projectData.cfg = data_tf.cfg;
                frequencies = eval(get(handles.frequencyText,'String'));
                timeIntervals = eval(get(handles.timeIntervalText,'String'));
                setappdata(handles.figure1,'channelNum',channelNum);
                [features{k},projectData] = featureExtraction (data_tf,channels,channelNum,frequencies,timeIntervals,handles,projectData,get(handles.FEFeatureTypePopup,'Value'));
            else
                checkData.channelNum = length(data_tf.label);
                checkData.freqNum = length(data_tf.freq);
                for i = 1 : length(data_tf.time)
                    checkData.timeNum{i} = length(data_tf.time{i});
                end
                checkData.nanFreq = [];
                for i = 1 :  size(data_tf.powspctrm{1},2)
                    if sum(isnan(squeeze(data_tf.powspctrm{1}(1,i,:)))) == size(data_tf.powspctrm{1},3)
                        checkData.nanFreq = [checkData.nanFreq i];
                    end
                end
                [flag, message] = sanityCheck(handles,checkData,'Time-Frequency Feature Extraction');
                if flag == 0
                    errordlg(message);
                    return;
                end
                switch get(handles.channelsPopup,'Value')
                    case 1
                        channels = 'Grad';
                        channelNum = 102;
                        projectData.label = data_tf.label(1:102,:);
                    case 2
                        channels = 'Mag';
                        channelNum = 102;
                        projectData.label = data_tf.label(103:204,:);
                    case 3
                        channels = 'Both';
                        channelNum = size(data_tf.powspctrm{1},1);
                        projectData.label = data_tf.label;
                end
                projectData.grad = data_tf.grad;
                projectData.cfg = data_tf.cfg;
                frequencies = eval(get(handles.frequencyText,'String'));
                timePortions = eval(get(handles.timeIntervalText,'String'));
                if size(timePortions,2) == 2 && round(timePortions(1,2))>1
                    for i = 1 : length(data_tf.time)
                        timeIntervals{i} = timePortions;
                    end
                else
                    for i = 1 : length(data_tf.time)
                        timeIntervals{i}(1,:) = [1 floor(max(data_tf.time{i})*timePortions(1))];
                        for j = 2 : length(timePortions)
                            timeIntervals{i}(j,:) = [timeIntervals{i}(j-1,2)+1  timeIntervals{i}(j-1,2)+floor(max(data_tf.time{i})*timePortions(j))];
                        end
                    end
                end
                setappdata(handles.figure1,'channelNum',channelNum);
                [features{k},projectData] = featureExtraction (data_tf,channels,channelNum,frequencies,timeIntervals,handles,projectData,get(handles.FEFeatureTypePopup,'Value'));
            end
        elseif get(handles.FEFeatureTypePopup,'Value') == 6
            return;
        end
        clear data_tf;
    end
catch
    errordlg('Please press button again and specify valid file.');
    return;
end
setappdata(handles.figure1,'features',features);
[FileName,PathName] = uiputfile('*.mat','Saving Features',strcat(projectData.projectDir,'\Features\',projectData.subjectNames{projectData.currentSubject},'_Features.mat'));
if FileName(1,1) ~= 0 && PathName(1,1) ~=0
    save(strcat(PathName,FileName),'features');
end


% --------------------------------------------------------------------
function aboutMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to aboutMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('MEGDecoder: A MATLAB GUI for MEG data decoding (developed by Seyed Mostafa Kia-2013, email:m.kia83@gmail.com)','About ...');
