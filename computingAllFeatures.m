function [features] = computingAllFeatures(data,channels,chNum,frequencies,timeIntervals)
n = size(data.powspctrm,1);
freqNum = size(frequencies,1);
timeNum = size(timeIntervals,1);
switch channels
    case 'Grad'
        chIndex = 1:102;
    case 'Mag'
        chIndex = 103:204;
    case 'Both'
        chIndex = 1:chNum;
end
features = zeros(chNum*freqNum*timeNum,n);
h = waitbar(0,'Please wait...');
for clipNum = 1 : n
    clipData = squeeze(data.powspctrm(clipNum,chIndex,:,:));
    clipData(isnan(clipData)) = 0;
    for i = 1 : chNum
        for j = 1 : freqNum
            for k = 1 : timeNum
                features((i-1)*freqNum*timeNum +(j-1)*timeNum +k ,clipNum) = mean(mean(squeeze(clipData(i,frequencies(j,1):frequencies(j,2),timeIntervals(k,1):timeIntervals(k,2)))));
            end
        end
    end
    waitbar(clipNum/n);
end
delete(h);