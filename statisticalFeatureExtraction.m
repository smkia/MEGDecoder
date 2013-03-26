function [features] = statisticalFeatureExtraction(data,toi)
sampleNum = length(data.trial);
[channelNum, timeNum] = size(data.trial{1});
hp = [7 15 30];
lp = [15 30 45];
% features = zeros(3*channelNum*11,sampleNum);
features = cell(1,sampleNum);
for i = 1 : 3
    cfg = [];
    cfg.channel = {'MEG'};
    cfg.demean = 'no';
    cfg.lpfreq = lp(i);
    cfg.lpfilter = 'yes';
    cfg.hpfreq = hp(i);
    cfg.hpfilter = 'yes';
    dataTemp =[];
    dataTemp = ft_preprocessing(cfg,data);
    for j = 1 : sampleNum
        channelFeatures = zeros(11,1);
        for k = 1 : channelNum
            signal = dataTemp.trial{j}(k,round(toi(1)*dataTemp.fsample+1):round(toi(2)*dataTemp.fsample));
            X = [ones(length(signal),1) (1:length(signal))'];
            B = X \ signal(:);
            res = signal(:) - X*B;
            channelFeatures(1) = mean(signal);
            channelFeatures(2) = B(2);
            channelFeatures(3) = var(res);
            channelFeatures(4) = std(res);
            channelFeatures(5) = skewness(res);
            channelFeatures(6) = kurtosis(res);
            channelFeatures(7) = var(signal);
            channelFeatures(8) = std(signal);
            channelFeatures(9) = skewness(signal);
            channelFeatures(10) = kurtosis(signal);
            F = double(diff(signal) >= 0);
            F(F == 0) = -1;
            channelFeatures(11) = abs(sum(F))/length(F);
            features{1,j} = [features{1,j};channelFeatures];
        end
    end
    disp(i);
end
features = cell2mat(features);