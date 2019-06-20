function [PM,PUM,DS,X]=unlinkabilityFunc()
    load('train.mat')
    load('trainEPDFT.mat')

    UserKey1={};
    i=1;
    for i=1:size(train,2)
        X=double(cell2mat(train(i)));
        X=X(:);
        UserKey1(i)={generateUserkey(size(X,1))};
    end
    data1={};
    for i=1:size(train,2)
        X=double(cell2mat(train(i)));
        X=X(:);
        data1(i)={EPDFT(X,cell2mat(UserKey1(i)))};
    end
    score1=zeros(size(train,2),size(train,2));
    for i=1:size(train,2)
        X=cell2mat(trainEPDFT(i));
        for j=1:size(train,2)
            score1(i,j)=match_biometric(X,cell2mat(data1(j)));
        end
    end
    mated=[];
    unmated=[];
    for i=1:size(score1,1)
        for j=1:size(score1)
            if i==j
                mated=[mated;[score1(i,j)]];
            else
                unmated=[unmated;[score1(i,j)]];
            end
        end
    end
    M = containers.Map('KeyType','double','ValueType','double');
    for i=0:0.01:1
        M(i)=0;
    end
    M(0.35)=0;
    for i=1:size(mated)
        digits(2);
        k=double(vpa(mated(i)));
        M(k)=M(k)+1;
    end
    X=cell2mat(keys(M));
    Y=cell2mat(values(M));
    PM=(Y)/size(mated,1);

    U = containers.Map('KeyType','double','ValueType','double');
    for i=0:0.01:1
        U(i)=0;
    end
    U(0.35)=0;
    for i=1:size(unmated)
        digits(2);
        k=double(vpa(unmated(i)));
        U(k)=U(k)+1;
        disp(i);
    end
    Y=cell2mat(values(U));
    PUM=(Y)/size(unmated,1);

    LR=PM./PUM;
    LR(isnan(LR))=0;
    w=size(mated,1)/size(unmated,1);
    DS=zeros(1,size(LR,2));
    for i=1:size(LR,2)
        if LR(1,i)*w<=1
            DS(1,i)=0;
        else
            DS(1,i)=(2*LR(1,i)*w)/(1+LR(1,i)*w)-1;
        end
    end
%     figure;
%     plot(X,PM,'color','r','LineStyle',':','LineWidth',3);
%     hold on;
%     plot(X,PUM,'color','b','LineStyle','--','LineWidth',3);
%     hold on;
%     plot(X,DS,'color','m','LineStyle','-','LineWidth',3);
%     hold off;
%     legend('mated','unmated','Ds');
%     xlabel('score');
%     ylabel('probability density');
end
