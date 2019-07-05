%% main training
%%
% clear; clc;
addpath(genpath(pwd));
bin = 10;
angle = 180;
L=3;
% addpath('./train');
% addpath('./test');
%addpath('train exp');      % total faces per subject = 10;
% total faces per subject = 10;
%addpath('./test 150');
%addpath('./train 150');
%n_training = 1;              % number of face-samples for training;
%num_testing = 2;             % face-sample number for testing;
n_sub = 100;                  % number of subjects;
%n_samples = 1;               % number of samples of each subject    
roi = [50;200;10;300];


%% for defining the size of matrices;
% I_demo = '1_0.bmp';
% I_demo = imread(I_demo);
% gaborArray = gaborFilterBank(5,8,39,39);
% p_demo = gaborFeatures(I_demo,gaborArray,4,4);
% ft_train_face = zeros(n_sub*n_samples, size(p_demo));
% ft_test_face = zeros(n_sub, size(p_demo));

%% TRAINING DATA EXTRACTION

% trainface2 = cell(n_sub,1);
for n = 1:n_sub
%     for nn = 1:n_samples
        
        I = ['1 (' num2str(n) ').tif'];
%         disp(I);
        I = imread(I);
%         I= rgb2gray(I);
        I = imresize(I,[150,150]);
        gaborArray = gaborFilterBank(5,8,39,39); 
        featureVector = gaborFeatures(I,gaborArray,4,4);
        trainface2(n,:) = featureVector;
        %(s-1)*n_samples + ii,:
%     end
end
save('trainface2.mat', 'trainface2');

%% TESTIND DATA EXTRACTION
% testface2 = cell(n_sub,1);
for nn = 1:n_sub
        I = ['2 (' num2str(nn) ').tif'];
%         disp(I);
        I = imread(I);
%         I = rgb2gray(I);
        I = imresize(I,[150,150]);
        gaborArray = gaborFilterBank(5,8,39,39); 
        featureVector = gaborFeatures(I,gaborArray,4,4);
        testface2(nn,:) = featureVector;

end

save('testface2.mat', 'testface2');