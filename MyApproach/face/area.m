function [a]=area(P1)%,P2)
% I=[];
% for i=1:size(P1,1)
%     for j=1:size(P2,1)
%         if abs(P1(i,1)-P2(j,1))<=0.8 && abs(P1(i,2)-P2(j,2))<=0.1
%             I=[I;i,j];
%         end
%     end
% end
% a=0;
% for i=1:size(I,1)-1
%     X=P1(I(i,1):I(i+1,1),1);
%     Y=P1(I(i,1):I(i+1,1),2);
%     a1=trapz(X,Y,1);
%     X=P2(I(i,2):I(i+1,2),1);
%     Y=P2(I(i,2):I(i+1,2),2);
%     a2=trapz(X,Y,1);
%     a=a+abs(a1-a2);
% end
a=trapz(P1(:,1),P1(:,2));%-trapz(P2(:,1),P2(:,2));