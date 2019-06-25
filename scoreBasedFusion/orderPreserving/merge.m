
function [A]=merge(A1,A2)
    load('R.mat');
    load('S1.mat');
    load('S2.mat');
    load('P1.mat');
    load('P2.mat');
    load('J1.mat');
    load('J2.mat');
    for i=1:size(A1,2)
        [~,x]=min(abs(S1-A1(i)));
        [~,y]=min(abs(S2-A2(i)));
        for j=1:size(J1,2)-1
            if x>=J1(j)+1 && x<=J1(j+1)
                u=j;
                break;
            end
        end
        for j=1:size(J2,2)-1
            if y>=J2(j)+1 && y<=J2(j+1)
                v=j;
                break;
            end
        end     
        A(i)=R(u,v);
    end
end