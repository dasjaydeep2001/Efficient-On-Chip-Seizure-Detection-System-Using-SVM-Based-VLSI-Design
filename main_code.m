
clearvars;
format compact;
close all;
clear all;
clc;

trainSet = csvread(['Datasets' filesep 'train.csv']);
testSet = csvread(['Datasets' filesep 'test.csv']);


% SVM classification

% split data and labels
XTrain = trainSet(2:end, :)';
YTrain = trainSet(1, :)';
XTest = testSet(2:end, :)';
YTest = testSet(1, :)';

% train classifier model
SVMModel = fitcsvm(XTrain, YTrain, ...
		'KernelFunction', 'linear', ... 'linear' (default) | 'gaussian' | 'rbf' | 'polynomial'
		...'PolynomialOrder', 3, ... 3 (default)
		'Solver', 'SMO', ... 'ISDA' | 'L1QP' | 'SMO'
		'IterationLimit', 100000, ... 1000000 (default)
		'Standardize', true, ...
		'Verbose', 1);

% test classifier model
YTrain_ = predict(SVMModel, XTrain);
YTest_ = predict(SVMModel, XTest);

% store res to struct
res(1) = performance_metrices( YTrain_, YTrain );
res(2) = performance_metrices( YTest_, YTest );

% disp classifier statistics
kappa1 = num2str( getfield(res, {1}, 'kappa', {1}), '%.3f' );
kappa2 = num2str( getfield(res, {2}, 'kappa', {1}),'%.3f' );
accu1 = num2str( getfield(res, {1}, 'ACC', {1}), '%.3f' );
accu2 = num2str( getfield(res, {2}, 'ACC', {1}), '%.3f' );
disp(' ');
disp( ['[TRAIN]: kappa ' kappa1 ', accu: ' accu1] );
disp( ['[TEST ]: kappa ' kappa2 ', accu: ' accu2] );
disp(' ');

% plot confusion matrix
c = confusionmat(YTest, YTest_');

figure('ToolBar', 'none', ...
	'Units', 'pixels', ...
	'Position', [300 300 500 500]);
confusion_metrices(c, {'NonTarget', 'Target '});

c1 = categorical(YTrain_,[1 0], {'Attention', 'Not Attention'});
h1 = histogram(c1, 'FaceColor', 'b')

% attention or not attention
idx=randsample(1:size(XTrain,1),1) ;
B = XTrain(idx,:) ;
idx1=randsample(1:size(XTest,1),1) ;
B1 = XTest(idx,:) ;
YTrain_1 = predict(SVMModel, B);
disp('  EEG Signal Classification');
if YTrain_1 == 0
    disp ('Non Attention ');
elseif YTrain_1 == 1
   disp (' Attention');
else
    disp ('Sleep State');
end

% Performance Metrices of training data
performance = classperf(YTrain,YTrain_);
Accuracy = performance.CorrectRate *100;
Sensitivity = performance.Sensitivity *100;
Specificity = performance.Specificity *100;

rnames={'%'};
cnames = {'Accuracy','Sensitivity','Specificity'};
f=figure('Name','Performance Measures for Training Data','NumberTitle','off');
t = uitable('Parent',f,'Data',[Accuracy,Sensitivity,Specificity],'RowName',rnames,'ColumnName',cnames);

figure('Name','Performance Measures for Training Data','NumberTitle','Off','Color','White');
bar(1,Accuracy,0.5,'r') ; hold on ; bar(2,Sensitivity,0.5,'g') ; hold on ; bar(3,Specificity,0.5,'b') ;
set(gca, 'XTick',1:3, 'XTickLabel',{'Accuracy' 'Sensitivity' 'Specificity'},'fontsize',12,'fontname','Times New Roman','fontweight','bold');



