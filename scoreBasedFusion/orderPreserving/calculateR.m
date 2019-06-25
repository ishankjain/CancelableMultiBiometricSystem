function R=calculateR(Mplus,Mminus)
%     Mplus=rand(5,6);
%     Mminus=rand(5,6);
%     c=1;
%     intervals={};
%     k=1;
%     for i=1:size(Mplus,1)
%         for j=1:size(Mplus,2)
%             A(k,:)=[i j];
%             k=k+1;
%         end
%     end
%     intervals(1)={A};
%     exit=0;
%     while ~exit
%         
%     end
    c1=size(Mplus,1);
    c2=size(Mplus,2);
    R=Mplus./(Mplus+Mminus);
    for i=1:min(c1,c2)/2
        x=sum(Mplus(i,i+1:c2))+Mplus(i,i)+sum(Mplus(i+1:c1,i));
        y=sum(Mminus(i,i+1:c2))+Mminus(i,i)+sum(Mminus(i+1:c1,i));
        R(i,i:c2)=x/(x+y);
        R(i:c1,i)=x/(x+y);
    end
end