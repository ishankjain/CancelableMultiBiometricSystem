% clc; clear;
n_sub = 100;

load('score_iris.mat');

%%

l=1;   
k=1;

for i = 1:n_sub
    for j = 1:n_sub
         if i==j                      % j*n_s >= i && i > j*n_s-n_s
            g_iris(l) = sim(i,j);
%             g(l) = hd(i,j);
            l = l+1;
        else

            im_iris(k) = sim(i,j);
%               im(k) = hd(i,j);
            k = k+1;
        end
    end
end

%%

save('iris_dataset_I','g_iris','im_iris');
var_g=var(g_iris); % variance
var_im=var(im_iris);
avg_g=mean(g_iris); %mean
avg_im=mean(im_iris);
d=(avg_g-avg_im)/sqrt((var_g+var_im)/2); %decidability


%% frequency distribution


load('iris_dataset_I');
[count, bins] = hist(g_iris);
[count1, bins1] = hist(im_iris);
count = smooth(count,'lowess');
count1 = smooth(count1,'lowess');  %lowess
plot(bins,count/100*100,'-s',bins1,count1/9900*100,'-d','linewidth',4);
xlabel('Score');
ylabel('Normalized Frequency');
% legend('Genuine Scores','Imposter Scores');

h = legend('Genuine Scores','Imposter Scores', 'Location','northeast');
set(h,'FontSize',14);

% opt.XLim = [0, 1]; % set x axis limit
% opt.YLim = [0, 50]; % set y axis limit
% 
% 
% % Save? comment the following line if you do not want to save
% opt.FileName = 'fdiris2.jpg'; 
% 
% % create the plot
% setPlotProp(opt);


%  [EER, OP]=EER_DET_conf(g_iris,im_iris,1,1000);
% 
% save('g_iris.mat','g_iris');
% save('im_iris.mat','im_iris');


