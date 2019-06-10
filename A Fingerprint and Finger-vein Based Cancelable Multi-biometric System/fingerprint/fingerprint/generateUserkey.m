function key=generateUserkey(maxkey,D,n)
% rng(0,'twister');
key=D;
while size(key,1)<maxkey
    k=randi(n);
    if find(key==k)
        continue;
    end
    key=[key;k];
end
key=sort(key);
end