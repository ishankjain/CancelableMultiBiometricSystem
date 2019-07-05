%% main training
%%
% clear; clc;
addpath(genpath(pwd));
bin = 10;
angle = 180;
L=3;
addpath('./train');
addpath('./test');
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

ft_train_face = cell(n_sub,1);
for n = 1:n_sub
%     for nn = 1:n_samples
        
        I = [ num2str(n) '_1.tif'];
%         disp(I);
        I = imread(I);
%         I= rgb2gray(I);
        I = imresize(I,[480,360]);
        gaborArray = gaborFilterBank(5,8,39,39); 
        featureVector = gaborFeatures(I,gaborArray,4,4);
        ft_train_face(n,1) = {featureVector};
        %(s-1)*n_samples + ii,:
%     end
end
save('ft_train_face1.mat', 'ft_train_face');

%% TESTIND DATA EXTRACTION
ft_test_face = cell(n_sub,1);
for nn = 1:n_sub
        I = [num2str(nn) '_2.tif'];
        disp(I);
        I = imread(I);
%         I = rgb2gray(I);
        I = imresize(I,[480,360]);
        gaborArray = gaborFilterBank(5,8,39,39); 
        featureVector = gaborFeatures(I,gaborArray,4,4);
        ft_test_face(nn,1) = {featureVector};

end

save('ft_test_face1.mat', 'ft_test_face');
