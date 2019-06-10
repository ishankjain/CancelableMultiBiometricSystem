addpath(genpath(pwd));
path='FVC2002/DB1_A/';
Files=dir(path);
user=1;
i=1;
trainData={};
testData={};
while user<=100
    filename=Files(i).name;  
    filename=(strcat(path,filename));
    if(strcmp(filename,strcat(path,'.')) || strcmp(filename,strcat(path,'..')) || strcmp(filename,strcat(path,'.DS_Store')) || strcmp(filename,strcat(path,'._.DS_Store' )))
        i=i+1;
        continue;
    end
    trainData(user,1)={filename};
    
    filename=Files(i+1).name;  
    filename=(strcat(path,filename));
    if(strcmp(filename,strcat(path,'.')) || strcmp(filename,strcat(path,'..')) || strcmp(filename,strcat(path,'.DS_Store')) || strcmp(filename,strcat(path,'._.DS_Store' )))
        i=i+1;
        continue;
    end
    testData(user,1)={filename};
    user=user+1;
    i=i+12;
end
save('trainData.mat','trainData');
save('testData.mat','testData');