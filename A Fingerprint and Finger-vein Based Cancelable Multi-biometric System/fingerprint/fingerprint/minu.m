function M=minu(minutiae)
    k=1;
    for i=1:size(minutiae,1)
        if minutiae(i,3)<4
            M(k,:)=minutiae(i,1:4);
            k=k+1;
        end
    end
%     disp(size(M));
end