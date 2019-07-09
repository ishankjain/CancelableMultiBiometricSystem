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

% score=zeros(size(train1finger,1),size(test1finger,1));
% % score=zeros(1,1);
% for i=1:size(train1finger,1)
%     X=train1finger(i,:);
%     for j=1:size(test1finger,1)
%         Y=test1finger(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

% score=zeros(size(train1finger,1),size(train2finger,1));
% % score=zeros(1,1);
% for i=1:size(train1finger,1)
%     X=train1finger(i,:);
%     for j=1:size(train2finger,1)
%         Y=train2finger(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

% score=zeros(size(train1finger,1),size(train22finger,1));
% % score=zeros(1,1);
% for i=1:size(train1finger,1)
%     X=train1finger(i,:);
%     for j=1:size(train22finger,1)
%         Y=train22finger(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

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

% score=zeros(size(fvtrain1finger,1),size(fvtrain2finger,1));
% % score=zeros(1,1);
% for i=1:size(fvtrain1finger,1)
%     X=fvtrain1finger(i,:);
%     for j=1:size(fvtrain2finger,1)
%         Y=fvtrain2finger(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

% score=zeros(size(fvtrain1finger,1),size(fvtest1finger,1));
% % score=zeros(1,1);
% for i=1:size(fvtest1finger,1)
%     X=fvtrain1finger(i,:);
%     for j=1:size(fvtest1finger,1)
%         Y=fvtest1finger(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

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
