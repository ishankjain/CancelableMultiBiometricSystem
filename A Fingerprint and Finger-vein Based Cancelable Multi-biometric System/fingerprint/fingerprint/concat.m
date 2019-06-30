load('testEPDFT.mat')
load('testEPDFT1.mat')
load('testEPDFT2.mat')
load('trainEPDFT.mat')
load('trainEPDFT1.mat')
load('trainEPDFT2.mat')
trainCombined=cell(1,300);
testCombined=cell(1,300);
trainCombined(1,1:100)=trainEPDFT;
trainCombined(1,101:200)=trainEPDFT1;
trainCombined(1,201:300)=trainEPDFT2;
testCombined(1,1:100)=testEPDFT;
testCombined(1,101:200)=testEPDFT1;
testCombined(1,201:300)=testEPDFT2;
score=zeros(size(trainCombined,2),size(trainCombined,2));
for i=1:size(trainCombined,2)
    X=cell2mat(trainCombined(i));
    for j=1:size(trainCombined,2)
        Y=cell2mat(testCombined(j));
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end
save('trainCombined.mat','trainCombined');
save('testCombined.mat','testCombined');