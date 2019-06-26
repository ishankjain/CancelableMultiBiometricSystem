function [RA,gentest,imptest]=rectangularArea(V)
%     V=sim;
    per=1;
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
    [EER,OP,FAR,FRR,x]=EER_DET_conf(genuine(1,1:per*size(genuine,2)),imposter(1,1:per*size(imposter,2)),0.1,10000);
    zFAR=-1;
    zFRR=-1;
    for i=1:size(FAR,2)
        if FAR(1,i)==0
            zFAR=x(i);
            break;
        end
    end
    if zFAR==-1
        for i=1:size(FAR,2)
            if round(FAR(1,i))==0
                zFAR=x(i);
                break;
            end
        end
    end
    for i=1:size(FRR,2)
        if FRR(1,i)~=0
            zFRR=x(i-1);
            break;
        end
    end
    if zFRR==-1
        for i=1:size(FRR,2)
            if round(FRR(1,i))~=0
                zFRR=x(i-1);
                break;
            end
        end
    end
    RA=EER*(zFAR-zFRR);
    per=0;
    gentest=genuine(1,per*size(genuine,2)+1:size(genuine,2));
    imptest=imposter(1,per*size(imposter,2)+1:size(imposter,2));
% end
