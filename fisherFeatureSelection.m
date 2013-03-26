function [sortedFeatureIndex,featureScore] = fisherFeatureSelection(features,targets)
%fisherFeatureSelection function computes Fisher discriminant scores for input features.
%   [sortedFeatureIndex,featureScore] =
%   fisherFeatureSelection(features,targets)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013

[featureNum,sampleNum] = size(features);
class1Features = features(:,logical(targets));
class2Features = features(:,not(logical(targets)));
featureScore = zeros(1,featureNum);
for i = 1 : featureNum
    class1Mean = mean(class1Features(i,:));
    class2Mean = mean(class2Features(i,:));
    calss1Var =  var(class1Features(i,:));
    calss2Var =  var(class2Features(i,:));
    featureScore(i) = abs(class1Mean-class2Mean)/(calss1Var+calss2Var);
end
[sortedfeatureScore sortedFeatureIndex]= sort(featureScore,'descend');
