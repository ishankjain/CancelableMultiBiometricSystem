% test1=[fvtest1,fvtest1finger];
% train1=[fvtrain1,fvtrain1finger];
% train2=[fvtrain2,fvtrain2finger];
k=2;
UserKey1=zeros(size(fvtrain1finger,1),size(fvtrain1finger,2)/k);
UserKey2=zeros(size(fvtrain1finger,1),size(fvtrain1finger,2)/k);
train1finger=zeros(size(fvtrain1finger,1),size(fvtrain1finger,2)/k);
train2finger=zeros(size(fvtrain1finger,1),size(fvtrain1finger,2)/k);
test1finger=zeros(size(fvtrain1finger,1),size(fvtrain1finger,2)/k);
train22finger=zeros(size(fvtrain1finger,1),size(fvtrain1finger,2)/k);
for i=1:size(fvtrain1finger,1)
    UserKey1(i,:)=sort(randperm(size(fvtrain1finger,2),size(fvtrain1finger,2)/k));
    UserKey2(i,:)=sort(randperm(size(fvtrain1finger,2),size(fvtrain1finger,2)/k));
    train1finger(i,:)=fvtrain1finger(i,UserKey1(i,:));
    train2finger(i,:)=fvtrain1finger(i,UserKey2(i,:));
    test1finger(i,:)=fvtest1finger(i,UserKey1(i,:));
    train22finger(i,:)=fvtrain2finger(i,UserKey1(i,:));
end