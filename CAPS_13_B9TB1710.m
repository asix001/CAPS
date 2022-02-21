#addpath('DeepLEarnToolbox/NN')
#addpath('DeepLEarnToolbox/util')

#loading data
fid=fopen('train-images-idx3-ubyte','r','b');
fread(fid,4,'int32')
train_img=fread(fid,[28*28,60000],'uint8');
train_img=train_img'; #60000x784
fclose(fid);

fid=fopen('train-labels-idx1-ubyte','r','b');
fread(fid,2,'int32')
train_lbl=fread(fid,60000,'uint8'); #60000x1
fclose(fid);

fid=fopen('t10k-images-idx3-ubyte','r','b');
fread(fid,4,'int32')
test_img=fread(fid,[28*28,10000],'uint8');
test_img=test_img'; #10000x784
fclose(fid);

fid=fopen('t10k-labels-idx1-ubyte','r','b');
fread(fid,2,'int32')
test_lbl=fread(fid,10000,'uint8');#10000x1
fclose(fid);

#standardization of data 
mu=mean(train_img); #1x784
sigma = max(std(train_img),eps); #1x784
train_img_st = (train_img-mu)./sigma;#60000x784
test_img_st = (test_img-mu)./sigma; #10000x784

A=eye(10,10);
train_d=A(train_lbl+1,:); #target vector 60000x10
test_d=A(test_lbl+1,:); #target vector   10000x10

#nn with 784 input, 100 units intermediate layer, 10 units output
nn = nnsetup([784 100 10]);

opts.numepochs = 1; #number of full sweeps through data
opts.batchsize=100; #takes a mean gradient step over this many samples

pred=zeros(10000,10);
sums=zeros(1,10);

#training nn 10 times
for i=1:10
   [nn,L] =nntrain(nn,train_img_st,train_d,opts);
   pred(:,i)=nnpredict(nn,test_img_st);
   sums(1,i)=sum(pred(:,i).-1==test_lbl)/10000*100;
endfor

#plotting the accuracy of nn
xx=1:1:10;
plot(xx,sums(1,xx),"o")
set(gca,"fontsize",14);
xlabel("training counts");
ylabel("accuracy");

nn2 = nnsetup([784 30 30 10]);

pred2=zeros(10000,10); #predicted numbers
sums2=zeros(1,10); #accuracy

for i=1:10
   [nn2,L] =nntrain(nn2,train_img_st,train_d,opts);
   pred2(:,i)=nnpredict(nn2,test_img_st);
   sums2(1,i)=sum(pred2(:,i).-1==test_lbl)/10000*100;
endfor

#plotting accuracy of nn2
hold on
plot(xx,sums2(1,xx),"o")

#evaluating difference between nn and nn2
diff=sums-sums2;
figure 
plot(xx,diff(1,xx),"o");
set(gca,"fontsize",14);
xlabel("training counts");
title("difference in accuracies between NNs");

##comparing differently layered NNs

acc=zeros(1,4);

nn1 = nnsetup([784 100 50 10]);
[nn1,L] =nntrain(nn1,train_img_st,train_d,opts);
pred1=nnpredict(nn1,test_img_st);
acc(1,1)=sum(pred1-1==test_lbl)/10000*100;

nn2 = nnsetup([784 50 50 50 50 50 50 10]);
[nn2,L] =nntrain(nn2,train_img_st,train_d,opts);
pred2=nnpredict(nn2,test_img_st);
acc(1,2)=sum(pred2-1==test_lbl)/10000*100;

nn3 = nnsetup([784 300 100 10]);
[nn3,L] =nntrain(nn3,train_img_st,train_d,opts);
pred3=nnpredict(nn3,test_img_st);
acc(1,3)=sum(pred3-1==test_lbl)/10000*100;

nn4 = nnsetup([784 400 10]);
[nn4,L] =nntrain(nn4,train_img_st,train_d,opts);
pred4=nnpredict(nn4,test_img_st);
acc(1,4)=sum(pred4-1==test_lbl)/10000*100;


#the accuracies of nn1,nn2,nn3,nn4
acc
