function [r,s] = nor(r,s)
mx=max(max(r),max(s));
mn=min(min(r),min(s));
r = r-mn;
r=r/(mx-mn);
s = s-mn;
s=s/(mx-mn);