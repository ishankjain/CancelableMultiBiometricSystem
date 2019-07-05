addpath(genpath(pwd));
% trainface2=map(trainface2);
% testface1=map(testface1);
APtrain2=extract(trainface2);
% fvtest1=extract(testface1);
% Userkey1=zeros(size(trainface2,1),size(trainface2,2));
% Userkey2=zeros(size(trainface2,1),size(trainface2,2));
% for i=1:size(trainface2,1)
%     KEY=2000*rand(1,size(trainface2,2))-1000;
%     Userkey1(i,:)=KEY;
%     KEY=2000*rand(1,size(trainface2,2))-1000;
%     Userkey2(i,:)=KEY;
% end
% Userkey1=extract(Userkey1);
% Userkey2=extract(Userkey2);
% fvtrain2(1)={map(cell2mat(fvtrain2(1)))};
% fvtrain2(2)={map(cell2mat(fvtrain2(2)))};
% fvtest1(1)={map(cell2mat(fvtest1(1)))};
% fvtest1(2)={map(cell2mat(fvtest1(2)))};
% Userkey1(1)={map(cell2mat(Userkey1(1)))};
% Userkey1(2)={map(cell2mat(Userkey1(2)))};
% Userkey2(1)={map(cell2mat(Userkey2(1)))};
% Userkey2(2)={map(cell2mat(Userkey2(2)))};

fvtrain2=[cell2mat(APtrain2(1)),cell2mat(APtrain2(2))];
% fvtest1=[cell2mat(fvtest1(1)),cell2mat(fvtest1(2))];
% Userkey1=[cell2mat(Userkey1(1)),cell2mat(Userkey1(2))];
% Userkey2=[cell2mat(Userkey2(1)),cell2mat(Userkey2(2))];