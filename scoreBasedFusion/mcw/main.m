load('score_iris.mat');
load('score_finger.mat');
RA1=rectangularArea(score_finger);
RA2=rectangularArea(sim);
w1=(1/RA1)/((1/RA1)+(1/RA2));
w2=(1/RA2)/((1/RA1)+(1/RA2));
score=w1*score_finger+w2*sim;
genuine=[];
imposter=[];
for i=1:size(score)
    for j=1:size(score)
        if i==j
            genuine=[genuine;[score(i,j)]];
        else
            imposter=[imposter;[score(i,j)]];
        end
    end
end
mus=mean(genuine);
mud=mean(imposter);
vars=var(genuine);
vard=var(imposter);
di=abs(mus-mud)/sqrt((vars+vard)/2);
[EER,~,~,~,~]=EER_DET_conf(genuine,imposter,0.1,10000);