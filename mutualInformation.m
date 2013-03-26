function [sortedFeatureIndex,featureScore] = mutualInformation(features,targets)
%mutualInformation function computes mutual information scores for input features.
%   [sortedFeatureIndex,featureScore] =
%   fisherFeatureSelection(features,targets)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013

[featureNum,sampleNum] = size(features);
featureScore = zeros(1,featureNum);
for i = 1 : featureNum
    featureScore(i) = mutualinfo(features(i,:)', targets);
end
[sortedfeatureScore sortedFeatureIndex]= sort(featureScore,'descend');