S=load('FingerVein.mat');
V=(S.FingerVein);
UserKey={};
k=1;
i=1;
while i<=2952
    X=double(cell2mat(V(i)));
    X=X(:);
    UserKey(k)={generateUserkey(size(X,1))};
    k=k+1;
    i=i+24;
end
save('UserKey.mat','UserKey');