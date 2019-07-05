function p = pearson(a,b)
    c = cov(a,b);
    covar = c(1,2);
    p = covar/(std(a)*std(b));
    
end