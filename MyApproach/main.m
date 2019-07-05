addpath(genpath(pwd));
FVtr=ft_train_face;
FVte=ft_test_face;
% FVtr=finger_train_fv;
% FVte=finger_test_fv;
% trainEPDFT1=reshape(trainEPDFT1,[100,1]);    
% testEPDFT1=reshape(testEPDFT1,[100,1]); 
% ft_train_face = cellfun(@(x)reshape(x,1,[]),ft_train_face,'un',0);
% ft_train_face = cell2mat(ft_train_face);
% ft_test_face = cellfun(@(x)reshape(x,1,[]),ft_test_face,'un',0);
% ft_test_face = cell2mat(ft_test_face);
% save('ft_test_face2.mat','ft_test_face');
% save('ft_train_face2.mat','ft_train_face');
% FVtr=trainEPDFT1(:,1:floor(size(trainEPDFT1,2)/8)*8);
% FVte=testEPDFT1(:,1:floor(size(testEPDFT1,2)/8)*8);
% R=200*rand(1,size(FVtr,2))-100;
% save('R.mat','R');
% for i=1:size(FVtr,1)
%     FVtr(i,:)=FVtr(i,:)+R;
% end
% train=cell(100,2);
% test=cell(100,2);
% UserKey=cell(100,1);
for i=13:size(FVtr,1)
%     KEY=200*rand(1,size(FVtr,2))-100;
%     UserKey(i)={KEY};
%     KEY=cell2mat(UserKey(i));
%     XR=KEY(1,1:size(KEY,2)/2);
%     YR=KEY(1,size(KEY,2)/2+1:size(KEY,2));
    Ar=[];
    Pr=[];
    X=FVtr(i,1:size(FVtr,2)/2);
    Y=FVtr(i,size(FVtr,2)/2+1:size(FVtr,2));
    for j=1:4:size(X,2)
%         p=[-150,0];
%         [x,ind]=sort(X(j:j+3));
%         y=Y(ind);
        x=X(j:j+3);
        y=Y(j:j+3);
        p=[];
        for k=1:4
            p=[p;x(k),y(k)];
        end
%         p=[p;150,0];
        P=bezierCurve(p);
        
%         rp=[-150,0];
%         [x,ind]=sort(XR(j:j+3));
%         y=YR(ind);
%         x=XR(j:j+3);
%         y=YR(j:j+3);
%         rp=[];
%         for k=1:4
%             rp=[rp;x(k),y(k)];
%         end
% %         rp=[rp;150,0];
%         RP=bezierCurve(rp);

        [a]=area(P);%,RP);
        Ar=[Ar;a];
        Pr=[Pr;peri(P)];%,RP)];
%         disp(size(I));
%         disp(a);
%         pause;
%         disp(j);
%         close all;
    end
    train(i,1)={Ar};
    train(i,2)={Pr};

    Ar=[];
    Pr=[];
    X=FVte(i,1:size(FVte,2)/2);
    Y=FVte(i,size(FVte,2)/2+1:size(FVte,2));
    for j=1:4:size(X,2)
%         p=[-150,0];
%         [x,ind]=sort(X(j:j+3));
%         y=Y(ind);
        x=X(j:j+3);
        y=Y(j:j+3);
        p=[];
        for k=1:4
            p=[p;x(k),y(k)];
        end
%         p=[p;150,0];
        P=bezierCurve(p);
        
%         rp=[-150,0];
%         [x,ind]=sort(XR(j:j+3));
%         y=YR(ind);
%         x=XR(j:j+3);
%         y=YR(j:j+3);
%         rp=[];
%         for k=1:4
%             rp=[rp;x(k),y(k)];
%         end
% %         rp=[rp;150,0];
%         RP=bezierCurve(rp);

        [a]=area(P);%,RP);
        Ar=[Ar;a];
        Pr=[Pr;peri(P)];%,RP)];
%         disp(size(I));
%         disp(a);
%         pause;
%         disp(j);
%         close all;
    end
    test(i,1)={Ar};
    test(i,2)={Pr};
    disp(i);
    save('train.mat','train');
    save('test.mat','test');
%     save('UserKey.mat','UserKey');
end
