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

% score=zeros(size(train1,1),size(test1,1));
% % score=zeros(1,1);
% for i=1:size(train1,1)
%     X=train1(i,:);
%     for j=1:size(test1,1)
%         Y=test1(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

% score=zeros(size(train1,1),size(train2,1));
% % score=zeros(1,1);
% for i=1:size(train1,1)
%     X=train1(i,:);
%     for j=1:size(train2,1)
%         Y=train2(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end

% score=zeros(size(train1,1),size(train22,1));
% % score=zeros(1,1);
% for i=1:size(train1,1)
%     X=train1(i,:);
%     for j=1:size(train22,1)
%         Y=train22(j,:);
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

% score=zeros(size(fvtrain1,1),size(fvtrain2,1));
% % score=zeros(1,1);
% for i=1:size(fvtrain1,1)
%     X=fvtrain1(i,:);
%     for j=1:size(fvtrain2,1)
%         Y=fvtrain2(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end