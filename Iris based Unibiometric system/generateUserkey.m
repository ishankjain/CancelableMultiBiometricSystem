function key=generateUserkey(K)
% rng(0,'twister');
k=floor(K);
key=randperm(K,k);
key=sort(key);
key=key.';
end