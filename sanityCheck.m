function [flag ,message] = sanityCheck(handles,checkData,type)
%sanityCheck function checks sanity of input variables.
%   [flag message] = sanityCheck(handles,checkData,type)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013

flag = 1;
message = '';
projectData = getappdata(handles.figure1,'projectData');
switch type
    case 'Trial Defining'
        if isnan(str2double(get(handles.TDEventValueText,'String'))) || isnan(str2double(get(handles.TDPreStimulusText,'String'))) || isnan(str2double(get(handles.TDPostStimulusText,'String'))) 
            flag = 0;
            message = 'Please fill all required fields with valid values';
            return;
        elseif -str2double(get(handles.TDPreStimulusText,'String')) < checkData.minTime || str2double(get(handles.TDPostStimulusText,'String')) > checkData.maxTime
            flag = 0;
            message = 'Specified trial interval is not valid.';
            return;
        end
    case 'Preprocessing'
        if (~isnan(str2double(get(handles.DSRateText,'String'))) && str2double(get(handles.DSRateText,'String')) >= checkData.fSample) ...
                || (~isnan(str2double(get(handles.DSRateText,'String'))) && str2double(get(handles.DSRateText,'String')) < 1)
            flag = 0;
            message = 'Resampling rate is not valid.';
            return;
        elseif (~isnan(str2double(get(handles.BLFromText,'String'))) && str2double(get(handles.BLFromText,'String')) < checkData.minTime) ...
                || (~isnan(str2double(get(handles.BLToText,'String'))) && str2double(get(handles.BLToText,'String')) > checkData.maxTime)
            flag = 0;
            message = 'Baseline window is not valid.';
            return;
        elseif (~isnan(str2double(get(handles.LPFilterText,'String'))) && str2double(get(handles.LPFilterText,'String')) < 0) ...
                || (~isnan(str2double(get(handles.LPFilterText,'String'))) && str2double(get(handles.LPFilterText,'String')) > checkData.fSample)
            flag = 0;
            message = 'Filters are not valid.';
            return;
        end
    case 'TFAnalysis'
        %toi = str2double(get(handles.TOIFromText,'String')):str2double(get(handles.TOIStepText,'String')):str2double(get(handles.TOIToText,'String'));
        if isnan(str2double(get(handles.TOIToText,'String')))
            if strcmp(get(handles.TOIToText,'String'),'end')
                TOIEnd = checkData.maxTime;
            else
                flag = 0;
                message = 'Please fill "toi to" field with valid value';
                return;
            end
        else
            TOIEnd = str2double(get(handles.TOIToText,'String'));
        end
        if isnan(str2double(get(handles.FOIFromText,'String'))) || isnan(str2double(get(handles.FOIToText,'String'))) || isnan(str2double(get(handles.FOIStepText,'String'))) ...
                || isnan(str2double(get(handles.TOIFromText,'String'))) || isnan(str2double(get(handles.TOIStepText,'String')))
            flag = 0;
            message = 'Please fill all required fields with valid values';
            return;
        elseif ~isnan(str2double(get(handles.TFMethodParamText,'String'))) && str2double(get(handles.TFMethodParamText,'String')) < 1
            flag = 0;
            message = 'Time-Frequency analysis Parameter is not valid.';
            return;
        elseif str2double(get(handles.FOIFromText,'String')) < str2double(projectData.config.hpFreq) || str2double(get(handles.FOIToText,'String')) > str2double(projectData.config.lpFreq) || str2double(get(handles.FOIStepText,'String')) < 0
            flag = 0;
            message = 'Frequency of interest parameters are not valid.';
            return;
        elseif str2double(get(handles.TOIFromText,'String')) < checkData.minTime || TOIEnd > checkData.maxTime || str2double(get(handles.TOIStepText,'String')) < 0
            flag = 0;
            message = 'Time of interest parameters are not valid.';
            return;
        elseif (~isnan(str2double(get(handles.TFBaselineFromText,'String'))) && str2double(get(handles.TFBaselineFromText,'String')) < checkData.minTime) || ...
                (~isnan(str2double(get(handles.TFBaselineToText,'String'))) && str2double(get(handles.TFBaselineToText,'String')) > checkData.maxTime)
            flag = 0;
            message = 'Baseline window is not valid.';
            return;
