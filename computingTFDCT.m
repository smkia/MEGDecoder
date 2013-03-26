function [features] = computingTFDCT(data,mode,channelNum,frequencies,timeIntervals)
n = size(data.powspctrm,1);
data.powspctrm(isnan(data.powspctrm)) = 0;
switch mode
    case 'Grad'
        chIndex = 1:102;
    case 'Mag'
        chIndex = 103:204;
    case 'Both'
        chIndex = 1:channelNum;
end
features = zeros(channelNum*frequencies(1,1)*timeIntervals(1,1),n);
h = waitbar(0,'Please wait...');
for clipNum = 1 : n
    clipData = squeeze(data.powspctrm(clipNum,chIndex,:,:));
    clipData(isnan(clipData)) = 0;
    for channelNum = 1 : channelNum
        channelData = squeeze(clipData(channelNum,:,:));
        D = dct2(channelData);
        features((channelNum-1)*frequencies(1,1)*timeIntervals(1,1)+1:(channelNum)*frequencies(1,1)*timeIntervals(1,1),clipNum) ...
            = reshape(D(1:frequencies(1,1),1:timeIntervals(1,1)),frequencies(1,1)*timeIntervals(1,1),1);
    end
    waitbar(clipNum/n);
end
delete(h);