feature = load('test');
test = feature.test;
feature = load('train');
train = feature.train;
ft=300;
gen = zeros(ft,1);
imp = zeros(ft*(ft-1),1);
ci=1;
for i=1:300
    disp(i);
    for j=1:300
        if i==j
            gen(i,1) = pearson(transpose(cell2mat(train(i,1))),transpose(cell2mat(test(j,1))));
        else
            imp(ci,1) = pearson(transpose(cell2mat(train(i,1))),transpose(cell2mat(test(j,1))));
            ci=ci+1;
        end
    end
end
[gen,imp] = nor(gen,imp);
[EER, OP]=EER_DET_conf(gen,imp,0.1,20000);