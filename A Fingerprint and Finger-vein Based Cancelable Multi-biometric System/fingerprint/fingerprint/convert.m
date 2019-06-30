load('train2.mat')
load('test2.mat')
DecimalTrain=cell(1,100);
DecimalTest=cell(1,100);
UserKey=cell(1,100);
trainEPDFT2=cell(1,100);
testEPDFT2=cell(1,100);
for i=1:size(ff,2)
    
    minutiae=minu(cell2mat(ff(i)));
%     MinutiaeTrain(i)={minutiae};
%     minutiae=cell2mat(MinutiaeTrain(i));
    V=minutiae_pair(minutiae);
%     Minutiae_pairTrain(i)={V};
%     V=cell2mat(Minutiae_pairTrain(i));
    BV=quantization(V);  %binary V  
    D=bi2de(BV,'left-msb'); % convert to decimal
    D=unique(D);
    DecimalTrain(i)={D};
    
    minutiae=minu(cell2mat(ffnew(i)));
%     MinutiaeTest(i)={minutiae};
%     minutiae=cell2mat(MinutiaeTest(i));
    V=minutiae_pair(minutiae);
%     Minutiae_pairTest(i)={V};
%     V=cell2mat(Minutiae_pairTest(i));
    [BV,length]=quantization(V);  %binary V  
    D=bi2de(BV,'left-msb'); % convert to decimal
    D=unique(D);
    DecimalTest(i)={D};
    disp(i);
    close all;
end
% save('MinutiaeTrain.mat','MinutiaeTrain');
% save('Minutiae_pairTrain.mat','Minutiae_pairTrain');
% save('MinutiaeTest.mat','MinutiaeTest');
% save('Minutiae_pairTest.mat','Minutiae_pairTest');
% save('DecimalTrain.mat','DecimalTrain');
% save('DecimalTest.mat','DecimalTest');

maxkey=18443;
% for i=1:size(DecimalTrain,2)
%     maxkey=max(maxkey,size(cell2mat(DecimalTrain(i)),1));
% end
for i=1:size(ff,2)
    D=cell2mat(DecimalTrain(i));
    D=D+1;
    key=generateUserkey(maxkey,D,2^length);
    UserKey(i)={key};
    BP=zeros(2^length,1);  %binary feature vector
    BP(D)=1;
    trainEPDFT2(i)={EPDFT(BP,key)};
  
    D=cell2mat(DecimalTest(i));
    D=D+1;
    BP=zeros(2^length,1);  %binary feature vector
    BP(D)=1;
    testEPDFT2(i)={EPDFT(BP,key)};
    disp(i);
end
% save('UserKey.mat','UserKey');
save('trainEPDFT2.mat','trainEPDFT2');
save('testEPDFT2.mat','testEPDFT2');

score=zeros(size(trainEPDFT2,2),size(trainEPDFT2,2));
for i=1:size(trainEPDFT2,2)
    X=cell2mat(trainEPDFT2(i));
    for j=1:size(trainEPDFT2,2)
        Y=cell2mat(testEPDFT2(j));
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end
% save('score.mat','score');