
% function createSmallDataSet()
    addpath(genpath(pwd));
    path='ubiris/';
    Files=dir(path);
    user=1;
    i=1;
    trainData={};
%     validationData={};
    testData={};
    while user<=100
        path2=strcat(path,Files(i).name);
        iris=dir(path2);
        if(strcmp(path2,strcat(path,'.')) || strcmp(path2,strcat(path,'..')) || strcmp(path2,strcat(path,'.DS_Store')) || strcmp(path2,strcat(path,'._.DS_Store' )))
            i=i+1;
            continue;
        end
        path2=strcat(path2,'/');
        for j=1:length(iris)
            iname=strcat(path2,iris(j).name);
            if(strcmp(iname,strcat(path2,'.')) || strcmp(iname,strcat(path2,'..')) || strcmp(iname,strcat(path2,'.DS_Store')) || strcmp(iname,strcat(path2,'._.DS_Store' )))
                continue;
            end
            trainData(user,1)={iname};
            iname=strcat(path2,iris(j+1).name);
%             validationData(user,1)={iname};
%             iname=strcat(path2,iris(j+2).name);
            testData(user,1)={iname};
            break;
        end
        disp(user);
        i=i+1;
        user=user+1;
    end
    save('trainData.mat','trainData');
%     save('validationData.mat','validationData');
    save('testData.mat','testData');
% end