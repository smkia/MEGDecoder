function [sortedFeatureIndex featureFscore] = perceptronFeatureSelection(features,targets)
%perceptronFeatureSelection function selects effective features based on
%prefomance of single neuron perceptron.
%   [sortedFeatureIndex featureFscore] =
%   perceptronFeatureSelection(features,targets)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013

[featureNum sampleNum] = size (features);
featureFscore = zeros(1,featureNum);
for j = 1 : featureNum
    trainSet = features(j,:);
    net = newp(trainSet,targets);
    net.trainParam.epochs = 10;
    net.trainParam.show = NaN;
    net.trainParam.showWindow = 0;
    net = train(net,trainSet,targets);
    testResult = sim(net,trainSet);
    [F1 F2] = Fmeasure (targets,testResult);
    featureFscore(j) = (F1+F2)/2;
end
[sortedfeatureFscore sortedFeatureIndex]= sort(featureFscore,'descend');
