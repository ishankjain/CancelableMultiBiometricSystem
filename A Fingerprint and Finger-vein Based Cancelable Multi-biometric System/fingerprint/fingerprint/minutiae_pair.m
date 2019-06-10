function V=minutiae_pair(M)
    k=1;
    for i=1:size(M,1)
        for j=i+1:size(M,1)
            x=(M(j,1)-M(i,1));
            y=(M(j,2)-M(i,2));
            V(k,1)=sqrt(x*x+y*y);
            theta=atan(y/x);
            V(k,2)=M(i,4)-theta;
            if V(k,2)<0
                V(k,2)=V(k,2)+2*pi;
            elseif V(k,2)>2*pi
                V(k,2)=V(k,2)-2*pi;
            end
            V(k,3)=M(j,4)-theta;
            if V(k,3)<0
                V(k,3)=V(k,3)+2*pi;
            elseif V(k,3)>2*pi
                V(k,3)=V(k,3)-2*pi;
            end
            V(k,4)=M(i,3);
            V(k,5)=M(j,3);
            k=k+1;
        end
    end
%     disp(size(V));
end