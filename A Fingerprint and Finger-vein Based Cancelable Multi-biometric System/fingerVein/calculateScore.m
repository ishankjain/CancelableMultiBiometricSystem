S=load('EPDFT.mat');
V=(S.T);
score=zeros(2952,2952);
for i=1:2952
    for j=1:2952
        X=cell2mat(V(i));
        Y=cell2mat(V(j));
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end
save('score.mat','score');