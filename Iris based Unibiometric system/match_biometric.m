function score=match_biometric(query,template)
    score=1-norm(double(template)-double(query))/(norm(double(template))+norm(double(query)));
end