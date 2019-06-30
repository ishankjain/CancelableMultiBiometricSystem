% addpath(genpath(pwd));
% 
% path='IITDDatabase/';
% Files=dir(path);
% user=1;
% i=1;
% trainDataIITD={};
% validationDataIITD={};
% testDataIITD={};
% while user<=200
%     path2=strcat(path,Files(i).name);
%     iris=dir(path2);
%     if(strcmp(path2,strcat(path,'.')) || strcmp(path2,strcat(path,'..')) || strcmp(path2,strcat(path,'.DS_Store')) || strcmp(path2,strcat(path,'._.DS_Store' )))
%         i=i+1;
%         continue;
%     end
%     path2=strcat(path2,'/');
%     for j=1:length(iris)
%         iname=strcat(path2,iris(j).name);
%         if(strcmp(iname,strcat(path2,'.')) || strcmp(iname,strcat(path2,'..')) || strcmp(iname,strcat(path2,'.DS_Store')) || strcmp(iname,strcat(path2,'._.DS_Store' )))
%             continue;
%         end
%         trainDataIITD(user,1)={iname};
%         iname=strcat(path2,iris(j+1).name);
%         validationDataIITD(user,1)={iname};
%         iname=strcat(path2,iris(j+2).name);
%         testDataIITD(user,1)={iname};
%         break;
%     end
%     disp(user);
%     i=i+1;
%     user=user+1;
% end
% 
% 
% featureTrainIITD=cell(100,2);
% featureTestIITD=cell(100,2);
% featureValidationIITD=cell(100,2);
% for i=1:size(trainDataIITD,1)
%     filename=cell2mat(trainDataIITD(i));
%     [S,T]=createiristemplate(filename);
%     featureTrainIITD(i,1)={S};
%     featureTrainIITD(i,2)={T};
%     filename=cell2mat(testDataIITD(i));
%     [S,T]=createiristemplate(filename);
%     featureTestIITD(i,1)={S};
%     featureTestIITD(i,2)={T};
%     filename=cell2mat(validationDataIITD(i));
%     [S,T]=createiristemplate(filename);
%     featureValidationIITD(i,1)={S};
%     featureValidationIITD(i,2)={T};
%     disp(i);
% end
% 
% 
% save('trainDataIITD.mat','trainDataIITD');
% save('validationDataIITD.mat','validationDataIITD');
% save('testDataIITD.mat','testDataIITD');
% save('featureTrainIITD.mat','featureTrainIITD');
% save('featureTestIITD.mat','featureTestIITD');
% save('featureValidationIITD.mat','featureValidationIITD');
% 
% 
% scoreValidationIITD=zeros(size(featureTrainIITD,1),size(featureTrainIITD,1));
% for i=1:size(featureTrainIITD,1)
%     for j=1:size(featureValidationIITD,1)
%         scoreValidationIITD(i,j)=1-gethammingdistance(cell2mat(featureTrainIITD(i,1)), cell2mat(featureTrainIITD(i,2)), cell2mat(featureValidationIITD(j,1)), cell2mat(featureValidationIITD(j,2)), 1);
%     end
%     disp(i);
% end
% 
% 
% scoreTestIITD=zeros(size(featureTrainIITD,1),size(featureTrainIITD,1));
% for i=1:size(featureTrainIITD,1)
%     for j=1:size(featureTestIITD,1)
%         scoreTestIITD(i,j)=1-gethammingdistance(cell2mat(featureTrainIITD(i,1)), cell2mat(featureTrainIITD(i,2)), cell2mat(featureTestIITD(j,1)), cell2mat(featureTestIITD(j,2)), 1);
%     end
%     disp(i);
% end
% 
% save('scoreValidationIITD.mat','scoreValidationIITD');
% save('scoreTestIITD.mat','scoreTestIITD');
% 
% i=1;
% bad=[];
% while i<=size(scoreValidationIITD,1)
%     if scoreValidationIITD(i,i)<0.744
%         bad=[bad;i]; 
%     end
%     i=i+1;
% end
% save('bad.mat','bad');
% 
% trainDataIITD(bad,:)=[];
% validationDataIITD(bad,:)=[];
% testDataIITD(bad,:)=[];
% featureTrainIITD(bad,:)=[];
% featureValidationIITD(bad,:)=[];
% featureTestIITD(bad,:)=[];
% scoreTestIITD(bad,:)=[];
% scoreTestIITD(:,bad)=[];
% scoreValidationIITD(bad,:)=[];
% scoreValidationIITD(:,bad)=[];
% 
% 
% save('trainDataIITD.mat','trainDataIITD');
% save('validationDataIITD.mat','validationDataIITD');
% save('testDataIITD.mat','testDataIITD');
% save('featureTrainIITD.mat','featureTrainIITD');
% save('featureTestIITD.mat','featureTestIITD');
% save('featureValidationIITD.mat','featureValidationIITD');
% save('scoreValidationIITD.mat','scoreValidationIITD');
% save('scoreTestIITD.mat','scoreTestIITD');

UserKey={};
for i=1:size(trainDataIITD,1)
    X=double(cell2mat(featureTrainIITD(i))& ~cell2mat(featureTrainIITD(i)));
    X=X(:);
    UserKey(i)={generateUserkey(size(X,1))};
end
save('UserKey.mat','UserKey');

trainEPDFT={};
testEPDFT={};
for i=1:size(trainDataIITD,1)
    X=double(cell2mat(featureTrainIITD(i)) & ~cell2mat(featureTrainIITD(i)));
    X=X(:);
    key=cell2mat(UserKey(i));
    X=EPDFT(X,key);
    trainEPDFT(i)={X};
    X=double(cell2mat(featureTestIITD(i)) & ~cell2mat(featureTestIITD(i)));
    X=X(:);
    X=EPDFT(X,key);
    testEPDFT(i)={X};
    disp(i);
end
save('trainEPDFT.mat','trainEPDFT');
save('testEPDFT.mat','testEPDFT');
