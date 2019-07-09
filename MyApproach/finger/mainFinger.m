addpath(genpath(pwd));
% APtrain1finger=extract(trainfinger1);
% APtest1finger=extract(testfinger1);
% APtrain2finger=extract(trainfinger2);
% APtrain1finger(1)={map(cell2mat(APtrain1finger(1)))};
% APtrain1finger(2)={map(cell2mat(APtrain1finger(2)))};
% APtest1finger(1)={map(cell2mat(APtest1finger(1)))};
% APtest1finger(2)={map(cell2mat(APtest1finger(2)))};
% APtrain2finger(1)={map(cell2mat(APtrain2finger(1)))};
% APtrain2finger(2)={map(cell2mat(APtrain2finger(2)))};

fvtrain1finger=[cell2mat(APtrain1finger(1)),cell2mat(APtrain1finger(2))];
fvtest1finger=[cell2mat(APtest1finger(1)),cell2mat(APtest1finger(2))];
fvtrain2finger=[cell2mat(APtrain2finger(1)),cell2mat(APtrain2finger(2))];