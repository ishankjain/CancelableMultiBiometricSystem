function [fv]=wavelet(fv)
%     wname='dmey';
%     n=floor((log2(size(fv,1)))/8)*8;
%     [LoD,HiD,~,~] = wfilters(wname);
%     [fv,~]=wavedec(fv,n,LoD,HiD);
        fv=fft(fv);