function [features] = computingTDCT(data,channels,chNum,timeIntervals)
n = size(data.trial,1);
timeNum = timeIntervals;
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
        channelData = squeeze(clipData(i,:));
        D = dct(channelData);
        features((i-1)*timeIntervals(1,1)+1:i*timeIntervals(1,1),clipNum)= D(1:timeIntervals);
    end
    waitbar(clipNum/n);
end
delete(h);