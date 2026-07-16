% Prog_10e.m:Decision tree and confusion matrix. 
% Load iris dataset.
load fisheriris   % Measures, species.
X=meas;           % Features (150x4).
y=species;        % Labels (cell array).
% Convert class labels to categoricals.
y=categorical(y);
% Split the data (train/test).
cv=cvpartition(y,'HoldOut',0.3);
Xtrain=X(training(cv),:);
ytrain=y(training(cv));
Xtest=X(test(cv),:);
ytest=y(test(cv));
% Train decision tree.
treeModel = fitctree(Xtrain,ytrain,...
    'PredictorNames',{'SepalL','SepalW','PetalL','PetalW'});
% View tree.
view(treeModel,'Mode','graph');
% Prediction
ypred=predict(treeModel,Xtest);
% Confusion matrix.
figure;
confusionchart(ytest,ypred);
title('Confusion Matrix - Iris Decision Tree');
set(gca,'FontSize',20)
% Accuracy.
accuracy = sum(ypred == ytest) / numel(ytest);
fprintf('Classification Accuracy = %.2f%%\n',accuracy*100);
% End Prog_10e.m.