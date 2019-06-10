path='Published_database_FV-USM_Dec2013/1st_session/raw_data/';
Files=dir(path);
FingerVein={};
count=1;
for i=1:length(Files)
    path2=strcat(path,Files(i).name);
    finger=dir(path2);
    if(strcmp(path2,strcat(path,'.')) || strcmp(path2,strcat(path,'..')) || strcmp(path2,strcat(path,'.DS_Store')) || strcmp(path2,strcat(path,'._.DS_Store' )))
        continue;
    end
    path2=strcat(path2,'/');
    for j=1:length(finger)
        iname=strcat(path2,finger(j).name);
        if(strcmp(iname,strcat(path2,'.')) || strcmp(iname,strcat(path2,'..')) || strcmp(iname,strcat(path2,'.DS_Store')) || strcmp(iname,strcat(path2,'._.DS_Store' )))
            continue;
        end
        img=imread(iname);
        img=img.';
        img = im2double(img); % Read the image
        img = imresize(img,0.5);               % Downscale image
        
        fvr = lee_region(img,4,40);    % Get finger region
        max_iterations = 3000; r=1; W=17; % Parameters
        v_repeated_line = miura_repeated_line_tracking(img,fvr,max_iterations,r,W);
        
        % Binarise the vein image
        md = median(v_repeated_line(v_repeated_line>0));
        v_repeated_line_bin = v_repeated_line > md;
        FingerVein(count)={v_repeated_line_bin};
        count=count+1;
    end
end
save('FingerVein.mat','FingerVein');