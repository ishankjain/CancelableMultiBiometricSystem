k=2;
UserKey1=zeros(size(fvtrain1,1),size(fvtrain1,2)/k);
UserKey2=zeros(size(fvtrain1,1),size(fvtrain1,2)/k);
train1=zeros(size(fvtrain1,1),size(fvtrain1,2)/k);
train2=zeros(size(fvtrain1,1),size(fvtrain1,2)/k);
test1=zeros(size(fvtrain1,1),size(fvtrain1,2)/k);
train22=zeros(size(fvtrain1,1),size(fvtrain1,2)/k);
for i=1:size(fvtrain1,1)
    UserKey1(i,:)=sort(randperm(size(fvtrain1,2),size(fvtrain1,2)/k));
    UserKey2(i,:)=sort(randperm(size(fvtrain1,2),size(fvtrain1,2)/k));
    train1(i,:)=fvtrain1(i,UserKey1(i,:));
    train2(i,:)=fvtrain1(i,UserKey2(i,:));
    test1(i,:)=fvtest1(i,UserKey1(i,:));
    train22(i,:)=fvtrain2(i,UserKey1(i,:));
end