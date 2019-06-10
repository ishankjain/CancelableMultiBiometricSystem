function Y=EPDFT(fv,key)
%     fv=randi([0 1], 1024,1);
%     key=[2,4,7 9,12,19,27,39,49,68,74,96,99];
    wname='dmey';
%     n=wmaxlev(size(fv),wname);
    n=floor(log2(size(fv,1)));
    [LoD,HiD,~,~] = wfilters(wname);
    [fv,~]=wavedec(fv,n,LoD,HiD);
    y=fft(fv);
    Y=y(key);
%     k=1;
%     key=sort(key);
%     for i=1:size(key)
%         if(key(i,1)<size(y,1))
%             Y(k,1)=y(i,1);
%         end
%     end
end
