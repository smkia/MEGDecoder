function [trainedClassifier,predictedClassesTest F ACC] = svmClassifier(features, group, C, kernelFunction, tol, max_passes,sortedFeatureIndices,bestN,train,test,crossValidationMethod)
%svmClassifier function trains linear SVM classifier based on
%K-fold or leave one out cross validation.
%   [trainedClassifier,predictedClassesTest F ACC] =
%   svmClassifier(features, group, C, kernelFunction, tol,
%   max_passes,sortedFeatureIndices,bestN,crossValidationIndices,crossValid
%   ationMethod)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013

features = features';
sampleNum = size(group,1);
c{1} = group{1,1};
for i = 2 : sampleNum
    if ~strcmp(group{i,1},c{1})
        c{2} = group{i,1};
        break;
    end
end
Y = zeros(sampleNum,1);
for i = 1 : sampleNum
    Y(i,1) = double(strcmp(group{i,1},c{1}));
end
switch crossValidationMethod
    case 1
        foldNum = length(train);
        trainedClassifier = cell(1,foldNum);
        predictedClassesTest = cell(foldNum,1);
        testResult = cell(1,foldNum);
        h = waitbar(0,'Please wait...');
        for i = 1 : foldNum
            %             test = (crossValidationIndices == i); train = ~test;
            trainedClassifier{i} = svmtrain(features(train{i},sortedFeatureIndices{i}(1:bestN{i})), group(train{i}));
            predictedClassesTest{i} = svmclassify(trainedClassifier{i},features(test{i},sortedFeatureIndices{i}(1:bestN{i})));
            testResult{1,i} = strcmp(predictedClassesTest{i},group(test{i}));
            ACC(i) = sum(testResult{1,i})/size(testResult{1,i},1);
            [F1 F2] = Fmeasure (group(test{i}),predictedClassesTest{i},c);
            F(i) = (F1 + F2)/2;
            waitbar(i/foldNum,h,strcat('Please wait...',num2str(i),'/',num2str(foldNum)));
        end
    case 2
        %         if iscell(crossValidationIndices)
        %             temp = crossValidationIndices{1};
        %             crossValidationIndices =[];
        %             crossValidationIndices = temp;
        %         end
        foldNum = length(train);
        trainedClassifier = cell(1,foldNum);
        predictedClassesTest = cell(foldNum,1);
        testResult = cell(1,foldNum);
        h = waitbar(0,'Please wait...');
        for i = 1 : foldNum
            %             test = (crossValidationIndices == i); train = ~test;
            trainSet  = features(train{i},sortedFeatureIndices{i}(1:bestN{i}));
            testSet = features(test{i},sortedFeatureIndices{i}(1:bestN{i}));
            trainedClassifier{i} = svmtrain(trainSet, group(train{i}));
            predictedClassesTest{i} = svmclassify(trainedClassifier{i},testSet);
            testResult{1,i} = strcmp(predictedClassesTest{i},group(test{i}));
            waitbar(i/foldNum,h,strcat('Please wait...',num2str(i),'/',num2str(foldNum)));
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
            %             test = (crossValidationIndices == i); train = ~test;
            trainedClassifier{i} = svmtrain(features(train{i},sortedFeatureIndices{i}(1:bestN{i})), group(train{i}));
            predictedClassesTest{i} = svmclassify(trainedClassifier{i},features(test{i},sortedFeatureIndices{i}(1:bestN{i})));
            testResult{1,i} = strcmp(predictedClassesTest{i},group(test{i}));
            tempACC(i) = sum(testResult{1,i})/size(testResult{1,i},1);
            [F1 F2] = Fmeasure (group(test{i}),predictedClassesTest{i},c);
            tempF(i) = (F1 + F2)/2;
            waitbar(i/foldNum,h,strcat('Please wait...',num2str(i),'/',num2str(foldNum)));
        end
        F = mean(tempF,2);
        ACC = mean(tempACC,2);
end
delete(h);