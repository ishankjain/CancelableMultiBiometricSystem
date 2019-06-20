function Y=EPDFT(fv,key)
%     fv=randi([0 1], 1024,1);
%     key=[2,4,7 9,12,19,27,39,49,68,74,96,99];
    wname='dmey';
    n=floor(log2(size(fv,1)));
    [LoD,HiD,~,~] = wfilters(wname);
    [fv,~]=wavedec(fv,n,LoD,HiD);
    y=fft(fv);
    Y=y(key);
end
