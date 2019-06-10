score=zeros(size(trainFP,2),size(trainFP,2));
for i=1:size(trainFP,2)
    X=[cell2mat(trainFP(i));cell2mat(trainFV(i))];
    for j=1:size(trainFP,2)
        Y=[cell2mat(testFP(j));cell2mat(testFV(j))];
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end
save('score.mat','score');