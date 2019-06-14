% score=zeros(size(featureTrain,2),size(featureTrain,2));
% for i=1:size(featureTrain,2)
%     for j=1:size(featureTest,2)
%         score(i,j)=1-gethammingdistance(cell2mat(featureTrain(i)), cell2mat(maskTrain(i)), cell2mat(featureTest(j)), cell2mat(maskTest(j)), 1);
%     end
%     disp(i);
% end
% i=1;
% bad=[];
% scoreFinal=[];
% while i<=200
%     if score(i,i)>=0.71
%         scoreFinal=[scoreFinal;score(i,:)];
%     else
%         bad=[bad;i];
%     end
%     i=i+1;
% end
% scoreFinal(:,bad)=[];
% save('score.mat','score');
% save('bad.mat','bad');
scoreFinal=score;
scoreFinal(:,bad)=[];
scoreFinal(bad,:)=[];