#https://github.com/rasmusbergpalm/DeepLearnToolbox
#addpath('DeepLEarnToolbox/NN')
#addpath('DeepLEarnToolbox/util')

#loading data
fid=fopen('t10k-images-idx3-ubyte','r','b');
fread(fid,4,'int32')
test_img=fread(fid,[28*28,10000],'uint8');
test_img=test_img'; #size 10000x784
fclose(fid);

fid=fopen('t10k-labels-idx1-ubyte','r','b');
fread(fid,2,'int32')
test_lbl=fread(fid,10000,'uint8');#10000x1
fclose(fid);

fid=fopen('train-images-idx3-ubyte','r','b');
fread(fid,4,'int32')
train_img=fread(fid,[28*28,60000],'uint8');
train_img=train_img'; #size 60000x784
fclose(fid);

fid=fopen('train-labels-idx1-ubyte','r','b');
fread(fid,2,'int32')
train_lbl=fread(fid,60000,'uint8'); #60000x1
fclose(fid);

#standardization of data 
mu=mean(train_img); #1x784
sigma = max(std(train_img),eps); #1x784
train_img_st = (train_img-mu)./sigma;
test_img_st = (test_img-mu)./sigma; #10000x784

A=eye(10,10);
train_d=A(train_lbl+1,:); #target vector 60000x10
test_d=A(test_lbl+1,:); #target vector   10000x10

#nn with 784 input, 100 units inter.layer, 10 units output
nn = nnsetup([784 100 10]);
opts.numepochs = 1;
opts.batchsize=100;

[nn,L] =nntrain(nn,train_img_st,train_d,opts);

pred = nnpredict(nn,test_img);
#pred(1:10)'
#test_lbl(1:10)'
sum(pred-1==test_lbl)/10000*100