%         elseif ~ismember(str2double(get(handles.TFBaselineFromText,'String')),toi) || ~ismember(str2double(get(handles.TFBaselineToText,'String')),toi)
%             flag = 0;
%             message = 'Baseline window is not valid.';
%             return;
        end
    case 'Time-Frequency Feature Extraction'
        if checkData.channelNum ~= 306 && checkData.channelNum ~= 204 && checkData.channelNum ~= 102
            if get(handles.channelsPopup,'Value') ~= 3
                flag = 0;
                message = 'It is not Neuromag data.';
                return;
            end
        end
        if get(handles.FEFeatureTypePopup,'Value') == 1
            try
                freq = eval(get(handles.frequencyText,'String'));
            catch
                flag = 0;
                message = 'Syntax error in frequency field.';
                return;
            end
            if isempty(freq)
                flag = 0;
                message = 'Please fill frequency field with valid values.';
                return;
            end
            for i = 1 : size(freq,1)
                for j = 1 : length(checkData.nanFreq)
                    if checkData.nanFreq(j) >= freq(i,1) && checkData.nanFreq(j) <= freq(i,2)
                        flag = 0;
                        message = strcat('Data at frequency ',num2str(checkData.nanFreq(j)),' just contains NaN values.');
                        return;
                    end
                end
            end
            try
                time = eval(get(handles.timeIntervalText,'String'));
            catch
                flag = 0;
                message = 'Syntax error in time interval field.';
                return;
            end
            if isempty(time)
                flag = 0;
                message = 'Please fill time interval field with valid values.';
                return;
            end
            if isfield(checkData,'nanTime')
                for i = 1 : size(time,1)
                    for j = 1 : length(checkData.nanTime)
                        if checkData.nanTime(j) >= time(i,1) && checkData.nanTime(j) <= time(i,2)
                            flag = 0;
                            message = strcat('Data at time ',num2str(checkData.nanTime(j)),' just contains NaN values.');
                            return;
                        end
                    end
                end
            end
        elseif get(handles.FEFeatureTypePopup,'Value') == 2
            try
                freq = eval(get(handles.frequencyText,'String'));
            catch
                flag = 0;
                message = 'Syntax error in frequency field.';
                return;
            end
            if isempty(freq)
                flag = 0;
                message = 'Please fill frequency field with valid values.';
                return;
            elseif freq(1,1)<1 || freq(1,1)> checkData.freqNum
                flag = 0;
                message = 'Out of range frequency.';
                return;
            end
            try
                time = eval(get(handles.timeIntervalText,'String'));
            catch
                flag = 0;
                message = 'Syntax error in time interval field.';
                return;
            end
            if isempty(time)
                flag = 0;
                message = 'Please fill time interval field with valid values.';
                return;
            elseif time(1,1)<1 %|| time(1,1)> min(cell2mat(checkData.timeNum))
                flag = 0;
                message = 'Out of range time bins.';
                return;
            end
        end
    case 'Time Feature Extraction'
        if checkData.channelNum ~= 306 && checkData.channelNum ~= 204 && checkData.channelNum ~= 102
            if get(handles.channelsPopup,'Value') ~= 3
                flag = 0;
                message = 'It is not Neuromag data.';
                return;
            end
        end
        if get(handles.FEFeatureTypePopup,'Value') == 3
            try
                time = eval(get(handles.timeIntervalText,'String'));
            catch
                flag = 0;
                message = 'Syntax error in time interval field.';
                return;
            end
            if isempty(time)
                flag = 0;
                message = 'Please fill time interval field with valid values.';
                return;
            end
        elseif get(handles.FEFeatureTypePopup,'Value') == 4
            try
                time = eval(get(handles.timeIntervalText,'String'));
            catch
                flag = 0;
                message = 'Syntax error in time interval field.';
                return;
            end
            if isempty(time)
                flag = 0;
                message = 'Please fill time interval field with valid values.';
                return;
            end
            if time(1,1)<1 || time(1,1)> checkData.timeNum
                flag = 0;
                message = 'Out of range time bins.';
                return;
            end
        end
    case 'Feature Selection'
        if checkData.foldNum >= checkData.featureNum/2
            flag = 0;
            message = 'Use lower fold number.';
            return;
        end
        if checkData.selectionMethod == 1
            if checkData.selectionMethodParam > checkData.featureNum || checkData.selectionMethodParam < 0
                flag = 0;
                message = strcat('Feature Number must be greater than zero and less than ',num2str(checkData.featureNum),'.');
                return;
            end
        elseif checkData.selectionMethod == 2
            if checkData.selectionMethodParam > 1 || checkData.selectionMethodParam < 0
                flag = 0;
                message = strcat('Threshold must be between 0 and 1.');
                return;
            end
        end
        if checkData.sortingMethod == 2 || checkData.sortingMethod == 3
            if checkData.sortingMethodParam > checkData.featureNum || checkData.sortingMethodParam < 0
                flag = 0;
                message = strcat('Feature Number must be greater than zero and less than ',num2str(checkData.featureNum),'.');
                return;
            end    
        end
        if ~iscell(checkData.targets) || length(checkData.targets) ~= checkData.sampleNum;
            flag = 0;
            message = strcat('Enter proper labels.');
            return;
        end
end
