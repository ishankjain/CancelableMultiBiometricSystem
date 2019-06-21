function [J,P]=normalize(S,y)
    % load('score_finger.mat')
    % S=score_finger(1,:);
%     S=1*rand(1,100); 
    N=size(S,2);
    % y=zeros(1,100);
    % y(1,100)=1;
%     y = randi([0 1], 1,N);
    [~, b]=sort(S);
    y=y(b);
    for i=0:N
        J(i+1)=i;
    end
    while 1
        extra=[];
        k=1;
        for i=1:size(J,2)-2
            if (sum(y(1,J(i)+1:J(i+1)))/(J(i+1)-J(i)))>=(sum(y(1,J(i+1)+1:J(i+2)))/(J(i+2)-J(i+1)))
                extra(k)=i+1;
                k=k+1;
            end
        end
        J(extra)=[];
        if size(extra,2)==0
            break;
        end
    end
    l=1;
    flag=0;
    for t=1:N-1
        if t==J(l+1)
            l=l+1;
        end
        if (sum(y(1,J(l)+1:t))/(t-J(l)))<(sum(y(1,t+1:J(l+1)))/(J(l+1)-t))
            flag=1;
            break;
        end
    end
    for l=1:size(J,2)-1
        p=sum(y(1,(J(l)+1):J(l+1)))/(J(l+1)-J(l));
        P(J(l)+1:J(l+1))=p;
    end
end