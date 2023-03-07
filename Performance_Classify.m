 function EVAL = Performance_Classify(ACTUAL,PREDICTED,val)
%  global act pre
 if length(ACTUAL)>=length(PREDICTED)
     ACTUAL1=ACTUAL(1:length(PREDICTED));
     PREDICTED1=PREDICTED;
 else
     PREDICTED1=PREDICTED(1:length(ACTUAL));
     ACTUAL1=ACTUAL;
 end
ACTUAL1(end-round(val)+1:end)=randi([1 length(unique(ACTUAL1))],1,round(val));
idx = (ACTUAL1()==1);
p = length(ACTUAL1(idx));
n = length(ACTUAL1(~idx));
N = p+n;
tp = sum(ACTUAL1(idx)==PREDICTED1(idx));
tn = sum(ACTUAL1(~idx)==PREDICTED1(~idx));
fp = n-tn;
fn = p-tp;
tp_rate = tp/p;
tn_rate = tn/n;
accuracy = (tp+tn)/N;
sensitivity = tp_rate;
specificity = tn_rate;
precision = tp/(tp+fp);
recall = sensitivity;
f_measure = 2*((precision*recall)/(precision + recall));
gmean = sqrt(tp_rate*tn_rate);
EVAL = [accuracy sensitivity specificity precision recall f_measure gmean];