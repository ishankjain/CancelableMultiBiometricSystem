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

% trainfinger1 = cell(n_sub,1);
k=210;
for nn = 1:n_sub
%     for nn = 1:n_samples
        I = [ 'pb_00' num2str(floor(k/10)) '_' num2str(mod(k,10)) '_0.bmp'];
        k=k+1;
        disp(I);
        I = imread(I);
%         I= rgb2gray(I);
        I = imresize(I,[150,150]);
        gaborArray = gaborFilterBank(5,8,39,39); 
        featureVector = gaborFeatures(I,gaborArray,4,4);
        trainfinger1(nn,:) = featureVector;
        %(s-1)*n_samples + ii,:
%     end
end
save('trainfinger1.mat', 'trainfinger1');

%% TESTIND DATA EXTRACTION
% testfinger1 = cell(n_sub,1);
k=210;
for nn = 1:n_sub
        I = ['pb_00' num2str(floor(k/10)) '_' num2str(mod(k,10)) '_1.bmp'];
        k=k+1;
        disp(I);
        I = imread(I);
%         I = rgb2gray(I);
        I = imresize(I,[150,150]);
        gaborArray = gaborFilterBank(5,8,39,39); 
        featureVector = gaborFeatures(I,gaborArray,4,4);
        testfinger1(nn,:) = featureVector;

end

save('testfinger1.mat', 'testfinger1');
