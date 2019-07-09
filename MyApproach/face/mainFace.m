addpath(genpath(pwd));
APtrain1face=extract(trainface1);
APtest1face=extract(testface1);
APtrain2face=extract(trainface2);
% APtrain1face(1)={map(cell2mat(APtrain1(1)))};
% APtrain1face(2)={map(cell2mat(APtrain1(2)))};
% APtest1face(1)={map(cell2mat(APtest1(1)))};
% APtest1face(2)={map(cell2mat(APtest1(2)))};
% APtrain2face(1)={map(cell2mat(APtrain2(1)))};
% APtrain2face(2)={map(cell2mat(APtrain2(2)))};

fvtrain1face=[cell2mat(APtrain1face(1)),cell2mat(APtrain1face(2))];
fvtest1face=[cell2mat(APtest1face(1)),cell2mat(APtest1face(2))];
fvtrain2face=[cell2mat(APtrain2face(1)),cell2mat(APtrain2face(2))];