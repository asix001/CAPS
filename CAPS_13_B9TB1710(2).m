#addpath('DeepLEarnToolbox/NN')
#addpath('DeepLEarnToolbox/util')

acc=zeros(1,6);

nn1 = nnsetup([784 100 100 10]);
[nn1,L] =nntrain(nn1,train_img_st,train_d,opts);
pred1=nnpredict(nn1,test_img_st);
acc(1,1)=sum(pred1-1==test_lbl)/10000*100;

nn2 = nnsetup([784 50 50 50 50 50 50 10]);
[nn2,L] =nntrain(nn2,train_img_st,train_d,opts);
pred2=nnpredict(nn2,test_img_st);
acc(1,2)=sum(pred2-1==test_lbl)/10000*100;

nn3 = nnsetup([784 300 200 10]);
[nn3,L] =nntrain(nn3,train_img_st,train_d,opts);
pred3=nnpredict(nn3,test_img_st);
acc(1,3)=sum(pred3-1==test_lbl)/10000*100;

nn4 = nnsetup([784 300 200 10]);
[nn4,L] =nntrain(nn4,train_img_st,train_d,opts);
pred4=nnpredict(nn4,test_img_st);
acc(1,4)=sum(pred4-1==test_lbl)/10000*100;

nn5 = nnsetup([784 400 10]);
[nn5,L] =nntrain(nn5,train_img_st,train_d,opts);
pred5=nnpredict(nn5,test_img_st);
acc(1,5)=sum(pred5-1==test_lbl)/10000*100;

nn6 = nnsetup([784 500 10]);
[nn6,L] =nntrain(nn6,train_img_st,train_d,opts);
pred6=nnpredict(nn6,test_img_st);
acc(1,6)=sum(pred6-1==test_lbl)/10000*100;


#the accuracies of nn,nn2,nn3,nn4
acc