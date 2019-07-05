score=zeros(size(trainfinger1,1),size(testfinger1,1));
for i=1:size(trainfinger1,1)
    X=trainfinger1(i,:);
    for j=1:size(testfinger1,1)
        Y=testfinger1(j,:);
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end