load('score_iris.mat');
load('score_finger.mat');
load('score_face.mat');
[MC1,gentest1,imptest1]=mcw(score_finger);
[MC2,gentest2,imptest2]=mcw(sim);
[MC3,gentest3,imptest3]=mcw(score_face);
% tot=sum(MC1)+sum(MC2);
% W1(1,1:size(MC1,2))=MC1/tot;
% W2(1,1:size(MC2,2))=MC2/tot;
% genuine=gentest1.*W1+gentest2.*W2;
% k=1;
% for i=1:size(W1,2)
%     imposter(1,k:k+98)=imptest1(1,k:k+98)*W1(1,i)+imptest2(1,k:k+98)*W2(1,i);
%     k=k+99;
% end
w1=MC1/(MC1+MC2+MC3);
w2=MC2/(MC1+MC2+MC3);
w3=MC3/(MC1+MC2+MC3);
genuine=w1*gentest1+w2*gentest2+w3*gentest3;
imposter=w1*imptest1+w2*imptest2+w3*imptest3;
mus=mean(genuine);
mud=mean(imposter);
vars=var(genuine);
vard=var(imposter);
di=abs(mus-mud)/sqrt((vars+vard)/2);
[EER,~,FAR,FRR,x]=EER_DET_conf(genuine,imposter,0.1,10000);