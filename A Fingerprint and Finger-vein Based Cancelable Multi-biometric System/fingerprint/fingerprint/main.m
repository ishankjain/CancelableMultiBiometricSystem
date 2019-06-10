train=load('trainData.mat');
test=load('testData.mat');
train=train.trainData;
test=test.testData;
MinutiaeTrain={};
Minutiae_pairTrain={};
MinutiaeTest={};
Minutiae_pairTest={};
DecimalTrain={};
DecimalTest={};
UserKey={};
trainEPDFT={};
testEPDFT={};
for i=1:size(trainData,1)
    filename=cell2mat(train(i));
    img = imread(filename);
    if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
    img=imresize(img,[388 374]);
    figure;imshow(filename);title(filename);
    pause;
    close all;
    disp(['Extracting features from ' filename ' ...']);
    minutiae=ext_minutiae(img,1);
    minutiae=minu(minutiae);
    MinutiaeTrain(i)={minutiae};
    minutiae=cell2mat(MinutiaeTrain(i));
    V=minutiae_pair(minutiae);
    Minutiae_pairTrain(i)={V};
    V=cell2mat(Minutiae_pairTrain(i));
    BV=quantization(V);  %binary V  
    D=bi2de(BV,'left-msb'); % convert to decimal
    D=unique(D);
    DecimalTrain(i)={D};
    
    filename=cell2mat(test(i));
    img = imread(filename);
    if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
    img=imresize(img,[388 374]);
    figure;imshow(filename);title(filename);
    pause;
    close all;
    disp(['Extracting features from ' filename ' ...']);
    minutiae=ext_minutiae(img,1);
    minutiae=minu(minutiae);
    MinutiaeTest(i)={minutiae};
    minutiae=cell2mat(MinutiaeTest(i));
    V=minutiae_pair(minutiae);
    Minutiae_pairTest(i)={V};
    V=cell2mat(Minutiae_pairTest(i));
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
save('DecimalTrain.mat','DecimalTrain');
save('DecimalTest.mat','DecimalTest');

maxkey=0;
for i=1:size(DecimalTrain,2)
    maxkey=max(maxkey,size(cell2mat(DecimalTrain(i)),1));
end
for i=1:size(trainData,1)
    D=cell2mat(DecimalTrain(i));
    D=D+1;
    key=generateUserkey(maxkey,D,2^length);
    UserKey(i)={key};
    BP=zeros(2^length,1);  %binary feature vector
    BP(D)=1;
    trainEPDFT(i)={EPDFT(BP,key)};
  
    D=cell2mat(DecimalTest(i));
    D=D+1;
    BP=zeros(2^length,1);  %binary feature vector
    BP(D)=1;
    testEPDFT(i)={EPDFT(BP,key)};
    disp(i);
end
save('UserKey.mat','UserKey');
save('trainEPDFT.mat','trainEPDFT');
save('testEPDFT.mat','testEPDFT');

score=zeros(size(trainEPDFT,2),size(trainEPDFT,2));
for i=1:size(trainEPDFT,2)
    X=cell2mat(trainEPDFT(i));
    for j=1:size(trainEPDFT,2)
        Y=cell2mat(testEPDFT(j));
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end
save('score.mat','score');