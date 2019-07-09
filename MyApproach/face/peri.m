function perimeter=peri(P1)%,P2)
p1=0;
for i=1:size(P1,1)-1
    dx=P1(i,1)-P1(i+1,1);
    dy=P1(i,2)-P1(i+1,2);
    p1=p1+sqrt(dx*dx+dy*dy);
end
p2=0;
% for i=1:size(P2,1)-1
%     dx=P2(i,1)-P2(i+1,1);
%     dy=P2(i,2)-P2(i+1,2);
%     p2=p2+sqrt(dx*dx+dy*dy);
% end
perimeter=p1+p2;


