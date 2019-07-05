function R=extract(A)
R=cell(2,1);
Area=zeros(size(A,1),size(A,2)/8);
Peri=zeros(size(A,1),size(A,2)/8);
for i=1:size(A,1)
    Ar=[];
    Pr=[];
    X=A(i,1:size(A,2)/2);
    Y=A(i,size(A,2)/2+1:size(A,2));
    for j=1:4:size(X,2)
        x=X(j:j+3);
        y=Y(j:j+3);
        p=zeros(4,2);
        for k=1:4
            p(k,1)=x(k);
            p(k,2)=y(k);
        end
        P=bezierCurve(p);
        
        [a]=area(P);
        Ar=[Ar;a];
        Pr=[Pr;peri(P)];
    end
    Area(i,:)=Ar;
    Peri(i,:)=Pr;
    disp(i);
end
R(1)={Area};
R(2)={Peri};
