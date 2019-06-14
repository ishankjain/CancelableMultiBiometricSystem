addpath(genpath(pwd));
% trainEPDFT=load('trainEPDFT.mat');
% trainEPDFT=trainEPDFT.trainEPDFT;
% testEPDFT=load('testEPDFT.mat');
% testEPDFT=testEPDFT.testEPDFT;
% score=zeros(size(featureTrain,2),size(featureTrain,2));
% for i=1:size(testEPDFT,2)
%     X=cell2mat(trainEPDFT(i));
%     for j=1:size(trainEPDFT,2)
%         Y=cell2mat(testEPDFT(j));
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end
% score=scoreValidation;
% score(:,bad)=[];
% score(bad,:)=[];
genuine=[];
imposter=[];
for i=1:size(scoreTest)
    for j=1:size(scoreTest)
        if i==j
            genuine=[genuine;[scoreTest(i,j)]];
        else
            imposter=[imposter;[scoreTest(i,j)]];
        end
    end
end
mus=nanmean(genuine);
mud=nanmean(imposter);
vars=nanvar(genuine);
vard=nanvar(imposter);
di=abs(mus-mud)/sqrt((vars+vard)/2);
[EER,OP]=EER_DET_conf(genuine,imposter,0.1,10000);
% ci=0;
% cg=0;
% for i=1:size(imposter,1)
%     if imposter(i)>0.6
%         ci=ci+1;
%     end
% end
% for i=1:size(genuine,1)
%     if genuine(i)>0.6
%         cg=cg+1;
%     end
%         
% end

% c=0;
% for i=1:size(score,1)
%     if score(i,i)>=0.71
% %         score(i,:)=[];
% %         score(:,i)=[];
% %         i=i-1;
% c=c+1;
%     end 
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