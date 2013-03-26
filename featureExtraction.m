function [features,projectData] = featureExtraction (data_tf,channels,channelNum,frequencies,timeIntervals,handles,projectData,type)
%featureExtraction function extracts different kinds of features from temporal or time-frequency data_tf.
%   [features,projectData] = featureExtraction (data_tf,channels,channelNum,frequencies,timeIntervals,handles,projectData,type)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013
if iscell(data_tf.powspctrm)
    n = length(data_tf.powspctrm);
else
    n = size(data_tf.powspctrm,1);
end
switch channels
    case 'Grad'
        chIndex = 1:102;
    case 'Mag'
        chIndex = 103:204;
    case 'Both'
        chIndex = 1:channelNum;
end
h = waitbar(0,'Please wait...');
switch type
    case 1 % Time-Frequency normal features
        if ~iscell(timeIntervals)
            freqNum = size(frequencies,1);
            setappdata(handles.figure1,'freqNum',freqNum);
            timeNum = size(timeIntervals,1);
            setappdata(handles.figure1,'timeIntervalNum',timeNum);
            features = zeros(channelNum*freqNum*timeNum,n);
            for clipNum = 1 : n
                clipData = squeeze(data_tf.powspctrm(clipNum,chIndex,:,:));
                clipData(isnan(clipData)) = 0;
                for i = 1 : channelNum
                    for j = 1 : freqNum
                        for k = 1 : timeNum
                            features((i-1)*freqNum*timeNum +(j-1)*timeNum +k ,clipNum) = mean(mean(squeeze(clipData(i,frequencies(j,1):frequencies(j,2),timeIntervals(k,1):timeIntervals(k,2)))));
                        end
                    end
                end
                waitbar(clipNum/n);
            end
        else
            freqNum = size(frequencies,1);
            setappdata(handles.figure1,'freqNum',freqNum);
            timeNum = size(timeIntervals{1},1);
            setappdata(handles.figure1,'timeIntervalNum',timeNum);
            features = zeros(channelNum*freqNum*timeNum,n);
            for clipNum = 1 : n
                clipData = squeeze(data_tf.powspctrm{clipNum}(chIndex,:,:));
                clipData(isnan(clipData)) = 0;
                for i = 1 : channelNum
                    for j = 1 : freqNum
                        for k = 1 : timeNum
                            features((i-1)*freqNum*timeNum +(j-1)*timeNum +k ,clipNum) = mean(mean(squeeze(clipData(i,frequencies(j,1):frequencies(j,2),timeIntervals{clipNum}(k,1):timeIntervals{clipNum}(k,2)))));
                        end
                    end
                end
                waitbar(clipNum/n);
            end
        end
    case 2 % Time-Frequency DCT features
        freqNum = frequencies(1,1);
        setappdata(handles.figure1,'freqNum',freqNum);
        timeNum = timeIntervals(1,1);
        setappdata(handles.figure1,'timeIntervalNum',timeNum);
        features = zeros(channelNum*frequencies(1,1)*timeIntervals(1,1),n);
        if ~iscell(data_tf.powspctrm)
            for clipNum = 1 : n
                clipData = squeeze(data_tf.powspctrm(clipNum,chIndex,:,:));
                clipData(isnan(clipData)) = 0;
                %             for j = 1 : size(clipData,2)
                %                 if sum(clipData(1,j,:),2) == 0
                %                     freqStart = j+1;
                %                 else
                %                     break;
                %                 end
                %             end
                for i = 1 : channelNum
                    channelData = squeeze(clipData(i,1:end,timeIntervals(1,2):end));
                    D = dct2(channelData);
                    features((i-1)*frequencies(1,1)*timeIntervals(1,1)+1:(i)*frequencies(1,1)*timeIntervals(1,1),clipNum) ...
                        = reshape(D(1:frequencies(1,1),1:timeIntervals(1,1)),frequencies(1,1)*timeIntervals(1,1),1);
                end
                waitbar(clipNum/n);
            end
        else
            for clipNum = 1 : n
                clipData = squeeze(data_tf.powspctrm{clipNum}(chIndex,:,:));
                clipData(isnan(clipData)) = 0;
                for i = 1 : channelNum
                    channelData = squeeze(clipData(i,1:end,timeIntervals(1,2):end));
                    meanChannelData = mean(mean(channelData));
                    channelData(channelData==0) = meanChannelData;
                    padedChannelData = zeros(size(channelData)+2);
                    padedChannelData(2:end-1,2:end-1) = channelData;
                    D = dct2(padedChannelData);
                    features((i-1)*frequencies(1,1)*timeIntervals(1,1)+1:(i)*frequencies(1,1)*timeIntervals(1,1),clipNum) ...
                        = reshape(D(1:frequencies(1,1),1:timeIntervals(1,1)),frequencies(1,1)*timeIntervals(1,1),1);
                end
                waitbar(clipNum/n);
            end
        end
    case 3 % Normal temporal features
        freqNum = 1;
        timeNum = size(timeIntervals,1);
        setappdata(handles.figure1,'timeIntervalNum',timeNum);
        features = zeros(channelNum*timeNum,n);
        for clipNum = 1 : n
            clipData = squeeze(data_tf.trial(clipNum,chIndex,:));
            clipData(isnan(clipData)) = 0;
            for i = 1 : channelNum
                for k = 1 : timeNum
                    features((i-1)*timeNum + k ,clipNum) = mean(squeeze(clipData(i,timeIntervals(k,1):timeIntervals(k,2))));
                end
            end
            waitbar(clipNum/n);
        end
    case 4 % DCT temporal features
        freqNum = 1;
        timeNum = timeIntervals(1,1);
        setappdata(handles.figure1,'timeIntervalNum',timeNum);
        features = zeros(channelNum*timeNum,n);
        for clipNum = 1 : n
            clipData = squeeze(data_tf.trial(clipNum,chIndex,:));
            clipData(isnan(clipData)) = 0;
            for i = 1 : channelNum
                channelData = squeeze(clipData(i,:));
                D = dct(channelData);
                features((i-1)*timeIntervals(1,1)+1:i*timeIntervals(1,1),clipNum)= D(1:timeIntervals);
            end
            waitbar(clipNum/n);
        end
    case 5
        freqNum = frequencies(1,2);
        setappdata(handles.figure1,'freqNum',freqNum);
        timeNum =frequencies(1,3);
        setappdata(handles.figure1,'timeIntervalNum',timeNum);
        channelCoefNum = frequencies(1,1);
        features = zeros(channelCoefNum*freqNum*timeNum,n);
        if ~iscell(data_tf.powspctrm)
            for clipNum = 1 : n
                clipData = squeeze(data_tf.powspctrm(clipNum,chIndex,:,:));
                clipData(isnan(clipData)) = 0;
                clipData = permute(clipData,[2 3 1]);
                D = dct3(clipData(timeIntervals(1,1):end,timeIntervals(1,2):end-1,:));
                D = permute(D,[3 1 2]);
                features(:,clipNum) = reshape(D(1:channelCoefNum,1:freqNum,1:timeNum),channelCoefNum*freqNum*timeNum,1);
                waitbar(clipNum/n);
            end
        else
            for clipNum = 1 : n
                clipData = squeeze(data_tf.powspctrm{clipNum}(chIndex,:,:));
                clipData(isnan(clipData)) = 0;
                clipData = permute(clipData,[2 3 1]);
                D = dct3(clipData(timeIntervals{1}(1,1):end,timeIntervals{1}(1,2):end-1,:));
                D = permute(D,[3 1 2]);
                features(:,clipNum) = reshape(D(1:channelCoefNum,1:freqNum,1:timeNum),channelCoefNum*freqNum*timeNum,1);
                waitbar(clipNum/n);
            end
        end
        %
    case 6 % Correlation on temporal features
        freqNum = 1;
        timeNum = 1;
        setappdata(handles.figure1,'timeIntervalNum',timeNum);
        features = zeros(channelNum*channelNum,n);
        for clipNum = 1 : n
            clipData = squeeze(data_tf.trial(clipNum,chIndex,:));
            clipData(isnan(clipData)) = 0;
            index = 1;
            for i = 1 : channelNum
                for j = i+1 : channelNum
                    features(index,clipNum) = corr(clipData(i,:)',clipData(j,:)');
                    index = index + 1;
                end
            end
            waitbar(clipNum/n);
        end
    case 7 % Correlation on Time-Frequency features
        freqNum = 1;
        setappdata(handles.figure1,'freqNum',freqNum);
        timeNum = 1;
        setappdata(handles.figure1,'timeIntervalNum',timeNum);
        features = zeros(channelNum*channelNum,n);
        for clipNum = 1 : n
            clipData = squeeze(data_tf.powspctrm(clipNum,chIndex,:,:));
            clipData(isnan(clipData)) = 0;
            index = 1;
            for i = 1 : channelNum
                for j = i+1 : channelNum
                    features(index,clipNum) = corr2(squeeze(clipData(i,:,:)),squeeze(clipData(j,:,:)));
                    index = index + 1;
                end
            end
            waitbar(clipNum/n);
        end
end
projectData.channelNum = channelNum;
projectData.freqNum = freqNum;
projectData.timeIntervalNum = timeNum;
features = mapstd(features);
delete(h);