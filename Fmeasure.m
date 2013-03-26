function [F1 F2] = Fmeasure (actualLabels,predictedLabels,labels)
%Fmeasure function computes F1 scores for both input classes.
%   [F1 F2] = Fmeasure (actualLabels,predictedLabels,labels)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013

labelNum = size(actualLabels,1);
if nargin == 3
    for i = 1 : labelNum
        target(i) = strcmp(actualLabels{i},labels{1});
        prediction(i) = strcmp(predictedLabels{i},labels{1});
    end
elseif nargin == 2
    target = actualLabels;
    prediction = predictedLabels;
else
    error('Insufficient inputs ... !!!');
end
% F1
tp = sum(and(target,prediction),2);
fp = sum(and(not(target),prediction),2);
fn = sum(and(target, not(prediction)),2);
precision = tp/(tp+fp);
recall = tp/(tp+fn);
F1 = 2 * (precision*recall)/(precision+recall);
% F2
target = not(target);
prediction = not(prediction);
tp = sum(and(target,prediction),2);
fp = sum(and(not(target),prediction),2);
fn = sum(and(target, not(prediction)),2);
precision = tp/(tp+fp);
recall = tp/(tp+fn);
F2 = 2 * (precision*recall)/(precision+recall);
if isnan(F1)
    F1 = 0;
end
if isnan(F2)
    F2 = 0;
end