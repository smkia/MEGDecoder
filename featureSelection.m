function [sortedFeatureIndices,featureScores,bestN,train, test] = featureSelection(features,group,cfg)
%featureSelection function selects effective features for classification.
%   [sortedFeatureIndices,featureScores,bestN,crossValidationIndices] = featureSelection(features,group,cfg)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013
[featureNum sampleNum] = size(features);
c{1} = group{1,1};
for i = 2 : sampleNum
    if ~strcmp(group{i,1},c{1})
        c{2} = group{i,1};
        break;
    end
end
for j = 1 :sampleNum
    if strcmp(group{j,1},c{1})
        temp(j,1) = 1;
    else
        temp(j,1) = 0;
    end
end
cfg.minTrainingSamples = min([sum(temp) sum(imcomplement(temp))]);
switch cfg.crossValidationMethod
    case 1
        [crossValidationIndices] = crossvalind('Kfold',group,cfg.foldNum);
        for i = 1 : cfg.foldNum
            test{i} = (crossValidationIndices == i); train{i} = ~test{i};
        end
    case 2
        [crossValidationIndices] = 1:sampleNum;
        cfg.foldNum = sampleNum;
        for i = 1 : cfg.foldNum
            test{i} = (crossValidationIndices == i); train{i} = ~test{i};
        end
    case 3
        cfg.foldNum = sampleNum;
        for i = 1 : cfg.foldNum
            %             [train{i}, test{i}] = crossvalind('LeaveMOut',group,1, 'Min', cfg.minTrainingSamples);
            [train{i}, test{i}] = crossvalind('LeaveMOut',group,1);
        end
end
h = waitbar(0,'Please wait...');
for i = 1 : cfg.foldNum
    %test = (crossValidationIndices == i); train = ~test;
    t = group(train{i});
    trainT = zeros(sum(train{i}),1);
    for j = 1 : sum(train{i})
        if strcmp(t{j},c{1})
            trainT(j,1) = 1;
        else
            trainT(j,1) = 0;
        end
    end
    switch cfg.sortingMethod
        case 1
            [sortedFeatureIndices{i},featureScores{i}] = fisherFeatureSelection(features(:,train{i}),trainT);
        case 2
            [sortedFeatureIndices{i},featureScores{i}] = mrmr_mid_d(features(:,train{i})',trainT,cfg.sortingMethodParam);
        case 3
            binaryFeatures = double(features(:,train{i})>=repmat(mean(features(:,train{i}),1),size(features,1),1));
            [sortedFeatureIndices{i},featureScores{i}] = mrmr_mid_d(binaryFeatures',trainT,cfg.sortingMethodParam);
        case 4
            [sortedFeatureIndices{i},featureScores{i}] = mutualInformation(features(:,train{i}),trainT);
        case 5
            [sortedFeatureIndices{i},featureScores{i}] = perceptronFeatureSelection(features(:,train{i}),trainT);
        case 6
            sortedFeatureIndices{i} = 1: featureNum;
            featureScores{i} = ones(1,featureNum);
            bestN{i} = featureNum;
        case 7
            return;
    end
    if cfg.sortingMethod ~= 6
        switch cfg.selectionMethod
            case 1
                [F bestPerf bestN{i}]=forwardWrapper(features(:,train{i}),sortedFeatureIndices{i},group(train{i}),c,cfg);
            case 2
                bestN{i} = sum(featureScores{i}>=cfg.selectionMethodParam);
                if  bestN{i} == 0
                    bestN{i} = 1;
                end
            case 3
                bestN{i} = cfg.selectionMethodParam;
            case 4
                return;
        end
    end
    waitbar(i/cfg.foldNum,h,strcat('Please wait...',num2str(i),'/',num2str(cfg.foldNum)));
end
delete(h);