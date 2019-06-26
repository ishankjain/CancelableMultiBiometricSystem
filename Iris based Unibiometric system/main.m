addpath(genpath(pwd));

path='iris/';
Files=dir(path);
user=1;
i=1;
trainData={};
validationData={};
testData={};
while user<=100
    path2=strcat(path,Files(i).name);
    iris=dir(path2);
    if(strcmp(path2,strcat(path,'.')) || strcmp(path2,strcat(path,'..')) || strcmp(path2,strcat(path,'.DS_Store')) || strcmp(path2,strcat(path,'._.DS_Store' )))
        i=i+1;
        continue;
    end
    path2=strcat(path2,'/');
    for j=1:length(iris)
        iname=strcat(path2,iris(j).name);
        if(strcmp(iname,strcat(path2,'.')) || strcmp(iname,strcat(path2,'..')) || strcmp(iname,strcat(path2,'.DS_Store')) || strcmp(iname,strcat(path2,'._.DS_Store' )))
            continue;
        end
        trainData(user,1)={iname};
        iname=strcat(path2,iris(j+1).name);
        validationData(user,1)={iname};
        iname=strcat(path2,iris(j+1).name);
        testData(user,1)={iname};
        break;
    end
    disp(user);
    i=i+1;
    user=user+1;
end
save('trainData.mat','trainData');
save('validationData.mat','validationData');
save('testData.mat','testData');

featureTrain={};
maskTrain={};
featureTest={};
maskTest={};
featureValidation={};
maskValidation={};
for i=1:size(trainData,1)
    filename=cell2mat(trainData(i));
    [S,T]=createiristemplate(filename);
    featureTrain(i)={S};
    maskTrain(i)={T};
    filename=cell2mat(testData(i));
    [S,T]=createiristemplate(filename);
    featureTest(i)={S};
    maskTest(i)={T};
    filename=cell2mat(validationData(i));
    [S,T]=createiristemplate(filename);
    featureValidation(i)={S};
    maskValidation(i)={T};
    disp(i);
end
save('featureTrain.mat','featureTrain');
save('featureTest.mat','featureTest');
save('featureValidation.mat','featureValidation');
save('maskTrain.mat','maskTrain');
save('maskTest.mat','maskTest');
save('maskValidation.mat','maskValidation');

scoreValidation=zeros(size(featureTrain,2),size(featureTrain,2));
for i=1:size(featureTrain,2)
    for j=1:size(featureValidation,2)
        scoreValidation(i,j)=1-gethammingdistance(cell2mat(featureTrain(i)), cell2mat(maskTrain(i)), cell2mat(featureValidation(j)), cell2mat(maskValidation(j)), 1);
    end
    disp(i);
end
save('scoreValidation.mat','scoreValidation');

scoreTest=zeros(size(featureTrain,2),size(featureTrain,2));
for i=1:size(featureTrain,2)
    for j=1:size(featureTest,2)
        scoreTest(i,j)=1-gethammingdistance(cell2mat(featureTrain(i)), cell2mat(maskTrain(i)), cell2mat(featureTest(j)), cell2mat(maskTest(j)), 1);
    end
    disp(i);
end
save('scoreTest.mat','scoreTest');

i=1;
bad=[];
while i<=200
    if scoreValidation(i,i)<0.67
        bad=[bad;i]; 
    end
    i=i+1;
end
save('bad.mat','bad');

trainData(bad,:)=[];
validationData(bad,:)=[];
testData(bad,:)=[];
featureTrain(:,bad)=[];
maskTrain(:,bad)=[];
featureValidation(:,bad)=[];
maskValidation(:,bad)=[];
featureTest(:,bad)=[];
maskTest(:,bad)=[];
scoreTest(bad,:)=[];
scoreTest(:,bad)=[];

UserKey={};
for i=1:size(trainData,1)
    X=double(cell2mat(featureTrain(i))& ~cell2mat(maskTrain(i)));
    X=X(:);
    UserKey(i)={generateUserkey(size(X,1))};
end
save('UserKey.mat','UserKey');

trainEPDFT={};
testEPDFT={};
for i=1:size(trainData,1)
    X=double(cell2mat(featureTrain(i)) & ~cell2mat(maskTrain(i)));
    X=X(:);
    key=cell2mat(UserKey(i));
    X=EPDFT(X,key);
    trainEPDFT(i)={X};
    X=double(cell2mat(featureTest(i)) & ~cell2mat(maskTest(i)));
    X=X(:);
    X=EPDFT(X,key);
    testEPDFT(i)={X};
    disp(i);
end
save('trainEPDFT.mat','trainEPDFT');
save('testEPDFT.mat','testEPDFT');
