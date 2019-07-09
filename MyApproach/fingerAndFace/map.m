function A=map(A)
c=-1;
d=1;
a=min(min(A));
b=max(max(A));
A=(A-a)*(d-c)/(b-a)+c;