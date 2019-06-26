addpath(genpath(pwd));
% save('trainData.mat','trainData');
% save('testData.mat','testData');
% featureTrain=cell(100,2);
% featureTest=cell(100,2);
% for i=1:size(trainData,1)
%     filename=cell2mat(trainData(i));
%     [S,T]=createiristemplate(filename);
%     featureTrain(i,1)={S};
%     featureTrain(i,2)={T};
%     disp(i);
% end
% for i=1:size(trainData,1)
%     filename=cell2mat(testData(i));
%     [S,T]=createiristemplate(filename);
%     featureTest(i,1)={S};
%     featureTest(i,2)={T};
% 
%     disp(i);
% end
% save('featureTrain.mat','featureTrain');
% save('featureTest.mat','featureTest');

scoreTest=zeros(size(featureTrain,1),size(featureTrain,1));
for i=1:size(featureTrain,1)
    for j=1:size(featureTest,1)
        scoreTest(i,j)=1-gethammingdistance(cell2mat(featureTrain(i,1)), cell2mat(featureTrain(i,2)), cell2mat(featureTest(j,1)), cell2mat(featureTest(j,2)), 1);
    end
    disp(i);
end
save('scoreTest.mat','scoreTest');
