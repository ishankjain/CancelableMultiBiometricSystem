f1=load('ft_test_face1');
f1=f1.ft_test_face;
f2=load('ft_test_face2');
f2=f2.ft_test_face;
f3=load('ft_test_face3');
f3=f3.ft_test_face;
test = cat(1,f1,f2,f3);
f1=load('ft_train_face1');
f1=f1.ft_train_face;
f2=load('ft_train_face2');
f2=f2.ft_train_face;
f3=load('ft_train_face3');
f3=f3.ft_train_face;
train = cat(1,f1,f2,f3);

save('test.mat', 'test');
save('train.mat', 'train');