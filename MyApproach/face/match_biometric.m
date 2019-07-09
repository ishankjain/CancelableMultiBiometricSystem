function score=match_biometric(query,template)
    score=1-norm(template-query)/(norm(template)+norm(query));
end