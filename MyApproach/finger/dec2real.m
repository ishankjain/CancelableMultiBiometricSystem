V=DecimalTrain;
m=0;
for i=1:size(V,1)
    X=cell2mat(V(i));
    k=max(X);
    m=max(m,k);
end
length=ceil(log2(m));
finger_train_fv=zeros(100,2^length);
finger_test_fv=zeros(100,2^length);
for i=1:size(V,1)
    fv=zeros(2^length,1);
    D=cell2mat(DecimalTrain(i));
    D=D+1;
    fv(D)=1;
    fv=wavelet(fv);
    finger_train_fv(i,:)=fv.';
    
    fv=zeros(2^length,1);
    D=cell2mat(DecimalTest(i));
    D=D+1;
    fv(D)=1;
    fv=wavelet(fv);
    finger_test_fv(i,:)=fv.';
end
save('finger_test_fv.mat','finger_test_fv');
save('finger_train_fv.mat','finger_train_fv');