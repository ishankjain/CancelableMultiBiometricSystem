S1=1*rand(1,100);
S2=1*rand(1,100);
y = randi([0 1], 1,100);
[J1,P1]=normalize(S1,y);
[J2,P2]=normalize(S2,y);
c1=size(J1,2)-1;
c2=size(J2,2)-1;
