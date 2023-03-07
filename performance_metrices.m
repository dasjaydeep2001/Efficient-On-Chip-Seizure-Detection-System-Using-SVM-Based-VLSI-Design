function outdata = performance_metrices(in_actual, in_predicted)
%  2   3    4    5    6    7        8       9      10
% %

if size(in_actual, 2) ~= 1 || size(in_predicted, 2) ~= 1
	error ('Inputs must be a vector [N,1]');
end

if size(in_actual, 1) ~= size(in_predicted, 1)
	error ('Inputs must be the same size');
end




C = confusionmat(in_actual, in_predicted, 'order', [1 0]);
TP = C(1,1); FN = C(1,2); FP = C(2,1); TN = C(2,2);

ACC = (TP + TN) / (TP + FP + FN + TN);
PPV = TP / (TP + FP);
TPR = TP / (TP + FN);
FPR = FP / (FP + TN);
TNR = TN / (FP + TN);
FNR = FN / (FN + TP);
F1Score = 2*TP / (2*TP + FP + FN);
nullER = (TN + FP) / (TP + FP + FN + TN);
A = (TP + FN)*(TP + FP) / (TP + FP + FN + TN);
B = (FP + TN)*(FN + TN) / (TP + FP + FN + TN);
E = (A + B) / (TP + FP + FN + TN);
kappa = (ACC - E) / (1 - E);
MCC = (TP*TN - FP*FN) / sqrt( (TP+FP)*(TP+FN)*(TN+FP)*(TN+FN) );

outdata = struct('ACC',ACC, 'PPV',PPV, 'TPR',TPR, ...
	'FPR',FPR, 'TNR',TNR, 'FNR',FNR, 'F1Score',F1Score, ...
	'nullER',nullER, 'kappa',kappa, 'MCC',MCC);

end




