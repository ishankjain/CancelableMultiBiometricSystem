% test1=[fvtest1,fvtest1face];
% train1=[fvtrain1,fvtrain1face];
% train2=[fvtrain2,fvtrain2face];
k=2;
UserKey1=zeros(size(fvtrain1face,1),size(fvtrain1face,2)/k);
UserKey2=zeros(size(fvtrain1face,1),size(fvtrain1face,2)/k);
train1face=zeros(size(fvtrain1face,1),size(fvtrain1face,2)/k);
train2face=zeros(size(fvtrain1face,1),size(fvtrain1face,2)/k);
test1face=zeros(size(fvtrain1face,1),size(fvtrain1face,2)/k);
train22face=zeros(size(fvtrain1face,1),size(fvtrain1face,2)/k);
for i=1:size(fvtrain1face,1)
    UserKey1(i,:)=sort(randperm(size(fvtrain1face,2),size(fvtrain1face,2)/k));
    UserKey2(i,:)=sort(randperm(size(fvtrain1face,2),size(fvtrain1face,2)/k));
    train1face(i,:)=fvtrain1face(i,UserKey1(i,:));
    train2face(i,:)=fvtrain1face(i,UserKey2(i,:));
    test1face(i,:)=fvtest1face(i,UserKey1(i,:));
    train22face(i,:)=fvtrain2face(i,UserKey1(i,:));
end