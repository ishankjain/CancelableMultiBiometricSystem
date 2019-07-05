score=zeros(size(trainface2,1),size(trainface2,1));
for i=1:size(trainface2,1)
    X=trainface2(i,:);
    for j=1:size(trainface2,1)
        Y=testface2(j,:);
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end