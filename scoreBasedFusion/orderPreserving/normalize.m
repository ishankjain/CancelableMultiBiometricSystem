% load('score_finger.mat')
% S=score_finger(1,:);
S=1*rand(1,100);
S=sort(S);
N=size(S,2);
% y=zeros(1,100);
% y(1,100)=1;
y = randi([0 1], 1,N);
% c=1;r=0;uc=0;vc=0;
J(1)=0;
J(2)=N;
% for l=1:N
%     if l==1 || S(l)>S(l-1)
%         u=1;
%         v=y(l);
%     else
%         u=u+1;
%         v=y(l)+v;
%     end
%     if l~=N && S(l)==S(l+1)
%         continue;
%     end
%     while c>1 && (v/u)<=(vc/uc)
%         u=u+uc;
%         v=v+vc;
%         c=c-1;
%     end
%     c=c+1;
%     J(c)=l;
%     uc=u;
%     vc=v;
% end
% J(c+1)=N;
totaly=0;
for l=1:N
    totaly=totaly+y(l);
end
sum=0;
l=1;
for t=1:N
    sum=sum+y(t);
    if (sum/(t-J(l)))<((totaly-sum)/(J(l+1)-t))
        continue;
    else
        l=l+1;
        J(l+1)=J(l);
        J(l)=t;
        totaly=totaly-sum;
        sum=0;
    end
end
for l=1:size(J,2)-1
    sum=0;
    for u=(J(l)+1):J(l+1)
        sum=sum+y(u);
    end
    p=sum/(J(l+1)-J(l));
    for u=J(l)+1:J(l+1)
        P(u)=p;
        if y(u)==0
            P(u)=1-P(u);
        end
    end
end
    