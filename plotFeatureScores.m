function [] = plotFeatureScores(featureScores,sortedFeatureIndices,freqNum,timeIntervalNum,plotFormat,layout,projectData)
%plotFeatureScores function plots all feature scores on head layout.
%   plotFeatureScores(featureScores,freqNum,timeIntervalNum,plotFormat,layo
%   ut)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013
foldNum = size(featureScores,2);
allScores = [];
if projectData.config.FSSortingMethodType == 2 || projectData.config.FSSortingMethodType == 3
    for i = 1 : foldNum
        a(sortedFeatureIndices{1,i}) = featureScores{1,i};
        allScores = [allScores;a];
    end
else
    for i = 1 : foldNum
        allScores = [allScores;featureScores{i}];
    end
end
scores = mean(allScores);
featureNum = size(scores,2);
channelFeatureNum =freqNum*timeIntervalNum;
channelFeatures = [];
for i = 1 : featureNum
    if mod(i,channelFeatureNum) == 0
        channelFeatures = [channelFeatures scores(1,i-channelFeatureNum+1:i)'];
    end
end
cfg = [];
cfg.layout = layout;
cfg.comment = 'no';
cfg.zlim(1,1) = min(min(channelFeatures));
cfg.zlim(1,2) = max(max(channelFeatures));
cfg.interpolation = 'v4';
figure;
if freqNum == 1
    freqNum = 2;
    timeIntervalNum = round(timeIntervalNum/2);
end
for i = 1 : channelFeatureNum
    plotFormat.powspctrm = channelFeatures(i,:);
    subplot(freqNum,timeIntervalNum,i);
    ft_topoplotTFR(cfg,plotFormat);
end