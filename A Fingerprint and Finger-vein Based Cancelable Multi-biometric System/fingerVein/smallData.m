S=load('FingerVein.mat');
T=S.FingerVein;
train={};
test={};
S=load('EPDFT.mat');
R=S.T;
trainEPDFT={};
testEPDFT={};
i=1;
k=1;
while i<=size(T,2) && k<=100
    train(k)=T(i);
    test(k)=T(i+1);
    trainEPDFT(k)=R(i);
    testEPDFT(k)=R(i+1);
    k=k+1;
    i=i+24;
end
save('train.mat','train');
save('test.mat','test');
save('trainEPDFT','trainEPDFT');
save('testEPDFT','testEPDFT');
score=zeros(size(train,2),size(train,2));
for i=1:size(train,2)
    X=cell2mat(trainEPDFT(i));
    for j=1:size(train,2)
        Y=cell2mat(testEPDFT(j));
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end
save('scoreSmallData.mat','score');