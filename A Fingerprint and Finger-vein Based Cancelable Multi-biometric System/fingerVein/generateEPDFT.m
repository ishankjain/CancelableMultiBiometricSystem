S=load('FingerVein.mat');
V=(S.FingerVein);
S=load('UserKey.mat');
W=S.UserKey;
T={};
for i=1:2952
    X=double(cell2mat(V(i)));
    X=X(:);
    X=EPDFT(X,cell2mat(W(floor((i-1)/24)+1)));
    T(i)={X};
    disp(i);
end
save('EPDFT.mat','T');