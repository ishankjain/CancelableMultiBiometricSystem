addpath(genpath(pwd));
FVtr=trainface1;
% FVte=testface1;
% R2=1000*rand(1,size(FVtr,2))-500;
% save('R2.mat','R2');
% for i=1:size(FVtr,1)
%     FVtr(i,:)=FVtr(i,:)+R2;
% end
% for i=1:size(FVte,1)
%     FVte(i,:)=FVte(i,:)+R;
% end
% train2=cell(100,2);
% test1=cell(100,2);
UserKey2=cell(100,1);
for i=1:size(FVtr,1)
    KEY=2400*rand(1,size(FVtr,2))-1200;
%     UserKey2(i)={KEY};
%     KEY=cell2mat(UserKey(i));
    XR=KEY(1,1:size(KEY,2)/2);
    YR=KEY(1,size(KEY,2)/2+1:size(KEY,2));
    Ar=[];
    Pr=[];
%     X=FVtr(i,1:size(FVtr,2)/2);
%     Y=FVtr(i,size(FVtr,2)/2+1:size(FVtr,2));
    for j=1:4:size(XR,2)
%         p=[-150,0];
%         [x,ind]=sort(X(j:j+3));
%         y=Y(ind);
%         x=X(j:j+3);
%         y=Y(j:j+3);
%         p=[];
%         for k=1:4
%             p=[p;x(k),y(k)];
%         end
% %         p=[p;150,0];
%         P=bezierCurve(p);
        
%         rp=[-150,0];
%         [x,ind]=sort(XR(j:j+3));
%         y=YR(ind);
        x=XR(j:j+3);
        y=YR(j:j+3);
        rp=[];
        for k=1:4
            rp=[rp;x(k),y(k)];
        end
%         rp=[rp;150,0];
        P=bezierCurve(rp);

        [a]=area(P);%,RP);
        Ar=[Ar;a];
        Pr=[Pr;peri(P)];%,RP)];
%         disp(size(I));
%         disp(a);
%         pause;
%         disp(j);
%         close all;
    end
%     train2(i,1)={Ar};
%     train2(i,2)={Pr};
    UserKey2(i,1)={Ar};
    UserKey2(i,2)={Pr};

%     Ar=[];
%     Pr=[];
%     X=FVte(i,1:size(FVte,2)/2);
%     Y=FVte(i,size(FVte,2)/2+1:size(FVte,2));
%     for j=1:4:size(X,2)
% %         p=[-150,0];
% %         [x,ind]=sort(X(j:j+3));
% %         y=Y(ind);
%         x=X(j:j+3);
%         y=Y(j:j+3);
%         p=[];
%         for k=1:4
%             p=[p;x(k),y(k)];
%         end
% %         p=[p;150,0];
%         P=bezierCurve(p);
%         
% %         rp=[-150,0];
% %         [x,ind]=sort(XR(j:j+3));
% %         y=YR(ind);
%         x=XR(j:j+3);
%         y=YR(j:j+3);
%         rp=[];
%         for k=1:4
%             rp=[rp;x(k),y(k)];
%         end
% %         rp=[rp;150,0];
%         RP=bezierCurve(rp);
% 
%         [a]=area(P,RP);
%         Ar=[Ar;a];
%         Pr=[Pr;peri(P,RP)];
% %         disp(size(I));
% %         disp(a);
% %         pause;
% %         disp(j);
% %         close all;
%     end
%     test1(i,1)={Ar};
%     test1(i,2)={Pr};
    disp(i);
%     save('train2.mat','train2');
%     save('test1.mat','test1');
    save('UserKey2.mat','UserKey2');
end

