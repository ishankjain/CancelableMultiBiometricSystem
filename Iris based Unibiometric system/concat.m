addpath(genpath(pwd));
trainCombined=cell(300,2);
testCombined=cell(300,2);
trainCombined(1:100,:)=train3;
trainCombined(101:200,:)=train1;
trainCombined(201:300,:)=train2;
testCombined(1:100,:)=test3;
testCombined(101:200,:)=test1;
testCombined(201:300,:)=test2;
scoreCombined=zeros(size(trainCombined,1),size(trainCombined,1));
for i=1:size(trainCombined,1)
    for j=1:size(testCombined,1)
        scoreCombined(i,j)=1-gethammingdistance(cell2mat(trainCombined(i,1)), cell2mat(trainCombined(i,2)), cell2mat(testCombined(j,1)), cell2mat(testCombined(j,2)), 1);
%         X=cell2mat(CFtrain(i,1))&cell2mat(CFtrain(i,2));
%         Y=cell2mat(CFtest(j,1))&cell2mat(CFtest(j,2));
%         scoreCombined(i,j)=cosine(double(X(:)),double(Y(:)));
    end
    disp(i);
end
save('trainCombined.mat','trainCombined');
save('testCombined.mat','testCombined');