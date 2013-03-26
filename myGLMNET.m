function [beta ,predictedClassesTest, F, ACC] = myGLMNET(features,groups,crossValidationMethod,foldNum,method)
[m,n] = size(features);
if iscell(groups) & method == 'gaussian'
    c{1} = groups{1,1};
    for i = 2 : n
        if ~strcmp(groups{i,1},c{1})
            c{2} = groups{i,1};
            break;
        end
    end
    for i = 1 : n
        if strcmp(groups{i},c{1})
            targets(i) = -1;
        else
            targets(i) = 1;
        end
    end
elseif iscell(groups) & method == 'binomial'
    c{1} = groups{1,1};
    for i = 2 : n
        if ~strcmp(groups{i,1},c{1})
            c{2} = groups{i,1};
            break;
        end
    end
    for i = 1 : n
        if groups{i} == c{1}
            targets(i) = 1;
        else
            targets(i) = 2;
        end
    end
else
    targets = groups;
end
switch crossValidationMethod
    case 1
        [crossValidationIndices] = crossvalind('Kfold',n,foldNum);
        h = waitbar(0,'Please wait...');
        for i = 1 : foldNum
            test = (crossValidationIndices == i); train = ~test;
            verbose = false;
            options = glmnetSet();
            %options.alpha = alpha;
            options.maxit = 200;
            cvErr = cvglmnet(features(:,train)',targets(train)',foldNum-1,[],'response',method,options,verbose);
            lambda = cvErr.lambda_min;
            best = find(cvErr.glmnet_object.lambda == lambda);
            if method == 'gaussian'
                beta{i} = [cvErr.glmnet_object.a0(best,:), zeros(1, m)];
                beta{i}(1,2:end) = cvErr.glmnet_object.beta(:,best)';
            else
                
            end
            testSize = sum(double(test));
            testTargets = targets(test)';
            yHat = repmat(beta{i}(:,1), 1, testSize) + beta{i}(:,2:end)*features(:,test);
            y = [];
            y (yHat>=0) =1;
            y (yHat<0) = -1;
            ACC(i) = sum(sum(y==targets(test)))/testSize;
            for j = 1 : testSize
                if y(j) == -1
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
            verbose = false;
            options = glmnetSet();
            %options.alpha = alpha;
            options.maxit = 200;
            cvErr = cvglmnet(features(:,train)',targets(train)',foldNum-1,[],'response',method,options,verbose);
            lambda = cvErr.lambda_min;
            best = find(cvErr.glmnet_object.lambda == lambda);
            beta{i} = [cvErr.glmnet_object.a0(best,:), zeros(1, m)];
            beta{i}(1,2:end) = cvErr.glmnet_object.beta(:,best)';
            testSize = sum(double(test));
            testTargets = targets(test)';
            yHat = repmat(beta{i}(:,1), 1, testSize) + beta{i}(:,2:end)*features(:,test);
            if yHat >= 0
                y(i) = 1;
            else
                y(i) = -1;
            end
            if y(i) == -1
                predictedClassesTest{i} = c{1};
            else
                predictedClassesTest{i} = c{2};
            end
            waitbar(i/foldNum);
        end
        ACC = sum(sum(y==targets))/n;
        [F1, F2] = Fmeasure (groups,predictedClassesTest,c);
        F = (F1 + F2)/2;
end
delete(h);