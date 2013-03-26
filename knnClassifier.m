function [trainedClassifier  predictedClassesTest F ACC] = knnClassifier(features,group,sortedFeatureIndices,bestN,train,test,crossValidationMethod)
%KNNClassifier function trains naive bayesian classifier based on
%K-fold or leave one out cross validation.
%   [trainedClassifier  predictedClassesTest F
%   ACC]=naiveBayesianClassifier(features,group,sortedFeatureIndices,bestN,
%   crossValidationIndices,crossValidationMethod)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013
trainedClassifier = [];
sampleNum = size(group,1);
features = features';
c{1} = group{1,1};
for i = 2 : sampleNum
    if ~strcmp(group{i,1},c{1})
        c{2} = group{i,1};
        break;
    end
end
switch crossValidationMethod
    case 1
        foldNum = length(train);
        trainedClassifier = cell(1,foldNum);
        predictedClassesTest = cell(foldNum,1);
        testResult = cell(1,foldNum);
        h = waitbar(0,'Please wait...');
        for i = 1 : foldNum
            predictedClassesTest{i,1} = knnclassify(features(test{i},sortedFeatureIndices{i}(1:bestN{i})), features(train{i},sortedFeatureIndices{i}(1:bestN{i})), group(train{i}), 1, 'euclidean');
            testResult{i} = strcmp(predictedClassesTest{i,1},group(test{i}));
            ACC(i) = sum(testResult{i})/size(testResult{i},1);
            [F1 F2] = Fmeasure (group(test{i}),predictedClassesTest{i},c);
            F(i) = (F1 + F2)/2;
            waitbar(i/foldNum);
        end
    case 2
        foldNum = length(train);
        trainedClassifier = cell(1,foldNum);
        predictedClassesTest = cell(foldNum,1);
        testResult = cell(1,foldNum);
        h = waitbar(0,'Please wait...');
        for i = 1 : foldNum
            %test = (crossValidationIndices == i); train = ~test;
            trainSet  = features(train{i},sortedFeatureIndices{i}(1:bestN{i}));
            testSet = features(test{i},sortedFeatureIndices{i}(1:bestN{i}));
            trainedClassifier{i} = NaiveBayes.fit(trainSet,group(train{i}));
            predictedClassesTest{i} = trainedClassifier{i}.predict(testSet);
            predictedClassesTest{i} = knnclassify(testSet, trainSet, group(train{i}), 1, 'euclidean');
            testResult{i} = strcmp(predictedClassesTest{i},group(test{i}));
            waitbar(i/foldNum);
        end
        ACC = sum(cell2mat(testResult))/size(testResult,2);
        [F1 F2] = Fmeasure (group,predictedClassesTest,c);
        F = (F1 + F2)/2;
    case 3
        foldNum = length(train);
        trainedClassifier = cell(1,foldNum);
        predictedClassesTest = cell(foldNum,1);
        testResult = cell(1,foldNum);
        h = waitbar(0,'Please wait...');
        for i = 1 : foldNum
            predictedClassesTest{i,1} = knnclassify(features(test{i},sortedFeatureIndices{i}(1:bestN{i})), features(train{i},sortedFeatureIndices{i}(1:bestN{i})), group(train{i}), 1, 'euclidean');
            testResult{i} = strcmp(predictedClassesTest{i,1},group(test{i}));
            ACC(i) = sum(testResult{i})/size(testResult{i},1);
            [F1 F2] = Fmeasure (group(test{i}),predictedClassesTest{i},c);
            F(i) = (F1 + F2)/2;
            waitbar(i/foldNum);
        end
end
delete(h);