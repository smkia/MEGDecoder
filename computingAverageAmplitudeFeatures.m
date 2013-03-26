function [features] = computingAverageAmplitudeFeatures(data,channels,chNum,timeIntervals)
n = size(data.trial,1);
timeNum = size(timeIntervals,1);
switch channels
    case 'Grad'
        chIndex = 1:102;
    case 'Mag'
        chIndex = 103:204;
    case 'Both'
        chIndex = 1:chNum;
end
features = zeros(chNum*timeNum,n);
h = waitbar(0,'Please wait...');
for clipNum = 1 : n
    clipData = squeeze(data.trial(clipNum,chIndex,:));
    clipData(isnan(clipData)) = 0;
    for i = 1 : chNum
        for k = 1 : timeNum
            features((i-1)*timeNum + k ,clipNum) = mean(squeeze(clipData(i,timeIntervals(k,1):timeIntervals(k,2))));
        end
    end
    waitbar(clipNum/n);
end
delete(h);