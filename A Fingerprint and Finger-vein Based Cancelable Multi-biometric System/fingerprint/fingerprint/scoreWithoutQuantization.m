% addpath(genpath(pwd));
% load('trainData.mat');
% load('testData.mat');
% MinutiaeTrain={};
% MinutiaeTest={};
% for i=1:size(trainData,1)
%     filename=cell2mat(trainData(i));
%     img = imread(filename);
%     if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
%     img=imresize(img,[388 374]);
%     minutiae=ext_minutiae(img,1);
%     MinutiaeTrain(i)={minutiae};
%     
%     filename=cell2mat(testData(i));
%     img = imread(filename);
%     if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
%     img=imresize(img,[388 374]);
%     minutiae=ext_minutiae(img,1);
%     MinutiaeTest(i)={minutiae};
% end
save('MinutiaeTrain6.mat','MinutiaeTrain');
save('MinutiaeTest6.mat','MinutiaeTest');
% score=zeros(100,100);
% for i=1:1
%     X=cell2mat(MinutiaeTrain(i));
%     for j=1:100
%         Y=cell2mat(MinutiaeTest(j));
%         score(i,j)=match(X,Y);
%     end
%     disp(i);
% end
% save('score.mat','score');