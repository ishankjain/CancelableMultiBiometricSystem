function [G1,I1,G2,I2]=testScore()
    per=0.5;
%     score_finger=load('score_finger.mat');
    score_face=load('score_face.mat');
    score_iris=load('score_iris.mat');
%     score_finger=score_finger.score_finger;
    score_face=score_face.score_face;
    score_iris=score_iris.sim;
%     score=score_finger;
    score=score_face;
    genuine1=[];
    imposter1=[];
    for i=1:size(score)
        for j=1:size(score)
            if i==j
                genuine1=[genuine1 [score(i,j)]];
            else
                imposter1=[imposter1 [score(i,j)]];
            end
        end
    end
    G1=genuine1(1,per*size(genuine1,2)+1:size(genuine1,2));
    I1=imposter1(1,per*size(imposter1,2)+1:size(imposter1,2));
    score=score_iris;
    genuine2=[];
    imposter2=[];
    for i=1:size(score)
        for j=1:size(score)
            if i==j
                genuine2=[genuine2 [score(i,j)]];
            else
                imposter2=[imposter2 [score(i,j)]];
            end
        end
    end
    G2=genuine2(1,per*size(genuine2,2)+1:size(genuine2,2));
    I2=imposter2(1,per*size(imposter2,2)+1:size(imposter2,2));
end