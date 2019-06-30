addpath(genpath(pwd));

% path='MMU2_Iris_Database/';
% Files=dir(path);
% user=1;
% i=1;
% trainDataMMU=cell(100,1);
% validationDataMMU=cell(100,1);
% testDataMMU=cell(100,1);
% while user<=199
%     path2=strcat(path,Files(i).name);
%     x=strcat(path,'.');
%     y=path2(1:size(x,2));
%     if strcmp(x,y)
%         i=i+1;
%         continue;
%     end
%     iname=path2;
%     trainDataMMU(user,1)={iname};
%     iname=strcat(path,Files(i+1).name);
%     validationDataMMU(user,1)={iname};
%     iname=strcat(path,Files(i+2).name);
%     testDataMMU(user,1)={iname};
%     disp(user);
%     i=i+5;
%     user=user+1;
% end

 
% featureTrainMMU=cell(100,2);
% featureTestMMU=cell(100,2);
% featureValidationMMU=cell(100,2);
% for i=151:size(trainDataMMU,1)
%     filename=cell2mat(trainDataMMU(i));
%     [S,T]=createiristemplate(filename);
%     featureTrainMMU(i,1)={S};
%     featureTrainMMU(i,2)={T};
%     filename=cell2mat(testDataMMU(i));
%     [S,T]=createiristemplate(filename);
%     featureTestMMU(i,1)={S};
%     featureTestMMU(i,2)={T};
%     filename=cell2mat(validationDataMMU(i));
%     [S,T]=createiristemplate(filename);
%     featureValidationMMU(i,1)={S};
%     featureValidationMMU(i,2)={T};
%     disp(i);
% end
% 
% 
% save('trainDataMMU.mat','trainDataMMU');
% save('validationDataMMU.mat','validationDataMMU');
% save('testDataMMU.mat','testDataMMU');
% save('featureTrainMMU.mat','featureTrainMMU');
% save('featureTestMMU.mat','featureTestMMU');
% save('featureValidationMMU.mat','featureValidationMMU');
% 
% % 
% scoreValidationMMU=zeros(size(featureTrainMMU,1),size(featureTrainMMU,1));
% for i=1:size(featureTrainMMU,1)
%     for j=1:size(featureValidationMMU,1)
%         scoreValidationMMU(i,j)=1-gethammingdistance(cell2mat(featureTrainMMU(i,1)), cell2mat(featureTrainMMU(i,2)), cell2mat(featureValidationMMU(j,1)), cell2mat(featureValidationMMU(j,2)), 1);
% %         X=cell2mat(featureTrainMMU(i,1))&cell2mat(featureTrainMMU(i,2));
% %         Y=cell2mat(featureValidationMMU(j,1))&cell2mat(featureValidationMMU(j,2));
% %         scoreValidationMMU(i,j)=cosine(double(X(:)),double(Y(:)));
%     end
%     disp(i);
% end
% 
% 
% scoreTestMMU=zeros(size(featureTrainMMU,1),size(featureTrainMMU,1));
% for i=1:size(featureTrainMMU,1)
%     for j=1:size(featureTestMMU,1)
% %         scoreTestMMU(i,j)=1-gethammingdistance(cell2mat(featureTrainMMU(i,1)), cell2mat(featureTrainMMU(i,2)), cell2mat(featureTestMMU(j,1)), cell2mat(featureTestMMU(j,2)), 1);
%         X=cell2mat(featureTrainMMU(i,1))&cell2mat(featureTrainMMU(i,2));
%         Y=cell2mat(featureTestMMU(j,1))&cell2mat(featureTestMMU(j,2));
%         scoreTestMMU(i,j)=cosine(double(X(:)),double(Y(:)));
% %         scoreTestMMU(i,j)=match_biometric();
%     end
%     disp(i);
% end
% 
% save('scoreValidationMMUhamming.mat','scoreValidationMMU');
% save('scoreTestMMU.mat','scoreTestMMU');

% i=1;
% k=2;
% bad=[];
% while i<=size(scoreValidationMMU,1)
%     if scoreValidationMMU(i,i)<0.617
%         if k<=0
%             bad=[bad;i]; 
%         end
%         k=k-1;
%     end
%     i=i+1;
%         
% end
% save('bad.mat','bad');

trainDataMMU(bad,:)=[];
validationDataMMU(bad,:)=[];
% testDataIITD(bad,:)=[];
featureTrainMMU(bad,:)=[];
featureValidationMMU(bad,:)=[];
% featureTestMMU(bad,:)=[];
% scoreTestMMU(bad,:)=[];
% scoreTestMMU(:,bad)=[];
scoreValidationMMU(bad,:)=[];
scoreValidationMMU(:,bad)=[];


% i=1;
% k=2;
% bad=[];
% while i<=size(scoreTestMMU,1)
%     if scoreTestMMU(i,i)<0.44
%         if k<=0
%             bad=[bad;i];
%         end
%         k=k-1;
%     end
%     i=i+1;
% end
% scoreTestMMU(bad,:)=[];
% scoreTestMMU(:,bad)=[];

save('featureTrainMMUmodified.mat','featureTrainMMU');
save('featureValidationMMUmodified.mat','featureValidationMMU');
save('scoreValidationMMUmodifiedHamming.mat','scoreValidationMMU');
save('trainDataMMUmodified.mat','trainDataMMU');
save('validationDataMMUmodified.mat','validationDataMMU');