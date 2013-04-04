function [beta ,predictedClassesTest, F, ACC] = myGLM(features,groups,crossValidationMethod,foldNum,method)
warning off;
[m,n] = size(features);
if iscell(groups) & strcmp(method,'binomial')
    c{1} = groups{1,1};
    for i = 2 : n
        if ~strcmp(groups{i,1},c{1})
            c{2} = groups{i,1};
            break;
        end
    end
    for i = 1 : n
        if strcmp(groups{i},c{1})
            targets(i) = 0;
        else
            targets(i) = 1;
        end
    end
else
    targets = groups;
end
switch crossValidationMethod
    case 1
        [crossValidationIndices] = crossvalind('Kfold',targets,foldNum);
        h = waitbar(0,'Please wait...');
        for i = 1 : foldNum
            test = (crossValidationIndices == i); train = ~test;
            [beta{i},dev,stats] = glmfit(features(:,train)',targets(train)','binomial','link','logit');
            y = glmval(beta{i},features(:,test)','logit');
            y = round(y);
            testSize = sum(double(test));
            ACC(i) = sum(sum(y==targets(test)'))/testSize;
            for j = 1 : testSize
                if y(j) == 0
                    predictedClassesTest{j,i} = c{1};
                else
                    predictedClassesTest{j,i} = c{2};
                end
            end
            [F1, F2] = Fmeasure (groups(test),predictedClassesTest(:,i),c);
            F(i) = (F1 + F2)/2;
            waitbar(i/foldNum);
        end
    case 2
        foldNum = n;
        crossValidationIndices  = 1: foldNum;
        h = waitbar(0,'Please wait...');
        for i = 1 : foldNum
            test = (crossValidationIndices == i); train = ~test;
            [beta{i},dev,stats] = glmfit(features(:,train)',targets(train)','binomial','link','logit');
            y(i) = glmval(beta{i},features(:,test)','logit');
            y(i) = round(y(i));
            if y(i) == 0
                predictedClassesTest{i} = c{1};
            elseif y(i) == 1
                predictedClassesTest{i} = c{2};
            end
            waitbar(i/foldNum);
        end
        ACC = sum(sum(y==targets))/n;
        [F1, F2] = Fmeasure (groups,predictedClassesTest,c);
        F = (F1 + F2)/2;
end
%delete(h);
warning on;