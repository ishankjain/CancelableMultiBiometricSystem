score=zeros(size(trainCombined,2),size(trainCombined,2));
for i=1:size(trainCombined,2)
    X=cell2mat(trainCombined(i));
    for j=1:size(trainCombined,2)
        Y=cell2mat(testCombined(j));
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end