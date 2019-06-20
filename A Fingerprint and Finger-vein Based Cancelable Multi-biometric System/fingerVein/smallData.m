S=load('FingerVein.mat');
T=S.FingerVein;
train={};
test={};
i=1;
k=1;
while i<=size(T,2) && k<=100
    train(k)=T(i);
    test(k)=T(i+1);
    k=k+1;
    i=i+24;
end
save('train.mat','train');
save('test.mat','test');
UserKey={};
i=1;
while i<=100
    X=double(cell2mat(train(i)));
    X=X(:);
    UserKey(i)={generateUserkey(size(X,1))};
    i=i+1;
end
save('UserKey.mat','UserKey2');
trainEPDFT={};
testEPDFT={};
for i=1:100
    X=double(cell2mat(train(i)));
    X=X(:);
    key=cell2mat(UserKey(i));
    X=EPDFT(X,key);
    trainEPDFT(i)={X};
    X=double(cell2mat(test(i)));
    X=X(:);
    X=EPDFT(X,key);
    testEPDFT(i)={X};
    disp(i);
end
save('trainEPDFT.mat','trainEPDFT');
save('testEPDFT.mat','testEPDFT');
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