function [F bestPerf bestN]=forwardWrapper(features,sortedFeatureIndex,group,c,cfg)
%forwardWrapper function finds number of features using forward wrapping
%method.
%   [F bestPerf bestN]=forwardWrapper(features,sortedFeatureIndex,group,c,cfg)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013

trainSetSize = size(group,1);
features = features';
switch cfg.crossValidationMethod
    case 1
        F = zeros(cfg.foldNum,cfg.selectionMethodParam);
        [indices] = crossvalind('Kfold',group,cfg.foldNum);
        for n = 1 : cfg.selectionMethodParam
            for i = 1 : cfg.foldNum
                test = (indices == i); train = ~test;
                if cfg.classificationMethod == 1
                    trainedClassifier = NaiveBayes.fit(features(train,sortedFeatureIndex(1:n)),group(train));
                    predictedClassesTest{i,1} = trainedClassifier.predict(features(test,sortedFeatureIndex(1:n)));
                elseif cfg.classificationMethod == 2
                    trainedClassifier = svmtrain(features(train,sortedFeatureIndex(1:n)), group(train));
                    predictedClassesTest{i,1} = svmclassify(trainedClassifier,features(test,sortedFeatureIndex(1:n)));
                elseif cfg.classificationMethod == 4
                    predictedClassesTest{i,1} = knnclassify(features(test,sortedFeatureIndex(1:n)), features(train,sortedFeatureIndex(1:n)), group(train), 1, 'euclidean');
                end
                [F1 F2] = Fmeasure (group(test),predictedClassesTest{i,1},c);
                F(i,n) = (F1 + F2)/2;
            end
        end
        meanF = mean(F);
        [bestPerf bestN] = max(meanF,[],2);
    case 2
        F = zeros(1,cfg.selectionMethodParam);
        [indices] = 1:trainSetSize;
        for n = 1 : cfg.selectionMethodParam
            for i = 1 : trainSetSize
                test = (indices == i); train = ~test;
                if cfg.classificationMethod == 1
                    trainedClassifier = NaiveBayes.fit(features(train,sortedFeatureIndex(1:n)),group(train));
                    predictedClassesTest{i,1} = trainedClassifier.predict(features(test,sortedFeatureIndex(1:n)));
                elseif cfg.classificationMethod == 2
                    trainedClassifier = svmtrain(features(train,sortedFeatureIndex(1:n)), group(train));
                    predictedClassesTest{i,1} = svmclassify(trainedClassifier,features(test,sortedFeatureIndex(1:n)));
                elseif cfg.classificationMethod == 4
                    predictedClassesTest{i,1} = knnclassify(features(test,sortedFeatureIndex(1:n)), features(train,sortedFeatureIndex(1:n)), group(train), 1, 'euclidean');
                end
            end
            [F1 F2] = Fmeasure (group,predictedClassesTest,c);
            F(1,n) = (F1 + F2)/2;
        end
        [bestPerf bestN] = max(F,[],2);
    case 3
        F = zeros(cfg.foldNum,cfg.selectionMethodParam);
        for i = 1 : cfg.foldNum
            %[train{i}, test{i}] = crossvalind('LeaveMOut',group,1, 'Min', cfg.minTrainingSamples-1);
            [train{i}, test{i}] = crossvalind('LeaveMOut',group,1);
        end
        for n = 1 : cfg.selectionMethodParam
            for i = 1 : cfg.foldNum
                if cfg.classificationMethod == 1
                    trainedClassifier = NaiveBayes.fit(features(train{i},sortedFeatureIndex(1:n)),group(train{i}));
                    predictedClassesTest{i,1} = trainedClassifier.predict(features(test{i},sortedFeatureIndex(1:n)));
                elseif cfg.classificationMethod == 2
                    trainedClassifier = svmtrain(features(train{i},sortedFeatureIndex(1:n)), group(train{i}));
                    predictedClassesTest{i,1} = svmclassify(trainedClassifier,features(test{i},sortedFeatureIndex(1:n)));
                elseif cfg.classificationMethod == 4
                    predictedClassesTest{i,1} = knnclassify(features(test,sortedFeatureIndex(1:n)), features(train,sortedFeatureIndex(1:n)), group(train), 1, 'euclidean');
                end
                [F1 F2] = Fmeasure (group(test{i}),predictedClassesTest{i,1},c);
                F(i,n) = (F1 + F2)/2;
            end
        end
        meanF = mean(F);
        [bestPerf bestN] = max(meanF,[],2);
end
