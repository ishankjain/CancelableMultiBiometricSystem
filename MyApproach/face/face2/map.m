function A=map(A)
c=-1000;
d=1000;
a=min(min(A));
b=max(max(A));
A=(A-a)*(d-c)/(b-a)+c;