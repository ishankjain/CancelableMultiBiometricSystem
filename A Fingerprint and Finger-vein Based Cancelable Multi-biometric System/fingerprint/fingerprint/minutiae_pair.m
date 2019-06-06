addpath(genpath(pwd));

filename='102_1.tif';
img = imread(filename);
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp(['Extracting features from ' filename ' ...']);
ffnew=ext_finger(img,1);
k=1;
for i=1:size(ffnew,1)
    if ffnew(i,3)<4
        M(k,:)=ffnew(i,1:4);
        k=k+1;
    end
end
k=1;
c=0;
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
%quantization step sizes
sl=6;
sangle=pi/30;
lbits=ceil(log2(max(V(:,1))/sl));
anglebits=ceil(log2(2*pi/sangle));
lengthbinary=lbits+2*anglebits+2;
BL=de2bi(floor(V(:,1)/sl),lbits,'left-msb');
Balpha=de2bi(floor(V(:,2)/sangle),anglebits,'left-msb');
Bbeta=de2bi(floor(V(:,3)/sangle),anglebits,'left-msb');
BT=V(:,4:5);
BT=(BT==1);
BV=[BL Balpha Bbeta BT];
D=bi2de(BV,'left-msb');
BP=zeros(2^20,1);  %binary feature vector
BP(D)=1;
tem=(unique(D));