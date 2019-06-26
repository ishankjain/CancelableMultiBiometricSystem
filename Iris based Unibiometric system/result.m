S=load('scoreTest.mat');
V=S.scoreTest;
genuine=[];
imposter=[];
for i=1:size(V)
    for j=1:size(V)
        if i==j
            genuine=[genuine;[V(i,j)]];
        else
            imposter=[imposter;[V(i,j)]];
        end
    end
end
mus=nanmean(genuine);
mud=nanmean(imposter);
vars=nanvar(genuine);
vard=nanvar(imposter);
di=abs(mus-mud)/sqrt((vars+vard)/2);
[EER,OP]=EER_DET_conf(genuine,imposter,0.1,10000);