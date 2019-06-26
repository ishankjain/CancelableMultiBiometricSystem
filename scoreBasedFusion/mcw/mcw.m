function [MC,gentest,imptest]=mcw(V)
%     V=sim;
    genuine=[];
    imposter=[];
    for i=1:size(V)
        for j=1:size(V)
            if i==j
                genuine=[genuine,[V(i,j)]];
            else
                imposter=[imposter,[V(i,j)]];
            end
        end
    end
    mus=mean(genuine);
    mud=mean(imposter);
    [EER,~,FAR,~,x]=EER_DET_conf(genuine,imposter,0.1,10000);
    k=x(FAR==EER);
    k=mean(k);
    MC=((mus-k)/(mud-k))^2;
    imptest=imposter;
    gentest=genuine;
    close all;
end
    
