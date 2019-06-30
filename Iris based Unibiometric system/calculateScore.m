addpath(genpath(pwd));
scoreCombined=zeros(size(CFtrain,1),size(CFtrain,1));
for i=1:size(CFtrain,1)
    for j=1:size(CFtest,1)
        scoreCombined(i,j)=1-gethammingdistance(cell2mat(CFtrain(i,1)), cell2mat(CFtrain(i,2)), cell2mat(CFtest(j,1)), cell2mat(CFtest(j,2)), 1);
%         X=cell2mat(CFtrain(i,1))&cell2mat(CFtrain(i,2));
%         Y=cell2mat(CFtest(j,1))&cell2mat(CFtest(j,2));
%         scoreCombined(i,j)=cosine(double(X(:)),double(Y(:)));
    end
    disp(i);
end