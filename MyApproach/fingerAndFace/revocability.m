% % load('train.mat')
% % load('trainEPDFT.mat')
% % UserKey1={};
% % for i=1:size(train,2)
% %     X=double(cell2mat(train(i)));
% %     X=X(:);
% %     UserKey1(i)={generateUserkey(size(X,1))};
% % end
% % trainEPDFT2={};
% % for i=1:100
% %     X=double(cell2mat(train(i)));
% %     X=X(:);
% %     trainEPDFT2(i)={EPDFT(X,cell2mat(UserKey1(i)))};
% % end
% % train=train(1:35,:);
% % train2=train2(1:35,:);
% score=zeros(size(train1,1),size(train1,1));
% % score=zeros(10,10);
% for i=1:size(train1,1)
%     X=train1(i,:);
%     for j=1:size(train1,1)
%         Y=train22(j,:);
%         score(i,j)=match_biometric(X,Y);
%     end
%     disp(i);
% end
pseudo_imposter=[];
imposter=[];
for i=1:size(score,1)
    for j=1:size(score,1)
        if i==j
            pseudo_imposter=[pseudo_imposter;[score(i,j)]];
        else
            imposter=[imposter;[score(i,j)]];
        end
    end
end
ds=mean(pseudo_imposter)-mean(imposter);
M = containers.Map('KeyType','double','ValueType','double');
for i=0:0.01:1
    M(i)=0;
end
M(0.41)=0;
M(0.47)=0;
M(0.35)=0;
M(0.57)=0;
for i=1:size(pseudo_imposter)
    digits(2);
    k=double(vpa(pseudo_imposter(i)));
    M(k)=M(k)+1;
end
X=cell2mat(keys(M));
Y=cell2mat(values(M));
Y=(Y*100)/size(pseudo_imposter,1);
plot(X,Y,'color','b','LineStyle','--','LineWidth',3);
hold on;

for i=0:0.01:1
    M(i)=0;
end
M(0.35)=0;
for i=1:size(imposter)
    digits(2);
    k=double(vpa(imposter(i)));
    M(k)=M(k)+1;
    disp(i);
end
X=cell2mat(keys(M));
Y=cell2mat(values(M));
Y=(Y*100)/size(imposter,1);
plot(X,Y,'color','r','LineStyle',':','LineWidth',3);
hold on ;

M = containers.Map('KeyType','double','ValueType','double');
for i=0:0.01:1
    M(i)=0;
end
M(0.83)=0;
M(0.82)=0;
M(0.69)=0;
M(0.7)=0;
for i=1:size(genuine,1)
    digits(2);
    k=double(vpa(genuine(i)));
    M(k)=M(k)+1;
end
X=cell2mat(keys(M));
Y=cell2mat(values(M));
Y=(Y*100)/size(genuine,1);
plot(X,Y,'color','y','LineWidth',1);
hold on;

legend('psudo-imposter','imposter','genuine');
xlabel('score');
ylabel('distribution');