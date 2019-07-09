% score=zeros(size(train1,1),size(train1,1));
% % score=zeros(10,10);
% for i=1:size(train1,1)
%     X=[cell2mat(train1(i,1));cell2mat(train1(i,2))];
%     for j=1:size(train1,1)
%         Y=[cell2mat(train2(j,1));cell2mat(train2(j,2))];
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end
% 
% score=zeros(size(train1,1),size(train1,1));
% % score=zeros(10,10);
% for i=1:size(train1,1)
%     X=[cell2mat(train1(i,1));cell2mat(train1(i,2))];
%     for j=1:size(test1,1)
%         Y=[cell2mat(test1(j,1));cell2mat(test1(j,2))];
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end
% 
% score=zeros(size(trainface1,1),size(trainface1,1));
% % score=zeros(1,1);
% for i=1:size(trainface1,1)
%     X=trainface1(i,:);
%     for j=1:size(trainface1,1)
%         Y=testface1(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

% score=zeros(size(train1face,1),size(test1face,1));
% % score=zeros(1,1);
% for i=1:size(train1face,1)
%     X=train1face(i,:);
%     for j=1:size(test1face,1)
%         Y=test1face(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

score=zeros(size(train1face,1),size(train2face,1));
% score=zeros(1,1);
for i=1:size(train1face,1)
    X=train1face(i,:);
    for j=1:size(train2face,1)
        Y=train2face(j,:);
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end
% 
score=zeros(size(train1face,1),size(train22face,1));
% score=zeros(1,1);
for i=1:size(train1face,1)
    X=train1face(i,:);
    for j=1:size(train22face,1)
        Y=train22face(j,:);
        score(i,j)=match_biometric(X,Y);
    end
    disp(i);
end
% 
% score=zeros(size(Userkey1,1),size(Userkey2,1));
% % score=zeros(1,1);
% for i=1:size(Userkey1,1)
%     X=Userkey1(i,:);
%     for j=1:size(Userkey2,1)
%         Y=Userkey2(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end
% 
% score=zeros(size(fvtrain1face,1),size(fvtrain2face,1));
% % score=zeros(1,1);
% for i=1:size(fvtrain1face,1)
%     X=fvtrain1face(i,:);
%     for j=1:size(fvtrain2face,1)
%         Y=fvtrain2face(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end
% 
% score=zeros(size(fvtrain1face,1),size(fvtest1face,1));
% % score=zeros(1,1);
% for i=1:size(fvtest1face,1)
%     X=fvtrain1face(i,:);
%     for j=1:size(fvtest1face,1)
%         Y=fvtest1face(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end
% 
% score=zeros(size(UserKey1,1),size(UserKey2,1));
% % score=zeros(1,1);
% for i=1:size(UserKey1,1)
%     X=UserKey1(i,:);
%     for j=1:size(UserKey2,1)
%         Y=UserKey2(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end
