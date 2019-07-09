addpath(genpath(pwd));
train1=[trainfinger1,trainface1];
train2=[trainfinger2,trainface2];
test1=[testfinger1,testface1];
APtrain1=extract(train1);
APtest1=extract(test1);
APtrain2=extract(train2);
% APtrain1(1)={map(cell2mat(APtrain1(1)))};
% APtrain1(2)={map(cell2mat(APtrain1(2)))};
% APtest1(1)={map(cell2mat(APtest1(1)))};
% APtest1(2)={map(cell2mat(APtest1(2)))};
% APtrain2(1)={map(cell2mat(APtrain2(1)))};
% APtrain2(2)={map(cell2mat(APtrain2(2)))};

fvtrain1=[cell2mat(APtrain1(1)),cell2mat(APtrain1(2))];
fvtest1=[cell2mat(APtest1(1)),cell2mat(APtest1(2))];
fvtrain2=[cell2mat(APtrain2(1)),cell2mat(APtrain2(2))];