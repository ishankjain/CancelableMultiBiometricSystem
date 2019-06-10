function [BV, lengthbinary]=quantization(V)
    %quantization step sizes
    sl=17;
    sangle=pi/7;
    lbits=ceil(log2(ceil(max(V(:,1))/sl)));
    anglebits=ceil(log2(2*pi/sangle));
    lengthbinary=lbits+2*anglebits+2;
    BL=de2bi(round(V(:,1)/sl),lbits,'left-msb');
    Balpha=de2bi(round(V(:,2)/sangle),anglebits,'left-msb');
    Bbeta=de2bi(round(V(:,3)/sangle),anglebits,'left-msb');
    BT=V(:,4:5);
    BT=(BT==1);
    BV=[BL Balpha Bbeta BT];
end